package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.service.ICrowdsourcingService;
import com.annotation.service.IDTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
@Repository
public class CrowdsourcingServiceImpl implements ICrowdsourcingService {
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    DtExtractionMapper dtExtractionMapper;
    @Autowired
    ParagraphMapper paragraphMapper;
    @Autowired
    DTaskMapper dTaskMapper;

    @Autowired
    IDTaskService idTaskService;
    @Autowired
    TestExtractionDataMapper testExtractionDataMapper;

    private static CrowdsourcingServiceImpl  crowdsourcingService ;
    @PostConstruct //通过@PostConstruct实现初始化bean之前进行的操作
    public void init() {
        crowdsourcingService = this;
        crowdsourcingService.idTaskService = this.idTaskService;

        // 初使化时将已静态化的testService实例化
    }

    //信息抽取众包任务的分配
    @Override
    public ParagraphLabelEntity extractionCrowdsourcing(int userId, int taskId) {
        ParagraphLabelEntity data = new ParagraphLabelEntity();
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        int pid;
        idTaskService.addDTask(userId,38,"test",10);
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
                if("notest".equals(dTask.getCurrentStatus()) || dTask.getCurrentStatus() == null){
                pid = dTask.getPid();
                Paragraph paragraph = paragraphMapper.selectByPrimaryKey(pid);
                data = new ParagraphLabelEntity(paragraph);
                }else{
                    TestExtractionData tempData = testExtractionDataMapper.selectDataId(dTask.getPid());
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
            data = this.extractionFirsttask(task,userId);
            return data;
        }
    }

    @Override
    public ParagraphLabelEntity extractionFirsttask(Task task,int userId){
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
            TestExtractionData tempdata = testExtractionDataMapper.selectByTaskid(task.getTid(),1);

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
            if(currenttask == totaltask-1 || curfrequence > 4){
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
