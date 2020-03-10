package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.ClassifyData;
import com.annotation.model.entity.LabelCountEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDParagraphService;
import com.annotation.service.IDTaskService;
import com.annotation.service.IDtClassifyService;
import com.annotation.util.ExcelUtil;
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
public class DtClassifyServiceImpl implements IDtClassifyService {

    @Autowired
    DtClassifyMapper dtClassifyMapper;
    @Autowired
    IDTaskService idTaskService;
    @Autowired
    IDParagraphService idParagraphService;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DParagraphMapper dParagraphMapper;
    @Autowired
    ParagraphMapper paragraphMapper;
    @Autowired
    DtuCommentMapper dtuCommentMapper;
    @Autowired
    ExcelUtil excelUtil;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    TestExtractionDataMapper testExtractionDataMapper;

    /**
     * 查询content+label
     * @param docId
     * @return
     */
    public List<ParagraphLabelEntity> queryClassifyParaLabel(int docId, int userId,String status,int taskId){


        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){
                List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassifyParaLabel(docId,userId,dTask.getTkid());
                return contentLabelEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassifyWithStatus(data);
                return contentLabelEntityList;
            }
        }else{
            List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassify(docId);
            return contentLabelEntityList;
        }




        //List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassifyWithoutDocId(14,userId);

    }





    /**
     *
     * @param userId
     * @param taskId
     * @param docId
     * @param paraId
     * @param labelId
     * @return
     */
    public int addClassify(int userId,int taskId,int docId,int paraId,int[] labelId){

        //先判断d_task表有没有插入

        int dTaskId=idTaskService.addDTaskOfPara(userId,taskId);
        if(dTaskId==4001|| dTaskId==4005){
            return dTaskId;
        }

        int dtid=idParagraphService.addDParagraph(dTaskId,docId,paraId);
        if(dtid==4002){
            return dtid;
        }

        dtClassifyMapper.alterDtClassifyTable();
        for(int i=0;i<labelId.length;i++){
            DtClassify dtClassify =new DtClassify();
            dtClassify.setDtId(dtid);
            dtClassify.setLabelId(labelId[i]);
            dtClassify.setGoodlabel(0);
            dtClassify.setBadlabel(0);
            int dtClassifyRes=dtClassifyMapper.insert(dtClassify);
            if(dtClassifyRes<0){
                return 4004;
            }
        }

        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        dTask.setPid(null);
        dTask.setCurrentStatus("notest");
        dTask.setAlreadypart(dTask.getAlreadypart()+1);
        return dtid;

    }


   public DtClassify addComment(int dtdId,int cNum,int flag,int uId){
       DtClassify dtClassify=dtClassifyMapper.selectByPrimaryKey(dtdId);
        if(flag>0){
            dtClassify.setGoodlabel(dtClassify.getGoodlabel()+cNum);
            int res=dtClassifyMapper.updateByPrimaryKey(dtClassify);
            if(cNum>0){

                DtuComment dtuComment=new DtuComment();
                dtuComment.setDtdId(dtdId);
                dtuComment.setuId(uId);
                dtuComment.setCnum(1);
                int res2=dtuCommentMapper.insert(dtuComment);
            }else{

                int res3=dtuCommentMapper.deleteByDtdIdAndUId(dtdId,uId);
            }
        }else{
            dtClassify.setBadlabel(dtClassify.getBadlabel()+cNum);
            int res=dtClassifyMapper.updateByPrimaryKey(dtClassify);
            if(cNum>0){

                DtuComment dtuComment=new DtuComment();
                dtuComment.setDtdId(dtdId);
                dtuComment.setuId(uId);
                dtuComment.setCnum(-1);
                int res2=dtuCommentMapper.insert(dtuComment);
            }else{

                int res3=dtuCommentMapper.deleteByDtdIdAndUId(dtdId,uId);
            }
        }
        DtClassify dtClassifyRes=dtClassifyMapper.selectByPrimaryKey(dtdId);
        return dtClassifyRes;
   }


   public List<LabelCountEntity> queryAlreadyLabel(int tid){
       List<LabelCountEntity> labelCountEntityList=dtClassifyMapper.selectLabelCount(tid);
       return  labelCountEntityList;
   }



    public List<ClassifyData> queryClassifyData(int tid){
        List<ClassifyData> classifyDataList=dtClassifyMapper.getClassifyDataOut(tid);
        return classifyDataList;
    }


    public HSSFWorkbook getClassifyExcel(List<ClassifyData> classifyDataList){
        String[] title = {"文件名","段落序号","段落内容","标签","标签选择数"};

        String sheetName = "文本分类数据导出";

        HSSFWorkbook wb = excelUtil.getClassifyExcel(sheetName, title, classifyDataList, null);
        return wb;
    }


    public ParagraphLabelEntity getClassTask(int userId,int taskId){

        ParagraphLabelEntity data = new ParagraphLabelEntity();
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        int pid;
        Task task = taskMapper.selectTaskById(taskId);
        int currenttask = task.getCurrenttask();
        int curfrequence = task.getFrequence();
        int totaltask = task.getTotaltask();
        int startpid = task.getStartid();
        //判断任务是否分配完了
        if(currenttask == totaltask || curfrequence >= 4){return null;}
        //先看之前有没有领取过任务，有就则继续派发，再看领取的任务完成与否
        if (dTask!=null) {
            if(dTask.getPid() != null){
                //已经领取了任务，但未完成
                if("notest".equals(dTask.getCurrentStatus()) || dTask.getCurrentStatus()==null){
                    pid = dTask.getPid();
                    Paragraph paragraph = paragraphMapper.selectByPrimaryKey(pid);
                    data = new ParagraphLabelEntity(paragraph);
                }else{
                    TestExtractionData tempData = testExtractionDataMapper.selectClassifyByDataId(dTask.getPid());
                    System.out.println(tempData);
                    data.setParacontent(tempData.getContent());
                }
                return data;
            }else{
                //查找任务
                Paragraph paragraph = paragraphMapper.selectByPrimaryKey(currenttask+startpid);
                data = new ParagraphLabelEntity(paragraph);
                //更新用户当前申请的任务
                dTask.setPid(currenttask+startpid);
                dTaskMapper.updateByPrimaryKey(dTask);
                //更新task信息 currenttask{0-31},curfrequence={0123}
                if(currenttask == totaltask-1 && curfrequence < 4){
                    currenttask = 0;
                    curfrequence++;
                }else{currenttask++;}
                if(currenttask == totaltask-1 || curfrequence > 4){
                    task.setTaskcompstatus("已分配完");
                }
                task.setCurrenttask(currenttask);
                task.setFrequence(curfrequence);
                taskMapper.updateById(task);
                return data;
            }
        } else {
            data = this.getClassifyFirsttask(task,userId);
            return data;
        }
    }



    public ParagraphLabelEntity getClassifyFirsttask(Task task,int userId){
        ParagraphLabelEntity paragraphLabelEntity = new ParagraphLabelEntity();
        int currenttask = task.getCurrenttask();
        int totaltask = task.getTotaltask();
        int curfrequence = task.getFrequence();
        int startpid = task.getStartid();
        //任务已经分配完了
        if(currenttask == totaltask-1 || curfrequence > 4){
            return null;
        }

        //如果有测试集
        if("yes".equals(task.getIftest())){
            TestExtractionData tempdata = testExtractionDataMapper.selectClassifyByTaskid(task.getTid(),1);

            System.out.println(tempdata);
            paragraphLabelEntity.setParacontent(tempdata.getContent());
            paragraphLabelEntity.setPid(tempdata.getDataId());
            //插入用户当前申请的任务
            DTask dTask=new DTask();
            dTask.setUserId(userId);
            dTask.setTaskId(task.getTid());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dTask.setDotime(df.format(new Date()));
            dTask.setDstatus("进行中");
            dTask.setDpercent("0%");
            int totalPart=paragraphMapper.countTotalPart(task.getTid());
            dTask.setTotalpart(totalPart);
            dTask.setAlreadypart(0);
            dTask.setCurrentStatus("test");
            dTask.setPid(tempdata.getDataId());
            dTask.setTotaltest(0);
            dTask.setAccuracy("100%");
            dTaskMapper.insert(dTask);

            //更新task信息 currenttask{0-31},curfrequence={0123}
            if(currenttask == totaltask-1 && curfrequence < 4){
                currenttask = 0;
                curfrequence++;
            }else{currenttask++;}
            if( curfrequence > 4){
                task.setTaskcompstatus("已分配完");
            }
            task.setCurrenttask(currenttask);
            task.setFrequence(curfrequence);
            taskMapper.updateById(task);
            return paragraphLabelEntity;
        }else{
            //查找任务
            Paragraph paragraph = paragraphMapper.selectByPrimaryKey(currenttask+startpid);
            paragraphLabelEntity = new ParagraphLabelEntity(paragraph);
            //插入用户当前申请的任务
            DTask dTask=new DTask();
            dTask.setUserId(userId);
            dTask.setTaskId(task.getTid());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dTask.setDotime(df.format(new Date()));
            dTask.setDstatus("进行中");
            dTask.setDpercent("0%");
            int totalPart=paragraphMapper.countTotalPart(task.getTid());
            dTask.setTotalpart(totalPart);
            dTask.setAlreadypart(0);
            dTask.setAlreadypart(0);
            dTask.setCurrentStatus("notest");
            dTask.setPid(currenttask+startpid);
            dTask.setTotaltest(0);
            dTask.setAccuracy("100%");
            dTaskMapper.insert(dTask);

            //更新task信息 currenttask{0-31},curfrequence={0123}
            if(currenttask == totaltask-1 && curfrequence < 4){
                currenttask = 0;
                curfrequence++;
            }else{currenttask++;}
            if(currenttask == totaltask-1 || curfrequence > 4){
                task.setTaskcompstatus("已分配完");
            }
            task.setCurrenttask(currenttask);
            task.setFrequence(curfrequence);
            taskMapper.updateById(task);
            return paragraphLabelEntity;
        }
    }
}
