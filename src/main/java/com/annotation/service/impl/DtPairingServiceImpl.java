package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.DInstance;
import com.annotation.model.DTask;
import com.annotation.model.Task;
import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.model.entity.PairingData;
import com.annotation.model.entity.resHandle.ResPairingData;
import com.annotation.service.IDtPairingService;
import com.annotation.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class DtPairingServiceImpl implements IDtPairingService {

    @Autowired
    DtPairingMapper dtPairingMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ExcelUtil excelUtil;




    /**
     * 根据文件ID查询instance+listitem
     * 文本配对关系
     * @param docId
     * @return
     */
    public List<InstanceListitemEntity> queryInstanceListitem(int docId, int userId,String status,int taskId){

        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){

                List<InstanceListitemEntity> instanceListitemEntityList=dtPairingMapper.selectInstanceListitem(docId,userId,dTask.getTkid());
                return instanceListitemEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<InstanceListitemEntity> instanceListitemEntityList=dtPairingMapper.selectPairingWithStatus(data);
                return instanceListitemEntityList;
            }
        }else{
            List<InstanceListitemEntity> instanceListitemEntityList=dtPairingMapper.selectPairing(docId);
            return instanceListitemEntityList;
        }



    }







    /**
     * 做任务---文本关系配对
     * todo:更新状态的逻辑
     * todo:了解数据库事务

     * @param userId
     * @param aListItemId
     * @param bListItemId
     * @return
     */
    @Transactional
    public String addPairing(int taskId,int docId,int instanceId,int userId,int[] aListItemId,int[] bListItemId,String taskType){
        //先判断d_task表有没有插入
        int dTaskId;
        DTask dTaskSelect=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTaskSelect != null){

            dTaskId=dTaskSelect.getTkid();
        }else{
            DTask dTask=new DTask();
            dTask.setUserId(userId);
            dTask.setTaskId(taskId);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dTask.setDotime(df.format(new Date()));
            dTask.setDstatus("进行中");
            dTask.setDpercent("0%");

            int totalPart=instanceMapper.countTotalPart(taskId);
            dTask.setTotalpart(totalPart);
            dTask.setAlreadypart(0);

            int dTaskRes=dTaskMapper.insert(dTask);
            if(dTaskRes<0){
                return "-1";
            }else{
                dTaskId=dTask.getTkid();
            }

            Task task=taskMapper.selectTaskById(taskId);
            task.setAttendnum(task.getAttendnum()+1);
            int taskRes=taskMapper.updateById(task);
            if(taskRes<0){
//                responseEntity=responseUtil.judgeResult(4005);
//                return responseEntity;
            }


        }

        //插入d_instance
        int dtid;
        DInstance dInstanceSelect=dInstanceMapper.selectByDtaskIdAndInstId(dTaskId,instanceId,docId);

        if(dInstanceSelect!=null){

            dtid=dInstanceSelect.getDtid();
        }else{
            dInstanceMapper.alterDInstanceTable();
            DInstance dInstance =new DInstance();
            dInstance.setDocumentId(docId);
            dInstance.setDtaskId(dTaskId);
            dInstance.setDtstatus("进行中");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dInstance.setDotime(df.format(new Date()));
            dInstance.setInstanceId(instanceId);

            int dParaRes=dInstanceMapper.insert(dInstance);
            if(dParaRes<0){
                return "-2";
            }else{
                dtid=dInstance.getDtid();
            }




        }

        dtPairingMapper.alterDtPairingTable();
        if(taskType.equals("文本配对#一对一")){
            String iRes=insertOneToOneRelations(dtid,aListItemId,bListItemId);
            if(!iRes.equals("0")){
                return iRes;
            }
        }else if(taskType.equals("文本配对#一对多")){
            String iRes=insertOneToManyRelations(dtid,aListItemId,bListItemId);
            if(!iRes.equals("0")){
                return iRes;
            }
        }else if(taskType.equals("文本配对#多对多")){
            String iRes=insertManyToManyRelations(dtid,aListItemId,bListItemId);
            if(!iRes.equals("0")){
                return iRes;
            }
        }

        //返回做任务ID
        return dtid+"";
    }








    public String insertOneToOneRelations(int dtInstId,int[] aListitemId,int[] bListitemId){

        StringBuffer sb=new StringBuffer();

        sb.append(0);

        for(int i=0;i<aListitemId.length;i++){
            int dtdItemRelationRes = dtPairingMapper.insertRelationListByOneToOne(dtInstId,aListitemId[i],bListitemId[i]);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }
        return sb.toString();
    }


    public String insertOneToManyRelations(int dtInstId,int[] aListitemId,int[] bListitemId){

        StringBuffer sb=new StringBuffer();

        sb.append(0);

        for(int i=0;i<aListitemId.length;i++){
            int dtdItemRelationRes = dtPairingMapper.insertRelationListByOneToMany(dtInstId,aListitemId[i],bListitemId[i]);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }
        return sb.toString();
    }


    public String insertManyToManyRelations(int dtInstId,int[] aListitemId,int[] bListitemId){

        StringBuffer sb=new StringBuffer();

        sb.append(0);

        for(int i=0;i<aListitemId.length;i++){
            int dtdItemRelationRes = dtPairingMapper.insertRelationListByManyToMany(dtInstId,aListitemId[i],bListitemId[i]);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }
        return sb.toString();
    }





   public List<PairingData> queryPairingData(int tid){
        List<PairingData> pairingDataList=dtPairingMapper.getPairingDataOut(tid);
        return pairingDataList;
   }


   public HSSFWorkbook getPairingExcel( List<PairingData> pairingDataList){
       String[] title = {"用户名","文件名","段落索引","列表1","列表2"};

       String sheetName = "文本配对数据导出";


           HSSFWorkbook wb = excelUtil.getPairingExcel(sheetName, title, pairingDataList, null);
           return wb;


   }

    public List<ResPairingData> queryResPairingData(int tid, int docId, int instanceIndex){
        List<ResPairingData> resPairingDataList=dtPairingMapper.getResPairingData(tid,docId,instanceIndex);
        return resPairingDataList;
    }


}
