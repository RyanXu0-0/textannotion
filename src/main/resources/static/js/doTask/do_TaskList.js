// /**
//  * Created by lenovo on 2018/12/15.
//  */
//

var taskType="";
layui.use(['jquery', 'layer'], function(){
    var $ = layui.$ //重点处
        ,layer = layui.layer;

    //后面就跟你平时使用jQuery一样
    $(function(){
       // console.log("jinrule");

    });


});


layui.use(['table'],function(){
    var table = layui.table;
    $("#sub-search").click(function() {
        var tname = $('#taskname').val();

        // if(taskValue==0){
        //     var ttype ="";
        // }else{
        //     var ttype = taskType;
        // }
        var ttype = $('#tasktype').val();
        var pubUser = $('#pubUser').val();
        table.reload('test', {
            method: 'post' ,
            url: '/task/keyword',
            where: {
                'title': tname,
                'type': ttype,
                'pubUsername': pubUser
            }
        });
    });
});


