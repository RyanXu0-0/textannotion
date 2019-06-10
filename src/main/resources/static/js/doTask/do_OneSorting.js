/**
 * Created by lenovo on 2019/1/11.
 */
/**
 * 获取任务的详细信息
 */
var taskType;
var taskInfo;//任务相关信息
var documentList=new Array;//文件列表
var instanceItem;//文件内容
var instanceLength//instance长度
var itemList=new Array;//instance里面listitem的内容
var alreadyDone=new Array;

/**
 * 当前的值
 */
var curInstanceIndex=0;//当前的instanceIndex

/**
 * 做任务必传的值
 */
var taskId;//从页面跳转中获取
var docId;//从documentList中获取
var docStatus="全部";

/**
 * 存放ID
 * @type {Array}
 */
var ul_li_instanceIndex=new Array;

$(function () {
    /**
     * 任务列表跳转时获得参数，形如http://localhost:8080/doTask3.html?taskid=7
     * @type {string}
     */
    var loc = location.href; //console.log("loc===="+loc);
    var taskidArr=loc.split("=");
    taskId = taskidArr[1]; //console.log(taskId);


    /**
     *ajax获取task详细信息
     */
    ajaxTaskInfo(taskId);

    /**
     * 点击我要做任务显示的面板，
     * 同时将任务详细信息折叠面板设为hide
     */
    $("#btn-dotask").click(function(){


        // $("#div-dotaskbtn").html("倒计时：0:20:09");


       $("#div-dotaskbtn").hide();
        $("#div-btn-hide").show();
        $('#taskInfoPanel').collapse('hide');

    });

    $("#complete-doc").click(function(){
        ajaxCompleteDoc(docId);
    });

    $("#complete-instance").click(function(){
        ajaxCompleteInstance(docId);
    });

    $("#select-docStatus").click(function(){
        curInstanceIndex=0;
        ajaxDocSortingInstanceItem(docId);
    });


    var itemId=new Array;
    var newIndex=new Array;
    $("#submit-sorting").click(function(){
           var ulHtml=document.getElementById('left-sorting');
           var rightLiLength=ulHtml.children.length;
           if(rightLiLength!=itemList.length){
               alert("请全部排序完成后再提交");
           }else{
               for(var i=0;i<rightLiLength;i++){
                   newIndex[i]=i+1;
                   itemId[i]=itemList[parseInt(ulHtml.children[i].getAttribute('drag-id'))].itid;
               }

               var doTaskData={
                   taskId :taskId,
                   docId:docId,
                   instanceId:instanceItem[curInstanceIndex].instid,
                   itemIds:itemId,
                   newIndex:newIndex,
                   userId:0
               };
               addSortingTask(doTaskData);
               //console.log(doTaskData);
               // console.log(newIndex);
               // console.log(itemId);
               // console.log(itemList);

           }

           // console.log(rightLiLength);
           // console.log(ulHtml.children[0].getAttribute('drag-id'));
    });
});

/**
 * 获取任务的详细信息
 * @param taskId
 */
function ajaxTaskInfo(taskId) {
    var taskid={
        tid:taskId,
        typeId:5,
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

            /**
             * 获取文件内容，提前加载
             */
            taskInfo=data.data; //console.log(taskInfo);
            documentList =data.data.documentList;//console.log(documentList);
            docId=documentList[0].did;//console.log(docId);
            taskType=data.data.type;

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
                if(documentList[i].filetype==".txt"){
                    taskFileHtml=  '<p><a id="taskfile-'+i+'" onclick="taskFileId(this.id)"><img src="/images/TXT.png">'
                        +documentList[i].filename+'</a></p>';
                }else if(documentList[i].filetype==".doc"){
                    taskFileListHtml=  '<p><a id="taskfile-'+i+'" onclick="taskFileId(this.id)"><img src="/images/DOC.png">'
                        +documentList[i].filename+'</a></p>';
                }else if(documentList[i].filetype==".docx"){
                    taskFileListHtml=  '<p><a id="taskfile-'+i+'" onclick="taskFileId(this.id)"><img src="/images/DOCX.png">'
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
            $("#taskFiles").append(taskFileListHtml);
            docSelectHtml=docSelectHtml+ '</select>';
            $("#doc-div").html(docSelectHtml);


            layui.use(['form', 'layedit'], function() {

                var form = layui.form;
                form.on('select(selectDoc)', function(data){
                    docId=data.value;
                });

                form.on('select(selectStatus)', function(data){
                    docStatus=data.elem[data.elem.selectedIndex].text;
                });

            });

            ajaxDocSortingInstanceItem(docId);

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


}

/**
 * 获取文件的内容
 * @param docId
 */
function ajaxDocSortingInstanceItem(docId) {
    var docid={
        docId: docId,
        status:docStatus,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/sorting",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            //console.log(data);
            if(data.instanceItem==null || data.instanceItem==""){
                alert("该文档已经全部完成！");
            }else{

                instanceItem=data.instanceItem; //console.log(instanceItem);
                instanceLength=instanceItem.length;
                for(var i=0;i<instanceLength;i++){
                    instanceItem[parseInt(data.instanceItem[i].insindex)-1]=data.instanceItem[i];
                }
                itemList= instanceItem[curInstanceIndex].itemList;
                alreadyDone=instanceItem[curInstanceIndex].alreadyDone;

                var sflag=0;
                for(var i=0;i<instanceItem.length;i++){

                    if(instanceItem[i].dtstatus=="已完成"){
                        sflag++;
                    }
                }

                if(sflag==instanceItem.length){
                    if(!($("#complete-doc").hasClass("disabled"))){
                        $("#complete-doc").addClass("disabled");
                        $("#complete-doc").attr("disabled","true");

                    }

                    if(!($("#complete-instance").hasClass("disabled"))){
                        $("#complete-instance").addClass("disabled");
                        $("#complete-instance").attr("disabled","true");
                    }

                    if(!($("#submit-sorting").hasClass("disabled"))){
                        $("#submit-sorting").addClass("disabled");
                        $("#submit-sorting").attr("disabled","true");
                    }
                }else{
                    if($("#complete-doc").hasClass("disabled")){
                        $("#complete-doc").removeClass("disabled");
                        $("#complete-doc").removeAttr("disabled");
                    }
                    if($("#complete-instance").hasClass("disabled")){
                        $("#complete-instance").removeClass("disabled");
                        $("#complete-instance").removeAttr("disabled");
                    }
                    if($("#submit-sorting").hasClass("disabled")){
                        $("#submit-sorting").removeClass("disabled");
                        $("#submit-sorting").removeAttr("disabled");
                    }
                }

                /**
                 * 写入内容
                 */
                //console.log(curInstanceIndex);
                paintSortingContent(itemList,alreadyDone);

                /**
                 * 左边ul导航点击定位
                 */
                var ul_html="";
                for(var i=0;i<instanceLength;i++){
                    var li_html="";
                    if(i==curInstanceIndex){
                        li_html=' <li class="active" id="li-'+i+'"><a id="a-'+i+'" onclick="curInstanceId(this.id)">' +
                            '第' + (i+1) + '部分' + '</a></li>';
                    }else{
                        li_html=' <li  id="li-'+i+'"><a id="a-'+i+'" onclick="curInstanceId(this.id)">' +
                            '第' + (i+1) + '部分' + '</a></li>';
                    }
                    ul_html=ul_html+li_html;
                    ul_li_instanceIndex[i]="li-"+i;
                }
                $("#ul-nav").html(ul_html);
            }


            if(instanceItem[curInstanceIndex].dtstatus=="已完成"){


                if(!($("#complete-instance").hasClass("disabled"))){
                    $("#complete-instance").addClass("disabled");
                    $("#complete-instance").attr("disabled","true");
                }

                if(!($("#submit-sorting").hasClass("disabled"))){
                    $("#submit-sorting").addClass("disabled");
                    $("#submit-sorting").attr("disabled","true");
                }
            }else{

                if($("#complete-instance").hasClass("disabled")){
                    $("#complete-instance").removeClass("disabled");
                    $("#complete-instance").removeAttr("disabled");
                }
                if($("#submit-sorting").hasClass("disabled")){
                    $("#submit-sorting").removeClass("disabled");
                    $("#submit-sorting").removeAttr("disabled");
                }
            }



        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}
/**
 * 左边第几部分导航的点击事件
 * @param obj
 */
function curInstanceId(obj) {

    /**
     * 移除原控件的active属性
     */
    $("#"+ul_li_instanceIndex[curInstanceIndex]).removeClass("active");
    var i_Str=obj.substring(2);  //console.log(i_Str);

    /**
     * 设置当前控件的active属性
     */
    curInstanceIndex=parseInt(i_Str);
    $("#"+ul_li_instanceIndex[curInstanceIndex]).addClass("active");

    /**
     * 重新加载右边的做任务界面
     */

    //$("#right-sorting").html("");
    itemList=instanceItem[curInstanceIndex].itemList;
    alreadyDone=instanceItem[curInstanceIndex].alreadyDone;

    paintSortingContent(itemList,alreadyDone);

    if(instanceItem[curInstanceIndex].dtstatus=="已完成"){


        if(!($("#complete-instance").hasClass("disabled"))){
            $("#complete-instance").addClass("disabled");
            $("#complete-instance").attr("disabled","true");
        }

        if(!($("#submit-sorting").hasClass("disabled"))){
            $("#submit-sorting").addClass("disabled");
            $("#submit-sorting").attr("disabled","true");
        }
    }else{

        if($("#complete-instance").hasClass("disabled")){
            $("#complete-instance").removeClass("disabled");
            $("#complete-instance").removeAttr("disabled");
        }
        if($("#submit-sorting").hasClass("disabled")){
            $("#submit-sorting").removeClass("disabled");
            $("#submit-sorting").removeAttr("disabled");
        }
    }
}

/**
 * 做任务上传自己的标签
 * @param doTaskData
 */
function addSortingTask(doTaskData) {

    $.ajax({
        url: "/sorting",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:doTaskData,
        success: function (data) {
           // console.log(data);
            if(data.status==0){
                alert("提交成功");
                ajaxDocSortingInstanceItem(docId);
            }else{
                alert("提交失败!");
            }


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


};

/**
 * 绘制可排序的面板
 * @param itemList
 * @param alreadyDone
 */
function paintSortingContent(itemList,alreadyDone) {

    itemList=instanceItem[curInstanceIndex].itemList;
    alreadyDone=instanceItem[curInstanceIndex].alreadyDone;

    var leftItem=new Array;

    var alreadyItemId=new Array;
    var alreadyNewIndex=new Array;
    if(alreadyDone.length>0){

        for(var i=0;i<alreadyDone.length;i++){
            alreadyItemId[i]=alreadyDone[i].itemId;
            alreadyNewIndex[i]=alreadyDone[i].newindex;
        }

        for(var i=0;i<itemList.length;i++){
            //console.log(alreadyItemId);
            if(alreadyItemId.indexOf(itemList[i].itid)!=-1){

                itemList[i].itemindex=alreadyNewIndex[alreadyItemId.indexOf(itemList[i].itid)];
                //console.log(alreadyItemId.indexOf(itemList[i].itid));
            }

            leftItem[parseInt(itemList[i].itemindex)]='<li drag-id="'+i+'"><span class="drag-handle">&#9776;</span>' +
                itemList[i].itemcontent+'</li>';
        }
    }else{
        for(var i=0;i<itemList.length;i++){
            leftItem[parseInt(itemList[i].itemindex)]='<li drag-id="'+i+'"><span class="drag-handle">&#9776;</span>' +
                itemList[i].itemcontent+'</li>';
        }
    }

    var leftHtml="";
    for(var i=1;i<leftItem.length;i++){
        leftHtml=leftHtml+leftItem[i];
    }

    $("#left-sorting").html(leftHtml);



}

function ajaxCompleteDoc(docId) {
    var docid={
        docId: docId,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/dinstance/doc/status",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            if(data.status==0){
                alert("该文本已经完成");
                ajaxDocSortingInstanceItem(docId);
            }else{

                alert("还有段落没有做");
            }

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
};

function ajaxCompleteInstance(docId) {
    var docid={
        docId: docId,
        taskId:taskId,
        instanceId:instanceItem[curInstanceIndex].instid,
        userId:0
    };
    $.ajax({
        url: "/dinstance/status",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            if(data.status==0){
                alert("该段已经完成");
                ajaxDocSortingInstanceItem(docId);
            }else{

                alert("该段还没有做");
            }

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
};


