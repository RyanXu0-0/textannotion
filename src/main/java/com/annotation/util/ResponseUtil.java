package com.annotation.util;

import com.annotation.model.entity.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/2/4.
 * 这里定义的是各种错误码和返回信息
 */
@Component
public class ResponseUtil {
    /**
     * 错误码
     * @param code
     * @return
     */
    public ResponseEntity judgeResult(int code){
        ResponseEntity responseEntity=new ResponseEntity();

        switch (code){
            case 1001:
                responseEntity.setStatus(1001);
                responseEntity.setMsg("用户不存在!");
                break;
            case 1002:
                responseEntity.setStatus(1002);
                responseEntity.setMsg("用户密码错误!");
                break;
            case 1003:
                responseEntity.setStatus(1003);
                responseEntity.setMsg("该邮箱已经被注册!");
                break;
            case 1004:
                responseEntity.setStatus(1004);
                responseEntity.setMsg("注册失败，请检查!");
                break;
            case 1005:
                responseEntity.setStatus(1005);
                responseEntity.setMsg("修改失败，请检查!");
                break;
            case 2001:
                responseEntity.setStatus(2001);
                responseEntity.setMsg("没有上传文件，请重新上传");
                break;
            case 2002:
                responseEntity.setStatus(2002);
                responseEntity.setMsg("文件格式不正确");
                break;
            case 2003:
                responseEntity.setStatus(2003);
                responseEntity.setMsg("文件大小超出限制");
                break;
            case 2004:
                responseEntity.setStatus(2004);
                responseEntity.setMsg("有段落内容为空");
                break;
            case 2005:
                responseEntity.setStatus(2005);
                responseEntity.setMsg("有段落内容字数超出限制");
                break;
            case 2006:
                responseEntity.setStatus(2006);
                responseEntity.setMsg("文件信息插入失败");
                break;
            case 2007:
                responseEntity.setStatus(2007);
                responseEntity.setMsg("有paragraph插入失败");
                break;
            case 2008:
                responseEntity.setStatus(2008);
                responseEntity.setMsg("instance中的item个数不正确");
                break;
            case 2009:
                responseEntity.setStatus(2009);
                responseEntity.setMsg("文件中有的item为空");
                break;
            case 2010:
                responseEntity.setStatus(2010);
                responseEntity.setMsg("有文本字数超过限制");
                break;
            case 2011:
                responseEntity.setStatus(2011);
                responseEntity.setMsg("有instance插入失败");
                break;
            case 2012:
                responseEntity.setStatus(2012);
                responseEntity.setMsg("有item插入失败");
                break;
            case 2013:
                responseEntity.setStatus(2013);
                responseEntity.setMsg("每个instance中的list的个数不正确");
                break;
            case 2014:
                responseEntity.setStatus(2014);
                responseEntity.setMsg("文件中有的listitem为空");
                break;
            case 2015:
                responseEntity.setStatus(2015);
                responseEntity.setMsg("文件中有的listitem超过字数限制,文件分段内容长度太长");
                break;
            case 2016:
                responseEntity.setStatus(2016);
                responseEntity.setMsg("有listItem插入失败");
                break;
            case 2017:
                responseEntity.setStatus(2017);
                responseEntity.setMsg("每段至少两个句子");
                break;
            case 2018:
                responseEntity.setStatus(2018);
                responseEntity.setMsg("文件中有的句子为空");
                break;
            case 2019:
                responseEntity.setStatus(2019);
                responseEntity.setMsg("有文本字数超过限制");
                break;
            case 2020:
                responseEntity.setStatus(2020);
                responseEntity.setMsg("文件内容格式错误，请检查！");
                break;
            case 3001:
                responseEntity.setStatus(3001);
                responseEntity.setMsg("添加任务失败，请检查");
                break;
            case 3002:
                responseEntity.setStatus(3002);
                responseEntity.setMsg("任务-文件关系插入失败");
                break;
            case 3003:
                responseEntity.setStatus(3003);
                responseEntity.setMsg("标签插入失败");
                break;
            case 3004:
                responseEntity.setStatus(3004);
                responseEntity.setMsg("文件-标签关系插入失败");
                break;
            case 3005:
                responseEntity.setStatus(3005);
                responseEntity.setMsg("instance标签插入失败");
                break;
            case 3006:
                responseEntity.setStatus(3006);
                responseEntity.setMsg("instance-标签关系插入失败");
                break;
            case 3007:
                responseEntity.setStatus(3007);
                responseEntity.setMsg("item1标签插入失败");
                break;
            case 3008:
                responseEntity.setStatus(3008);
                responseEntity.setMsg("instance_label表的item1关系插入失败");
                break;
            case 3009:
                responseEntity.setStatus(3009);
                responseEntity.setMsg("item2标签插入失败");
                break;
            case 3010:
                responseEntity.setStatus(3010);
                responseEntity.setMsg("instance_label表的item2关系插入失败");
                break;
            case 4001:
                responseEntity.setStatus(4001);
                responseEntity.setMsg("做任务失败");
                break;
            case 4002:
                responseEntity.setStatus(4002);
                responseEntity.setMsg("做任务段落para插入失败");
                break;
            case 4003:
                responseEntity.setStatus(4003);
                responseEntity.setMsg("做任务信息抽取插入失败");
                break;
            case 4004:
                responseEntity.setStatus(4004);
                responseEntity.setMsg("做任务分类任务插入失败");
                break;
            case 4005:
                responseEntity.setStatus(4005);
                responseEntity.setMsg("更新任务参与人数失败");
                break;
            case 4006:
                responseEntity.setStatus(4006);
                responseEntity.setMsg("做任务段落instance插入失败");
                break;
            case 4007:
                responseEntity.setStatus(4007);
                responseEntity.setMsg("做任务的instance标签插入失败");
                break;
            case 4008:
                responseEntity.setStatus(4008);
                responseEntity.setMsg("做任务的item1标签插入失败");
                break;
            case 4009:
                responseEntity.setStatus(4009);
                responseEntity.setMsg("做任务的item2标签插入失败");
                break;
            case 4010:
                responseEntity.setStatus(4010);
                responseEntity.setMsg("你还没有开始这个任务");
                break;
            case 4011:
                responseEntity.setStatus(4011);
                responseEntity.setMsg("该文件你的段落还没有全部完成");
                break;
            case 4012:
                responseEntity.setStatus(4012);
                responseEntity.setMsg("结束任务失败");
                break;
            case 4013:
                responseEntity.setStatus(4013);
                responseEntity.setMsg("该段落你还没有做");
                break;
            case -4:
                responseEntity.setStatus(-1);
                responseEntity.setMsg("文件-标签关系插入失败");
                //插入数据库有错误时整体回滚

                break;
            default:
                responseEntity.setStatus(0);
                responseEntity.setMsg("创建任务成功");
//                Map<String, Object> data = new HashMap<>();
//                StringBuffer fileids = new StringBuffer();
//                data.put("taskid", taskRes);//返回文件id，方便后续添加任务
//                data.put("docIds",docids);
//                responseEntity.setData(data);
        }
        return responseEntity;
    }

    /**
     * TaskController里面结果校验
     * @param taskRes
     * @param docids
     * @return
     */
    public ResponseEntity judgeTaskController(ResponseEntity taskRes, List<Integer> docids){
        if (taskRes.getStatus() != 0) {
            //插入数据库有错误时整体回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return taskRes;
        } else {
            Map<String, Object> data = new HashMap<>();
            StringBuffer fileids = new StringBuffer();
            data.put("taskId", taskRes.getData());//返回文件id，方便后续添加任务
            data.put("docIds", docids);
            taskRes.setData(data);
            return taskRes;
        }
    }

    public ResponseEntity judgeDoTaskController(int dtid){
        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setStatus(0);
        responseEntity.setMsg("添加做任务表成功");
        Map<String, Object> data = new HashMap<>();
        data.put("dtid", dtid);//返回做任务id
        responseEntity.setData(data);
        return responseEntity;
    }
}
