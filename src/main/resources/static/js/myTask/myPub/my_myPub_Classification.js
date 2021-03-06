/**
 * 分类任务处理函数
 * Created by lenovo on 2018/12/20.
 */

/**
 * 获取任务的详细信息
 */
var taskInfo;//任务相关信息
var labelList;//label的列表
var documentList=new Array;//文件列表
var docStatus="全部";


/**
 * 做任务必传的值
 */
var taskId;//从页面跳转中获取
var docId;//从documentList中获取
var userId;

/**
 * 页面处理要用的数据
 */
var paraIndex=0;//文章的段落数，document->content
var paraContent=new Array;//每段的内容

var alreadyDone=new Array;//每段已经选中的label


var curParaIndex=0;//当前正在做的页面的索引
var para_label=new Array;//二维数组，存储content-label的对应关系
var labelLength;//label的数量
var curLabelIndex=0;//当前被选中的label
var ajaxTag=0;

/**
 * 页面的控件ID
 * @type {Array}
 */
var panel_footer_index=new Array;//段落处页脚数字的跳转ID，用来控制显示第几段
var label_list_img=new Array;//标签前面图片的ID

$(function () {

    /**
     * 任务列表跳转时获得参数，形如http://localhost:8080/doTask3.html?taskid=7
     * @type {string}
     */
    var loc = location.href; //console.log("loc===="+loc);
    var index = loc.indexOf('?');
    var str = loc.substring(index + 1);
    var arr = str.split('&');
    var taskidArr=arr[0].split("=");
    taskId = taskidArr[1];
    var userIdArr=arr[1].split("=");
    userId = userIdArr[1];

    var subtaskIdArr=arr[2].split("=");
    subtaskId = subtaskIdArr[1];
    console.log("subtaskId:"+subtaskId);
    /**
     *ajax获取task详细信息
     */
    ajaxTaskInfo(taskId);


    /**
     * 点击我要做任务显示的面板，
     * 同时将任务详细信息折叠面板设为hide
     */
    $("#input-dotask").click(function(){
       // $("#row-div-dotask").show();
        $('#taskInfoPanel').collapse('hide');

    });


    /**
     * ajaxdoTask提交事件
     */
    $("#submit-paraLabel").click(function(){
        //ajaxTag=0;//用来判定是否有失败的标签
        //console.log(para_label);
        var ajaxLabelId=new Array;
        var ajaxLabelNum=0;
        for(var i=0;i<labelLength;i++){
            console.log(curParaIndex);
            if(para_label[i]>-1){
                ajaxLabelId[ajaxLabelNum]=labelList[i].lid;
                ajaxLabelNum++;

            }
        }

        if(ajaxLabelId==null || ajaxLabelId==""){
            alert("您还没选择标签");
        }else{
            var doTaskData={
                taskId :taskId,
                paraId:subtaskId,
                labelId:ajaxLabelId,
                userId:0,
                dtId:0
            };
            //console.log(doTaskData);
            /**
             * 调用ajax上传标签
             */
            ajaxdoTaskInfo(doTaskData);
        }



    });

    //下一个任务
    $("#nexttask").click(function(){
        ajaxNextTask();
    });

    $("#lasttask").click(function () {
        ajaxLastTask();
    });

});


/**
 * 选中label的事件
 * @param obj
 */
function imgClick(obj) {
    var i=obj.substring(15,obj.length);
    curLabelIndex=parseInt(i);
    console.log(curLabelIndex);
    if($("#"+label_list_img[i]).hasClass("noClick")){

        alert("该段已经完成，不可以点击！");
    }else{
        if($("#"+label_list_img[i]).hasClass("isAns")){
            $("#"+label_list_img[i]).attr("src","/images/notAns.png");
            $("#"+label_list_img[i]).addClass("notAns").removeClass("isAns");

            para_label[curLabelIndex]=-1;
            curLabelIndex=-1;
            //console.log(para_label);
        }else{
            $("#"+label_list_img[i]).attr("src","/images/isAnsBlue.png");
            $("#"+label_list_img[i]).removeClass("notAns").addClass("isAns");
            para_label[curLabelIndex]=curLabelIndex;
            //console.log(para_label);
        }
    }


};



/**
 * 获取任务的详细信息，taskInfo,labelList,documentList
 * @param taskId
 */
function ajaxTaskInfo(taskId) {
    var taskid={
        tid:taskId,
        typeId:2,
        userId:0
    };

    $.ajax({
        url: "/task/detail",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:taskid,
        success: function (data) {

            console.log(data);
            taskInfo=data.data; //console.log(taskInfo);
            labelList=data.data.labelList;//console.log(labelList);
            documentList =data.data.documentList;//console.log(documentList);
            //docId=documentList[0].did;//console.log(docId);


            /**
             * 页面上输入相关信息
             */
            $("#taskTitle").html(taskInfo.title);
            $("#taskDescription").html(taskInfo.description);
            $("#taskOtherInfo").html(taskInfo.otherinfo);
            $("#taskCreateTime").html(taskInfo.createtime);
            $("#taskDeadline").html(taskInfo.deadline);
            $("#pubUserName").html(taskInfo.pubUserName);
            /**
             * 处理文件列表
             */
            var taskFileListHtml="";
            var docSelectHtml='<select name="doc" id="doc" lay-filter="selectDoc"> ';
            for(var i=0;i<documentList.length;i++){
                var taskFileHtml="";
                console.log(documentList.length);
                if(documentList[i].filetype==".txt"){
                    taskFileHtml= '<p><a id="taskfile-'+i+'" onclick="taskFileId(this.id)"><img src="/images/TXT.png">'
                        +documentList[i].filename+'</a></p>';
                }else if(documentList[i].filetype==".doc"){
                    taskFileHtml=  '<p><a id="taskfile-'+i+'" onclick="taskFileId(this.id)"><img src="/images/DOC.png">'
                        +documentList[i].filename+'</a></p>';
                }else if(documentList[i].filetype==".docx"){
                    taskFileHtml= '<p><a id="taskfile-'+i+'" onclick="taskFileId(this.id)"><img src="/images/DOCX.png">'
                        +documentList[i].filename+'</a></p>';
                }
                taskFileListHtml=taskFileListHtml+taskFileHtml;
                if(i==0){
                    var docSelect=  '<option value="'+documentList[i].did+'" selected>' +
                        documentList[i].filename +
                        '</option>';
                    docSelectHtml=docSelectHtml+docSelect;
                }else{
                    var docSelect=  '<option value="'+documentList[i].did+'">' +
                        documentList[i].filename +
                        '</option>';
                    docSelectHtml=docSelectHtml+docSelect;
                }

            }

            docSelectHtml=docSelectHtml+ '</select>';
            $("#doc-div").html(docSelectHtml);
            $("#taskFiles").append(taskFileListHtml);

            layui.use(['form', 'layedit'], function() {

                var form = layui.form;
                form.on('select(selectDoc)', function(data){
                    docId=data.value;
                });

                form.on('select(selectStatus)', function(data){
                    docStatus=data.elem[data.elem.selectedIndex].text;
                });

            });




            /**
             * 处理标签
             */
            var labelListHtml="";
            for(var i=0;i<labelList.length;i++){
                var labelInfoHtml='<span class="text-info" style="font-size: 18px;">' +
                    labelList[i].labelname +'、'+
                    '</span>';
                labelListHtml=labelListHtml+labelInfoHtml;
            }
            $("#taskLabels").append(labelListHtml);


            ajaxDocContent();

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });

    
}

/**
 * 获取文件的内容
 *
 */
function ajaxDocContent() {
    var docid={
        userId:userId,
        taskId:taskId,
        subtaskId:subtaskId
    };
    $.ajax({
        url: "/classify/detail",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {

            console.log(data.data);
            if(data.data.length==0){
                alert("该文档已经全部完成,请查看其他文档或进行其他任务");
            }

            /**
             * 左边文件内容的显示处理
             */
            para_label=new Array;
            paraContent=data.data.paracontent;//每段内容
            alreadyDone=data.data.alreadyDone;
            subtaskId=data.data.pid;//console.log(subtaskId[i]);//每段内容的ID
            $("#p-para").html(paraContent);

            //$("#div-para-footer").html(div_footer);//显示页脚

            /**
             * 调用label处理函数
             */
            labelHtml(labelList);

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}

/**
 * label部分的初始化
 * @param labelList
 */
function labelHtml(labelList) {

    labelLength =labelList.length;

    var label_html="";
    /*
    labelList: [{lid: 2, labelname: "垃圾邮件"}, {lid: 1, labelname: "广告邮件"}, {lid: 64, labelname: "就业推荐邮件"}]
    0: {lid: 2, labelname: "垃圾邮件"}
    1: {lid: 1, labelname: "广告邮件"}
    2: {lid: 64, labelname: "就业推荐邮件"}

    */

    /*
alreadyDone: [{dtd_id: 8, label_id: 2}, {dtd_id: 9, label_id: 1}]
0: {dtd_id: 8, label_id: 2}
1: {dtd_id: 9, label_id: 1}

    */

    /**
     * 将值都初始化为-1，选中label则替换
     */
    for(var i=0;i<paraIndex;i++){
        for(var j=0;j<labelLength;j++){
            para_label[i][j]=-1;
        }
    }
    var tmpAlreadyDoneLabel=new Array;

    /**
     * 将已经选过的label存入临时变量
     */
    if(alreadyDone && alreadyDone.length>0){
        console.log(alreadyDone);
        for(var i=0;i<alreadyDone.length;i++){
            tmpAlreadyDoneLabel[i]=alreadyDone[i].label_id;
        }
    }

    for(var i=0;i<labelLength;i++){
        if(tmpAlreadyDoneLabel.indexOf(labelList[i].lid)!=-1){
            var list_html ='<li class="list-group-item">'
                +'<img class="isAns" src="/images/isAnsBlue.png" id="label-list-img-'+i+'" onclick="imgClick(this.id)">'
                +labelList[i].labelname
                +'</li>';
            label_html =label_html+list_html;
            label_list_img[i]="label-list-img-"+i;
            para_label[i]=i;
        }else{
            var list_html ='<li class="list-group-item">'
                +'<img class="notAns" src="/images/notAns.png" id="label-list-img-'+i+'" onclick="imgClick(this.id)">'
                +labelList[i].labelname
                +'</li>';
            label_html =label_html+list_html;
            label_list_img[i]="label-list-img-"+i;
        }
    }

    $("#ul-label-list").html(label_html);



};


/**
 * 做任务上传自己的标签
 * @param doTaskData
 */
function ajaxdoTaskInfo(doTaskData) {

    $.ajax({
        url: "/classify",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "text",
        data:doTaskData,
        success: function (data) {
            window.alert("当前数据提交成功");
            console.log(data);
        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


};


function ajaxNextTask() {
    var currentTaskInfo={
        subtaskId: subtaskId,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/classify/nextdonetask",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:currentTaskInfo,

        success: function (data) {
            if(data.data==null || data.data==""){
                alert("这已经是最后一个任务了");
                return null;
            }
            cleardata();
            paraContent=data.data.paracontent;//每段内容
            console.log("data.data："+JSON.stringify(data));
            subtaskId=data.data.pid;//console.log(subtaskId[i]);//每段内容的ID
            $("#p-para").html(paraContent);
            curParaIndex=data.data.paraindex-1;
            alreadyDone=data.data.alreadyDone;
            labelHtml(labelList);
        }, error: function (XMLHttpRequest, textStatus, errorThrown,data) {
        },
    });
};

//申请上一个任务的数据
function ajaxLastTask(){
    var currentTaskInfo={
        subtaskId: subtaskId,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/classify/lastdonetask",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:currentTaskInfo,
        success: function (data) {
            if(data.data==null || data.data==""){
                alert("这已经是第一个任务了");
                return null;
            }else{
                cleardata();
                paraContent=data.data.paracontent;//每段内容
                console.log("data.data："+JSON.stringify(data));
                subtaskId=data.data.pid;//console.log(subtaskId[i]);//每段内容的ID
                $("#p-para").html(paraContent);
                curParaIndex=data.data.paraindex-1;
                alreadyDone=data.data.alreadyDone;
                labelHtml(labelList);
            }

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {

        },
    });
};

function cleardata() {
    label_list_img = new Array();
}