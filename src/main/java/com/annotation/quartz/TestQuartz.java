package com.annotation.quartz;

/**
 * Created by twinkleStar on 2019/4/19.
 */


  import org.quartz.JobExecutionContext;
  import org.quartz.JobExecutionException;
  import org.slf4j.Logger;
  import org.slf4j.LoggerFactory;
  import org.springframework.stereotype.Component;

@Component
public class TestQuartz implements BaseTaskJob {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    public  int i = 0;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        i++;
        System.out.println("task2>>>>>>>  " + i);
        logger.error("task2>>>>>>>  " + i);

        try {
            //          QuartzJobManager.getInstance().jobdelete(this.getClass().getSimpleName(),"ah");//执行完此任务就删除自己
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
