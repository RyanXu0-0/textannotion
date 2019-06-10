package com.annotation.service.impl;

import com.annotation.dao.DTaskMapper;
import com.annotation.dao.InstanceMapper;
import com.annotation.dao.ParagraphMapper;
import com.annotation.dao.TaskMapper;
import com.annotation.model.DTask;
import com.annotation.model.Task;
import com.annotation.service.IDTaskService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/2/4.
 */
@Repository
public class DTaskServiceImpl implements IDTaskService {

    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ParagraphMapper paragraphMapper;

    public List<DTask> queryMyPubTaskByDoingDetail(int taskId, int page, int limit){


        int startNum =(page-1)*limit;
        Map<String,Object> data =new HashMap();
        data.put("currIndex",startNum);
        data.put("pageSize",limit);
        data.put("taskId",taskId);
        List<DTask> dTaskList =dTaskMapper.selectMyPubTaskByDoingDetail(data);
        return dTaskList;
    }


    public List<DTask> queryMyDoingTask(int userId, String dstatus,int page, int limit){
        int startNum =(page-1)*limit;
        Map<String,Object> data =new HashMap();
        data.put("currIndex",startNum);
        data.put("pageSize",limit);
        data.put("userId",userId);
        data.put("dstatus",dstatus);
        List<DTask> dTaskList =dTaskMapper.selectMyDoingTaskByStatus(data);
        return dTaskList;

    }

    public int addDTaskOfPara(int userId,int taskId){
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
            int totalPart=paragraphMapper.countTotalPart(taskId);
            dTask.setTotalpart(totalPart);
            dTask.setAlreadypart(0);
            int dTaskRes=dTaskMapper.insert(dTask);
            if(dTaskRes<0){
                return 4001;
            }else{
                dTaskId=dTask.getTkid();
            }

            Task task=taskMapper.selectTaskById(taskId);
            task.setAttendnum(task.getAttendnum()+1);
            int taskRes=taskMapper.updateById(task);
            if(taskRes<0){
                return 4005;
            }
        }
        return dTaskId;
    }

    public int addDTaskOfInstance(int userId,int taskId){
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
                return 4001;
            }else{
                dTaskId=dTask.getTkid();
            }

            Task task=taskMapper.selectTaskById(taskId);
            task.setAttendnum(task.getAttendnum()+1);
            int taskRes=taskMapper.updateById(task);
            if(taskRes<0){
                return 4005;
            }
        }
        return dTaskId;
    }

}
