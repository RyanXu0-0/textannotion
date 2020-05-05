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
var userId;

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
    var index = loc.indexOf('?');
    var str = loc.substring(index + 1);
    var arr = str.split('&');
    var taskidArr=arr[0].split("=");
    taskId = taskidArr[1];
    var userIdArr=arr[1].split("=");
    userId = userIdArr[1];
    var subtaskIdArr=arr[2].split("=");
    subtaskId = subtaskIdArr[1];

    /**
     *ajax获取task详细信息
     */
    ajaxTaskInfo(taskId);

    /**
     * 点击我要做任务显示的面板，
     * 同时将任务详细信息折叠面板设为hide
     */
    // $("#btn-dotask").click(function(){
    //    // $("#op-dotask").hide();
    //    // $("#op-button").show();
    //     $('#taskInfoPanel').collapse('hide');
    //
    // });

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
                instanceId:instanceItem.instid,
                itemIds:itemId,
                newIndex:newIndex,
                userId:0
            };
            addSortingTask(doTaskData);

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
 * 获取任务的详细信息
 * @param taskId
 */
function ajaxTaskInfo(taskId) {
    var taskid={
        tid:taskId,
        typeId:5,userId:0
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

            ajaxDocSortingInstanceItem();

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


}

/**
 * 获取文件的内容
 * @param docId
 */
function ajaxDocSortingInstanceItem() {
    var docid={
        subtaskId:subtaskId,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/sorting/detail",
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
                console.log(data)
                instanceItem=data.instanceItem; //console.log(instanceItem);
                instanceLength=instanceItem.length;
                itemList= instanceItem.itemList;
                alreadyDone=instanceItem.alreadyDone;


                /**
                 * 写入内容
                 */
                //console.log(curInstanceIndex);
                paintSortingContent(itemList,alreadyDone);


            }


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}
/**
 * 绘制可排序的面板
 * @param itemList
 * @param alreadyDone
 */
function paintSortingContent(itemList,alreadyDone) {

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



function ajaxNextTask() {
    var currentTaskInfo={
        subtaskId: instanceItem.instid,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/sorting/nextdonetask",
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
            console.log(JSON.stringify(data));
            // instanceItem=data.instanceItem; //console.log(instanceItem);
            // instanceLength=instanceItem.length;

            itemList= data.data.itemList;
            alreadyDone = data.data.alreadyDone;
            paintSortingContent(itemList,alreadyDone);
            instanceItem.instid = data.data.instid;
        }, error: function (XMLHttpRequest, textStatus, errorThrown,data) {
        },
    });
};

//申请上一个任务的数据
function ajaxLastTask(){
    var currentTaskInfo={
        subtaskId: instanceItem.instid,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/sorting/lastdonetask",
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
                console.log(JSON.stringify(data));
                prev_itemList=data.data.itemList;
                prev_alreadyDone=data.data.alreadyDone;
                paintSortingContent(prev_itemList, prev_alreadyDone);
                instanceItem.instid = data.data.instid;
            }
        }, error: function (XMLHttpRequest, textStatus, errorThrown) {

        },
    });
};


function cleardata() {
    itemId=new Array();
    newIndex=new Array();
    $("#left-sorting").empty();
}

