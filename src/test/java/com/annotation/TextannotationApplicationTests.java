package com.annotation;

//import com.annotation.elasticsearch.document.TaskDoc;
//import com.annotation.elasticsearch.repository.TaskDocRepository;
//import com.annotation.elasticsearch.service.TaskDocService;
import com.annotation.dao.TaskMapper;
import com.annotation.model.entity.UserTaskEmail;
//import org.elasticsearch.index.query.QueryBuilders;
import com.annotation.util.EmailUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
//import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TextannotationApplicationTests {


    @Autowired
     TaskMapper taskMapper;
    @Autowired
    EmailUtil emailUtil;



    @Test
    @Scheduled(cron="0/5 * * * * ?")
    public void job(){
        System.out.println("每五秒执行一次");
    }
//    @Test
//    public void test3() throws Exception {
//
//    }


    @Test
    public void test2() throws Exception {
      String curtiem="2019-04-01 00:00:00";
      List<UserTaskEmail> userTaskEmails=taskMapper.getUserTaskEmail(curtiem);

      emailUtil.sendSimpleMail("479681178@qq.com","任务提醒",userTaskEmails);
     // System.out.println(userTaskEmails.size());
    }
//
//    @Autowired
//    TaskDocRepository taskDocRepository;
//
//    @Autowired
//    ElasticsearchTemplate elasticsearchTemplate;
//
//    @Autowired
//    TaskDocService taskDocService;

  //  @Autowired
   // ITaskService iTaskService;
//    @Test
//    public void test() {
//        TaskTest taskTest=new TaskTest();
//        taskTest.setTid(5);
//        taskTest.setAttendnum(83);
//        taskTest.setDescription("8");
//        taskTest.setTypeName("hh8");
//        taskTest.setTitle("23f");
//        taskTest.setCreatetime("g23");
//        taskTest.setOtherinfo("3g34");
//        taskDao.save(taskTest);
//
//	}


//    @Test
//    public void saveTask(){
//        List<Task> taskList=iTaskService.queryTotalTaskOfUndo(1,10);
//        for (Task task:taskList){
//            TaskDoc taskDoc=new TaskDoc();
//            taskDoc.setAttendnum(task.getAttendnum());
//            taskDoc.setViewnum(task.getViewnum());
//            taskDoc.setCreatetime(task.getCreatetime());
//            taskDoc.setDeadline(task.getDeadline());
//            taskDoc.setDescription(task.getDescription());
//            taskDoc.setOtherinfo(task.getOtherinfo());
//            taskDoc.setPubUserName(task.getPubUserName());
//            taskDoc.setTitle(task.getTitle());
//            taskDoc.setTid(task.getTid());
//            taskDoc.setTypeName(task.getTypeName());
//            taskDoc.setUserId(task.getUserId());
//            taskDoc.setTaskcompstatus(task.getTaskcompstatus());
//            taskDocRepository.save(taskDoc);
//
//        }
//
//
//    }
 //   @Test
  //  public void te(){

//        NativeSearchQueryBuilder queryBuilder = new NativeSearchQueryBuilder();
//        queryBuilder.withQuery(QueryBuilders.termQuery("typeName", "文本").boost(3));
//        queryBuilder.withQuery(QueryBuilders.matchQuery("pubUserName", "小"));
//
//        Pageable pageable = new PageRequest(0, 4);
//        queryBuilder.withPageable(pageable);
//        Page<TaskDoc> items = this.taskDocRepository.search(queryBuilder.build());
//        long total = items.getTotalElements();
//        System.out.println("总条数 = " + total);
//        System.out.println("总页数 = " + items.getTotalPages());
//        System.out.println("当前页：" + items.getNumber());
//        System.out.println("每页大小：" + items.getSize());

      //  taskDocService.saveTask();
        //elasticsearchTemplate.createIndex(TaskDoc.class);
        //elasticsearchTemplate.deleteIndex(TaskDoc.class);
 //   }

//    @Test
//    public void testQueryAll() {
//        Iterable<TaskTest> list = this.taskDao.findByAttendnumBetween(0,5);
//        for (TaskTest taskTest:list){
//            System.out.println("tasktest="+taskTest);
//        }
//
//    }
//	@Autowired
//	IUserService iUserService;
//	@Test
//	public void contextLoads() {
//		User user = iUserService.queryByUsername("hahah");
//		System.out.println(user.getPassword());
//	}

//	@Autowired
//    IuploadFileService iFileService;
//	@Test
//	public void yte(){
//		File file = new File();
//		//file.setId(2);
//		file.setAbsolutepath("hahah");
//		file.setContent("ad");
//		file.setFilename("ha");
//		file.setRelativepath("hah");
//		file.setSize("hah");
//		file.setType("hah");
//		file.setUploadtime("hha");
//		int m =iFileService.saveFile(file);
//		System.out.println(m);
//	}

//	@Test
//	public void test() throws IOException{
//		String path="F:\\test.doc";
//		String path2="F:\\test.docx";
//		String m =iFileService.readC(path);
//		String p =iFileService.readC(path2);
//		System.out.println(m);
//		System.out.println(p);
//	}

}
