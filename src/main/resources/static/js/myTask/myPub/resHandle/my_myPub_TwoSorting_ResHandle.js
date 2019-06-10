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


    /**
     *ajax获取task详细信息
     */
    ajaxTaskInfo(taskId);

    /**
     * 点击我要做任务显示的面板，
     * 同时将任务详细信息折叠面板设为hide
     */
    $("#btn-dotask").click(function(){
        // $("#op-dotask").hide();
        // $("#op-button").show();
        $('#taskInfoPanel').collapse('hide');

    });

    $("#select-docStatus").click(function(){
        ajaxDocSortingInstanceItem(docId);
    });

    // var itemId=[39,37];
    // var newIndex=[1,2];
    //console.log(doTaskData);


    var itemId=new Array;
    var newIndex=new Array;
    $("#submit-sorting").click(function(){
        var ulHtml=document.getElementById('right-sorting');
        var rightLiLength=ulHtml.children.length;
        if(rightLiLength!=(itemList.length-1)){
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
                newIndex:newIndex
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
        typeId:6,
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
        userId:userId
    };
    $.ajax({
        url: "/sorting/detail",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            console.log(data);

            instanceItem=data.instanceItem; //console.log(instanceItem);
            instanceLength=instanceItem.length;
            for(var i=0;i<instanceLength;i++){
                instanceItem[parseInt(data.instanceItem[i].insindex)-1]=data.instanceItem[i];
            }
            itemList= instanceItem[curInstanceIndex].itemList;


            console.log(instanceItem);
            $("#right-sorting").html("");

            /**
             * 写入内容
             */
            //console.log(curInstanceIndex);
            var ajaxNewData={
                    instanceIndex:instanceItem[0].instid,
                    tid:taskId,
                    docId:docId,
                    userId:0
                };
            paintSortingContent(itemList);
            ajaxResHandle(ajaxNewData);


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

    $("#right-sorting").html("");
    itemList=instanceItem[curInstanceIndex].itemList;

    var ajaxNewData={
        instanceIndex:instanceItem[curInstanceIndex].instid,
        tid:taskId,
        docId:docId,
        userId:0
    };
    ajaxResHandle(ajaxNewData);


}

function ajaxResHandle(ajaxNewData) {
    $.ajax({
        url: "/sorting/result",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:ajaxNewData,
        success: function (data) {

            var resSorting=data.resSorting;
            if(resSorting.length>0){

                var tableHtml=' <table class="tablex" border="1">' +
                    '<tr>' +
                    ' <th style="text-align:center;vertical-align: middle;">列表分句</th>' +
                    ' <th style="width: 80px;text-align:center;vertical-align: middle;">原序号</th>' +
                    ' <th style="width: 80px;text-align:center;vertical-align: middle;"> 新序号</th>' +
                    ' <th style="width: 110px;text-align:center;vertical-align: middle;"> 被选择次数</th> ' +
                    '</tr>';
                for(var i=0;i<resSorting.length;i++){
                    var newSorting=resSorting[i].newSorting;
                    var newLength=newSorting.length;
                    var newSortingHtml=' <tr> ' +
                        '<td rowspan="'+newLength+'" style="vertical-align: middle;">' +resSorting[i].itemContent+
                        '</td> ' +
                        '<td rowspan="'+newLength+'" style="text-align:center;vertical-align: middle;">' +resSorting[i].preIndex+
                        '</td> ' ;

                    if(newLength==1){
                        newSortingHtml=newSortingHtml+'<td style="text-align:center;vertical-align: middle;">' +newSorting[0].newIndex+
                            '</td>' +
                            ' <td style="text-align:center;vertical-align: middle;">' +newSorting[0].newNum+
                            '</td> ' +
                            '</tr>';
                    }else{
                        newSortingHtml=newSortingHtml+'<td style="text-align:center;vertical-align: middle;">' +newSorting[0].newIndex+
                            '</td>' +
                            ' <td style="text-align:center;vertical-align: middle;">' +newSorting[0].newNum+
                            '</td> ' +
                            '</tr>';
                        for(var j=1;j<newLength;j++){
                            var jHtml='<tr> ' +
                                '<td style="text-align:center;vertical-align: middle;">' +newSorting[j].newIndex+
                                '</td> ' +
                                '<td style="text-align:center;vertical-align: middle;">' +newSorting[j].newNum+
                                '</td> ' +
                                '</tr>';
                            newSortingHtml=newSortingHtml+jHtml;
                        }
                    }

                    tableHtml=tableHtml+newSortingHtml;


                }

                tableHtml=tableHtml+'</table>';


                $("#testTable2").html(tableHtml);
            }else{
                alert("该部分还没有人参与");
                paintSortingContent(itemList);
            }
            console.log(data);

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}

/**
 * 绘制可排序的面板
 * @param itemList
 */
function paintSortingContent(itemList) {

    itemList=instanceItem[curInstanceIndex].itemList;


    //console.log(itemList);
    var rightItem=new Array;

        for(var i=0;i<itemList.length;i++){
            if(parseInt(itemList[i].itemindex)!=0){
                rightItem[parseInt(itemList[i].itemindex)]='<li drag-id="'+i+'"><span class="drag-handle">&#9776;</span>' +
                    itemList[i].itemcontent+'</li>';
            }else{
                rightItem[parseInt(itemList[i].itemindex)]='<p>' +
                    itemList[i].itemcontent+'</p>';
            }

        }
        //console.log(rightItem);



    var rightHtml="";
    /**
     * 从1开始
     */
    for(var i=1;i<rightItem.length;i++){
        rightHtml=rightHtml+rightItem[i];
    }
    //console.log(rightHtml);

    $("#testTable2").html(rightHtml);

    var leftHtml= rightItem[0];
    $("#left-sorting").html(leftHtml);

}


