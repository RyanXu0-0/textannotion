package com.annotation.service.impl;

import com.annotation.dao.DParagraphMapper;
import com.annotation.dao.DTaskMapper;
import com.annotation.dao.ParagraphMapper;
import com.annotation.model.DParagraph;
import com.annotation.model.DTask;
import com.annotation.service.IDParagraphService;
import com.annotation.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by twinkleStar on 2019/2/6.
 */
@Repository
public class DParagraphServiceImpl implements IDParagraphService {
    @Autowired
    DParagraphMapper dParagraphMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    ParagraphMapper paragraphMapper;



    public int addDParagraph(int dTaskId,int docId,int paraId){
        //插入d_paragraph


        int dtid;
        DParagraph dParagraphSelect=dParagraphMapper.selectByDtaskIdAndParaId(dTaskId,docId,paraId);

        if(dParagraphSelect!=null){
            dtid=dParagraphSelect.getDtid();
        }else{
            dParagraphMapper.alterDParagraphTable();
            DParagraph dParagraph=new DParagraph();
            dParagraph.setDocumentId(docId);
            dParagraph.setDtaskId(dTaskId);
            dParagraph.setDtstatus("进行中");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dParagraph.setDotime(df.format(new Date()));
            dParagraph.setParagraphId(paraId);

            int dParaRes=dParagraphMapper.insert(dParagraph);
            if(dParaRes<0){
                return 4002;
            }else{
                dtid=dParagraph.getDtid();
            }
        }
        return dtid;
    }

    @Transactional
    public int updateStatusByDocId(int userId,int docId,int taskId){
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask==null){
            return 4010;
        }else{
            int dTaskId=dTask.getTkid();

            int[] pids=paragraphMapper.selectParaByDocId(docId);

            int alreadyInstanceNum=dParagraphMapper.countDParaNum(docId,dTaskId);

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

            List<DParagraph> dParagraphList=dParagraphMapper.selectByDtaskIdAndDocId(dTaskId,docId);
            if(pids.length!=dParagraphList.size()){
                return 4011;
            }else {

                for(DParagraph dParagraph:dParagraphList){
                    dParagraph.setDtstatus("已完成");
                    int dRes=dParagraphMapper.updateStatusByPk(dParagraph);
                    if(dRes<0){
                        return 4012;
                    }
                }
            }
        }
        return 0;
    }

    @Transactional
    public int updateStatus(int userId,int docId,int taskId,int paraId){
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask==null){
            return 4010;
        }else{

            int dTaskId=dTask.getTkid();
            int alreadyPart=dTask.getAlreadypart()+1;
            int totalPart=dTask.getTotalpart();
            dTask.setAlreadypart(alreadyPart);

            /**
             * 保留两位小数
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
            DParagraph dParagraph=dParagraphMapper.selectByDtaskIdAndParaId(dTaskId,docId,paraId);
            if(dParagraph==null){
                return 4013;
            }else{
                dParagraph.setDtstatus("已完成");
                int dRes=dParagraphMapper.updateStatusByPk(dParagraph);
                if(dRes<0){
                    return 4012;
                }
            }

        }
        return 0;
    }


}
