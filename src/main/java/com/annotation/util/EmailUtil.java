package com.annotation.util;

import com.annotation.model.entity.UserTaskEmail;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/18.
 */
@Component
public class EmailUtil {
    @Autowired
    private JavaMailSender mailSender;


    public void sendSimpleMail(String fEmail, String subject,  List<UserTaskEmail> userTaskEmailList) throws Exception {
        for(int i=0;i<userTaskEmailList.size();i++){
           UserTaskEmail userTaskEmail =userTaskEmailList.get(i);
           List<Map<String,Object>> taskInfo=userTaskEmail.getTaskInfo();
           String userName=userTaskEmail.getUserName();
           String tEmail=userTaskEmail.getUserEmail();
           String[] taskStr=new String[taskInfo.size()];
           String totalContent=userName+",您好，您以下的任务距离截止日期不足24小时，请及时完成！";
           for(int j=0;j<taskInfo.size();j++){

               Map<String,Object> taskContent=taskInfo.get(j);
               taskStr[j]="任务标题："+taskContent.get("title")+",任务类型："+taskContent.get("title")
                       +",截止日期："+taskContent.get("deadline")+"。";
               totalContent=totalContent+taskStr[j];
           }

            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fEmail);
            message.setTo(tEmail);
            message.setSubject(subject);
            message.setText(totalContent);
            mailSender.send(message);

        }

    }

}
