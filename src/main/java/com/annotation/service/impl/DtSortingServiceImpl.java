package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.DInstance;
import com.annotation.model.DTask;
import com.annotation.model.DtSorting;
import com.annotation.model.Task;
import com.annotation.model.entity.ExportSortingData;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.SortingData;
import com.annotation.model.entity.resHandle.ResSortingData;
import com.annotation.service.IDtSortingService;
import com.annotation.util.ExcelUtil;
import com.annotation.util.ResponseUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class DtSortingServiceImpl implements IDtSortingService {

    @Autowired
    DtSortingMapper dtSortingMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ExcelUtil excelUtil;



    /**
     * 根据文件的ID查询instance+Item
     * 文本关系类别
     * @param docId
     * @return
     */
    public List<InstanceItemEntity> querySortingInstanceItem(int docId , int userId,String status,int taskId){

        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){
                List<InstanceItemEntity> instanceItemEntityList=dtSortingMapper.selectSortingInstanceItem(docId,userId,dTask.getTkid());
                return instanceItemEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<InstanceItemEntity> instanceItemEntityList=dtSortingMapper.selectSortingWithStatus(data);
                return instanceItemEntityList;
            }
        }else{
            List<InstanceItemEntity> instanceItemEntityList=dtSortingMapper.selectSorting(docId);
            return instanceItemEntityList;

        }



    }




    public ResponseEntity addSorting(int taskId,int docId,int instanceId, int userId, int[] itemIds, int[] newIndexs){

        ResponseEntity responseEntity=new ResponseEntity();
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
                responseEntity.setStatus(-1);
                return responseEntity;
            }else{
                dTaskId=dTask.getTkid();
            }

            Task task=taskMapper.selectTaskById(taskId);
            task.setAttendnum(task.getAttendnum()+1);
            int taskRes=taskMapper.updateById(task);
            if(taskRes<0){
                responseEntity=responseUtil.judgeResult(4005);
                return responseEntity;
            }
        }

        //插入d_instance
        int dtid;
        DInstance dInstanceSelect=dInstanceMapper.selectByDtaskIdAndInstId(dTaskId,instanceId,docId);

        if(dInstanceSelect!=null){

            dtid=dInstanceSelect.getDtid();
        }else{
            DInstance dInstance=new DInstance();
            dInstance.setDocumentId(docId);
            dInstance.setDtaskId(dTaskId);
            dInstance.setDtstatus("进行中");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dInstance.setDotime(df.format(new Date()));
            dInstance.setInstanceId(instanceId);

            int dParaRes=dInstanceMapper.insert(dInstance);
            if(dParaRes<0){
                responseEntity.setStatus(-2);
                return responseEntity;
            }else{
                dtid=dInstance.getDtid();
            }
        }



        String iRes= insertSortingItem(dtid,itemIds,newIndexs);
        if(!iRes.equals("0#")){
            responseEntity.setStatus(-2);
            responseEntity.setMsg("添加失败");
            responseEntity.setData(iRes);
            return responseEntity;
        }


        responseEntity.setMsg("添加做任务表成功");
        Map<String, Object> data = new HashMap<>();
        data.put("dtid", dtid);//返回做任务id
        responseEntity.setData(data);
        return responseEntity;
    }



    public String insertSortingItem(int dtid,int[] itemIds,int[] newIndexs){

        StringBuffer sb=new StringBuffer();

        sb.append(0+"#");
        dtSortingMapper.alterDtSortingTable();
        DtSorting dtSorting=new DtSorting();
        dtSorting.setDtId(dtid);

        for(int i=0;i<itemIds.length;i++){

            dtSorting.setItemId(itemIds[i]);
            dtSorting.setNewindex(newIndexs[i]);
            int dtdItemRelationRes = dtSortingMapper.insert(dtSorting);
            if(dtdItemRelationRes != 1 && dtdItemRelationRes != 2){
                sb=sb.append(i+"#");
            }

        }
        return sb.toString();
    }


public int[] insertSortingItem2(int dtid,int[] itemIds,int[] newIndexs){

    int[] res=new int[itemIds.length];
    dtSortingMapper.alterDtSortingTable();
    DtSorting dtSorting=new DtSorting();
    dtSorting.setDtId(dtid);
    for(int i=0;i<itemIds.length;i++){
        dtSorting.setItemId(itemIds[i]);
        dtSorting.setNewindex(newIndexs[i]);
        int dtdItemRelationRes = dtSortingMapper.insert(dtSorting);
        if(dtdItemRelationRes != 1 && dtdItemRelationRes != 2){
            res[i]=-1;
        }else{
            res[i]=1;
        }

    }
    return res;
}


    public List<SortingData> querySortingData(int tid){
        List<SortingData> sortingDataList=dtSortingMapper.getSortingDataOut(tid);
        return sortingDataList;
    }


    public HSSFWorkbook getSortingExcel(List<SortingData> sortingDataList){
        String[] title = {"文件名","段落序号","列表分句","原序号","新序号","被选择次数"};
        String sheetName = "排序类型数据导出";
        HSSFWorkbook wb = excelUtil.getSortingExcel(sheetName, title, sortingDataList, null);
        return wb;
    }


    public List<ResSortingData> queryResSortingData(int tid, int docId, int instanceIndex){
        List<ResSortingData> resSortingDataList=dtSortingMapper.getResSortingData(tid,docId,instanceIndex);
        return resSortingDataList;
    }

    public List<ExportSortingData> querySortingDataAndroid(int tid){
        List<ExportSortingData> sortingDataList=dtSortingMapper.getSortingDataOutAndroid(tid);
        return sortingDataList;
    }
}
