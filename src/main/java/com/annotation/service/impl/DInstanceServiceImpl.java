package com.annotation.service.impl;

import com.annotation.dao.DInstanceMapper;
import com.annotation.dao.DTaskMapper;
import com.annotation.dao.InstanceMapper;
import com.annotation.model.DInstance;
import com.annotation.model.DTask;
import com.annotation.service.IDInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.NumberFormat;
import java.util.List;

/**
 * Created by twinkleStar on 2019/2/8.
 */
@Repository
public class DInstanceServiceImpl implements IDInstanceService {

    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    InstanceMapper instanceMapper;



    @Transactional
    public int updateStatusByDocId(int userId,int docId,int taskId){
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask==null){
            return 4010;
        }else{
            int dTaskId=dTask.getTkid();

            int[] pids=instanceMapper.selectInstanceByDocId(docId);

            int alreadyInstanceNum=dInstanceMapper.countDInstanceNum(docId,dTaskId);

            int alreadyPart=dTask.getAlreadypart()+alreadyInstanceNum;
            int totalPart=dTask.getTotalpart();
            dTask.setAlreadypart(alreadyPart);

            /**
             * 保留两位小数
             */
            NumberFormat nf=NumberFormat.getPercentInstance();
            nf.setMinimumFractionDigits(1);
            double res=(double)alreadyPart/totalPart;
            String dpercent= nf.format(res);

            dTask.setDpercent(dpercent);
            if(alreadyPart==totalPart){
                dTask.setDstatus("已完成");
            }

            int dTaskRes=dTaskMapper.updateByPrimaryKey(dTask);
            List<DInstance> dInstanceList=dInstanceMapper.selectByDtaskIdAndDocId(dTaskId,docId);
            if(pids.length!=dInstanceList.size()){
                return 4011;
            }else {
                for(DInstance dInstance:dInstanceList){
                    dInstance.setDtstatus("已完成");
                    int dRes=dInstanceMapper.updateStatusByPk(dInstance);
                    if(dRes<0){
                        return 4012;
                    }
                }
            }
        }
        return 0;
    }


    public int updateStatus(int userId,int docId,int taskId,int instanceId){
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask==null){
            return 4010;
        }else{
            int dTaskId=dTask.getTkid();

            DInstance dInstance=dInstanceMapper.selectByDtaskIdAndInstId(dTaskId,instanceId,docId);
            if(dInstance==null){
                return 4013;
            }else {

                int alreadyPart=dTask.getAlreadypart()+1;
                int totalPart=dTask.getTotalpart();
                dTask.setAlreadypart(alreadyPart);

                /**
                 * 保留一位小数
                 */
                NumberFormat nf=NumberFormat.getPercentInstance();
                nf.setMinimumFractionDigits(1);
                double res=(double) alreadyPart/totalPart;
                String dpercent= nf.format(res);
                dTask.setDpercent(dpercent);
                if(alreadyPart==totalPart){
                    dTask.setDstatus("已完成");
                }
                int dTaskRes=dTaskMapper.updateByPrimaryKey(dTask);

                dInstance.setDtstatus("已完成");
                int dRes=dInstanceMapper.updateStatusByPk(dInstance);
                if(dRes<0){
                    return 4012;
                }
            }

        }
        return 0;
    }


}
