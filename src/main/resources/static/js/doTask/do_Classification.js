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
var dtstatus=new Array;

/**
 * 做任务必传的值
 */
var taskId;//从页面跳转中获取
var docId;//从documentList中获取

/**
 * 页面处理要用的数据
 */
var paraIndex=0;//文章的段落数，document->content
var paraContent=new Array;//每段的内容

var paraId=new Array;//每段的数据库ID，做任务传值需要-->contentid
var curParaIndex=0;//当前正在做的页面的索引
var para_label=new Array;//二维数组，存储content-label的对应关系
var labelLength;//label的数量
var curLabelIndex=0;//当前被选中的label
//var ajaxTag=0;

/**
 * 页面的控件ID
 * @type {Array}
 */
var panel_footer_index=new Array;//段落处页脚数字的跳转ID，用来控制显示第几段
var label_list_img=new Array;//标签前面图片的ID

var alreadyDone=new Array;

$(function () {

    /**
     * 任务列表跳转时获得参数，形如http://localhost:8080/doTask3.html?taskid=7
     * @type {string}
     */
    var loc = location.href; //console.log("loc===="+loc);
    var taskidArr=loc.split("=");
    taskId = taskidArr[1];

    /**
     *ajax获取task详细信息
     */
    ajaxTaskInfo(taskId);


    /**
     * 点击我要做任务显示的面板，
     * 同时将任务详细信息折叠面板设为hide
     */
    $("#input-dotask").click(function(){
        /**
         * 获取文件内容，提前加载
         */
        ajaxDocContent(docId);
        $("#row-div-dotask").show();
        $("#div-dotaskbtn").hide();
        $('#taskInfoPanel').collapse('hide');
    });


    $("#select-docStatus").click(function(){
        curParaIndex=0;
        ajaxDocContent(docId);
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
            if(para_label[curParaIndex][i]>-1){
                ajaxLabelId[ajaxLabelNum]=labelList[i].lid;
                ajaxLabelNum++;

            }
        }

        if(ajaxLabelId==null || ajaxLabelId==""){
            alert("您还没选择标签");
        }else{
            var doTaskData={
                taskId :taskId,
                docId:docId,
                paraId:paraId[curParaIndex],
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

            para_label[curParaIndex][curLabelIndex]=-1;
            curLabelIndex=-1;
            //console.log(para_label);
        }else{
            $("#"+label_list_img[i]).attr("src","/images/isAnsBlue.png");
            $("#"+label_list_img[i]).removeClass("notAns").addClass("isAns");
            para_label[curParaIndex][curLabelIndex]=curLabelIndex;
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
            docId=documentList[0].did;//console.log(docId);


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
                //console.log(documentList.length);
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


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


}

/**
 * 获取文件的内容
 * @param docId
 */
function ajaxDocContent(docId) {
    var docid={
        docId: docId,
        status:docStatus,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/classify",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {

            console.log(data.data);
            if(data.data==null || data.data==""){
                alert("该文档已经全部完成,请查看其他文档或进行其他任务");
            }else{
                /**
                 * 左边文件内容的显示处理
                 */
                paraIndex =data.data.length;//段落数
                var sflag=0;
                // var div_footer='<div class="text-center">';
                for(var i=0;i<paraIndex;i++){
                    //todo:可以合并存
                    para_label[i]=new Array;
                    paraContent[i]=data.data[i].paracontent;//每段内容
                    dtstatus[i]=data.data[i].dtstatus;
                    paraId[i]=data.data[i].pid;//console.log(paraId[i]);//每段内容的ID
                    if(data.data[i].dtstatus=="已完成"){

                        sflag++;
                    }

                }
                /**
                 * 调用label处理函数
                 */
                labelHtml(labelList);

                $("#p-para").html(paraContent[curParaIndex]);


                if(curParaIndex==0){
                    if(dtstatus[0]=="已完成"){

                        console.log(dtstatus[0]);
                        //todo:设置右边标签不可以被选中

                        for(var i=0;i<labelLength;i++){
                            // if(para_label[0][i]>-1) {
                            //     $("#" + label_list_img[i]).attr("src", "/images/isAnsBlue.png");
                            //     $("#" + label_list_img[i]).removeClass("notAns").addClass("isAns");
                            // }

                            if($("#" + label_list_img[i]).hasClass("notAns")) {
                                $("#" + label_list_img[i]).attr("src", "/images/noClick.png");
                                $("#" + label_list_img[i]).removeClass("notAns").addClass("noClick");
                            }

                        }
                        //todo:设置提交按钮不可以被提交
                        if(!($("#complete-para").hasClass("disabled"))){
                            $("#complete-para").addClass("disabled");
                            $("#complete-para").attr("disabled","true");
                        }

                    }else{

                        for(var i=0;i<labelLength;i++){
                            if(para_label[0][i]>-1) {
                                $("#" + label_list_img[i]).attr("src", "/images/isAnsBlue.png");
                                $("#" + label_list_img[i]).removeClass("notAns").addClass("isAns");
                            }

                            if($("#" + label_list_img[i]).hasClass("noClick")) {
                                $("#" + label_list_img[i]).attr("src", "/images/notAns.png");
                                $("#" + label_list_img[i]).removeClass("noClick").addClass("notAns");
                            }

                        }
                        if($("#complete-para").hasClass("disabled")){
                            $("#complete-para").removeClass("disabled");
                            $("#complete-para").removeAttr("disabled");

                        }
                    }
                }

                //$("#div-para-footer").html(div_footer);//显示页脚

                $('.Pagination').pagination({
                    pageCount: paraIndex,
                    coping: true,
                    mode:'fixed',
                    count:6,
                    homePage: '首页',
                    endPage: '末页',
                    prevContent: '上页',
                    nextContent: '下页',
                    callback: function (api) {
                        //console.log(api.getCurrent());

                        curParaIndex=api.getCurrent()-1;
                        $("#p-para").html(paraContent[curParaIndex]);//显示第1段内容

                        var curParaIndexNum =parseInt(curParaIndex);
                        $("#span-index").html("第"+(curParaIndexNum+1)+"段");//设置内容面板的标题
                        $("#p-para").html(paraContent[curParaIndex]);//设置内容

                        labelHtml(labelList);

                        for(var i=0;i<labelLength;i++){
                            if(para_label[curParaIndexNum][i]>-1) {
                                $("#" + label_list_img[i]).attr("src", "/images/isAnsBlue.png");
                                $("#" + label_list_img[i]).removeClass("notAns").addClass("isAns");
                            }

                        }

                        if(dtstatus[curParaIndexNum]=="已完成"){
                            for(var i=0;i<labelLength;i++){

                                if($("#" + label_list_img[i]).hasClass("notAns")) {
                                    $("#" + label_list_img[i]).attr("src", "/images/noClick.png");
                                    $("#" + label_list_img[i]).removeClass("notAns").addClass("noClick");
                                }

                            }

                            if(!($("#complete-para").hasClass("disabled"))){
                                $("#complete-para").addClass("disabled");
                                $("#complete-para").attr("disabled","true");
                            }
                        }else{
                            for(var i=0;i<labelLength;i++){

                                if($("#" + label_list_img[i]).hasClass("noClick")) {
                                    $("#" + label_list_img[i]).attr("src", "/images/notAns.png");
                                    $("#" + label_list_img[i]).removeClass("noClick").addClass("notAns");
                                }

                            }
                            if($("#complete-para").hasClass("disabled")){
                                $("#complete-para").removeClass("disabled");
                                $("#complete-para").removeAttr("disabled");

                            }
                        }

                    }
                });

            }


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
            para_label[curParaIndex][i]=i;
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
        subtaskId: paraId[0],
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/classify/nexttask",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:currentTaskInfo,

        success: function (data) {
            if(data.code != 0){
                window.alert(data.msg);
                return null;
            }
            cleardata();
            paraContent[0]=data.data.paracontent;//每段内容
            console.log("data.data："+JSON.stringify(data));
            paraId[0]=data.data.pid;//console.log(paraId[i]);//每段内容的ID
            $("#p-para").html(paraContent[0]);
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
        subtaskId: paraId[0],
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/classify/lasttask",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:currentTaskInfo,
        success: function (data) {
            if(data.data==null || data.data==""){
                alert("这已经是第一个任务了");
            }else{
                cleardata();
                paraContent[0]=data.data.paracontent;//每段内容
                console.log("data.data："+JSON.stringify(data));
                paraId[0]=data.data.pid;//console.log(paraId[i]);//每段内容的ID
                $("#p-para").html(paraContent[0]);
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