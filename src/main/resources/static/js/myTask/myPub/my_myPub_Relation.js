/**
 * 分类任务处理函数
 * Created by lenovo on 2018/12/20.
 */

/**
 * 获取任务的详细信息
 */
var taskInfo;//任务相关信息
var documentList=new Array;//文件列表
// var labelList;//label的列表
var taskType;

var instanceItem;//文件内容
var instanceLength//instance长度
var curInstanceIndex=0;//当前的instanceIndex

/**
 * 存储后台传来的三个label
 */
var instanceLabel;
var item1Label;
var item2Label;

/**
 * 可选的标签数量
 */
var limitInstanceLabelNum;
var limitItem1LabelNum;
var limitItem2LabelNum;

/**
 * 当前标签数量
 */
var curInstanceLabelNum;
var curItem1LabelNum;
var curItem2LabelNum;

/**
 * 做任务必传的值
 */

var taskId;//从页面跳转中获取
var docId;//从documentList中获取
var docStatus="全部";
var userId;

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
    $("#input-dotask").click(function(){
        $("#div-instance-item").show();

        $('#taskInfoPanel').collapse('hide');

    });
    $("#select-docStatus").click(function(){
        ajaxDocInstanceItem(docId);
    });


    $("#submit-item").click(function(){

        var doTaskInstance=new Array;
        var doTaskInstanceNum=0;

        var doTaskItem1=new Array;
        var doTaskItem1Num=0;

        var doTaskItem2=new Array;
        var doTaskItem2Num=0;


        for(var i=0;i<instanceLabel.length;i++){
            if(instanceLabel[i].chosen==1){
                doTaskInstance[doTaskInstanceNum]=instanceLabel[i].lid;
                doTaskInstanceNum++;
            }
        }

        for(var i=0;i<item1Label.length;i++){
            if(item1Label[i].chosen==1){
                doTaskItem1[doTaskItem1Num]=item1Label[i].lid;
                doTaskItem1Num++;
            }
        }

        for(var i=0;i<item2Label.length;i++){
            if(item2Label[i].chosen==1){
                doTaskItem2[doTaskItem2Num]=item2Label[i].lid;
                doTaskItem2Num++;
            }
        }
        // var item1Labels=[20,21,22];
        // var item2Labels=[20,21,22];
        // var instanceLabels=[28,21,22];

        var doTaskData={
            taskId :taskId,
            docId:docId,
            instanceId:instanceItem[curInstanceIndex].instid,
            instanceLabels:doTaskInstance,
            item1Id:instanceItem[curInstanceIndex].itemList[0].itid,
            item1Labels:doTaskItem1,
            item2Id:instanceItem[curInstanceIndex].itemList[1].itid,
            item2Labels:doTaskItem2

        };  console.log(doTaskData);

        ajaxdoTaskInfo(doTaskData);

    });

});


/**
 * 获取任务的详细信息
 * @param taskId
 */
function ajaxTaskInfo(taskId) {
    var taskid={
        tid:taskId,
        typeId:3,
        userId:0
    };
    // var taskid={
    //     tid:"12"
    // };
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
            documentList =data.data.documentList;//console.log(documentList);
            docId=documentList[0].did;//console.log(docId);
            //labelList=data.data.labelList;//console.log(labelList);
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

            /**
             * 获取文件内容，提前加载
             */
            ajaxDocInstanceItem(docId);

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


}

/**
 * 获取文件的内容
 * @param docId
 */
function ajaxDocInstanceItem(docId) {
    var docid={
        docId: docId,
        status:docStatus,
        taskId:taskId,
        userId:userId
    };
    $.ajax({
        url: "/relation/detail",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            //console.log(data);

            instanceItem=data.instanceItem; //console.log(instanceItem);
            instanceLength=instanceItem.length;
            instanceLabel=data.instanceLabel;
            item1Label=data.item1Label;
            item2Label=data.item2Label;

            limitInstanceLabelNum=instanceItem[0].labelnum;

            // curInstanceIndex=0;
            console.log(curInstanceIndex);
            var itemList= instanceItem[0].itemList;

            limitItem1LabelNum=itemList[0].labelnum;
            limitItem2LabelNum=itemList[1].labelnum;

            /**
             * 写入内容
             */

            paintContent(curInstanceIndex);
            // $("#p-item-0").html(itemList[0].itemcontent);
            // $("#p-item-1").html(itemList[1].itemcontent);

            paintLabelHtml(instanceLabel,item1Label,item2Label);

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
 * 侧边导航的操作
 * @param obj
 */
function curInstanceId(obj) {

    $("#"+ul_li_instanceIndex[curInstanceIndex]).removeClass("active");
    var i_Str=obj.substring(2);  console.log(i_Str);
    curInstanceIndex=parseInt(i_Str);console.log(curInstanceIndex);

    /**
     * 重新绘制label
     */
    paintLabelHtml(instanceLabel,item1Label,item2Label);

    $("#"+ul_li_instanceIndex[curInstanceIndex]).addClass("active");


    paintContent(curInstanceIndex);

}

/**
 * 绘制内容
 */
function paintContent(curInstanceIndex){

    /**
     * 重新绘制内容
     */
    var itemList= instanceItem[curInstanceIndex].itemList;
    $("#p-item-0").html(itemList[0].itemcontent);
    $("#p-item-1").html(itemList[1].itemcontent);
};



/**
 * 输出label面板
 * @param instanceLabel
 * @param item1Label
 * @param item2Label
 */
function paintLabelHtml(instanceLabel,item1Label,item2Label) {

    //console.log(instanceItem[curInstanceIndex]);
    //console.log(instanceLabel);
   // console.log(item1Label);
    //console.log(item2Label);

    /**
     * 临时变量
     * @type {Array}
     */
    var tmpInstanceAlready=new Array;
    var tmpInstanceNum=0;

    var tmpItem1Already=new Array;
    var tmpItem1Num=0;

    var tmpItem2Already=new Array;
    var tmpItem2Num=0;

    /**
     * 将已经选过的label存入对应的临时变量，方便后续
     */
    if(instanceItem[curInstanceIndex].alreadyDone.length>0){
        var tmpAlreadyDone=instanceItem[curInstanceIndex].alreadyDone;
        console.log(tmpAlreadyDone);
        for(var i=0;i<tmpAlreadyDone.length;i++){
            if(tmpAlreadyDone[i].labeltype=="instance"){
                tmpInstanceAlready[tmpInstanceNum]=tmpAlreadyDone[i].labelId;
                tmpInstanceNum++;
                console.log(tmpInstanceAlready);
            }else if(tmpAlreadyDone[i].labeltype=="item1"){
                tmpItem1Already[tmpItem1Num]=tmpAlreadyDone[i].labelId;
                tmpItem1Num++;
                console.log(tmpItem1Already);
            }else if(tmpAlreadyDone[i].labeltype=="item2"){
                tmpItem2Already[tmpItem2Num]=tmpAlreadyDone[i].labelId;
                tmpItem2Num++;
                console.log(tmpItem2Already);
            }
        }

    }

    curInstanceLabelNum=tmpInstanceNum;
    curItem1LabelNum=tmpItem1Num;
    curItem2LabelNum=tmpItem2Num;

    /**
     * 写入instance的标签
     * @type {string}
     */
    var instanceHtml='<h4 style="line-height:10pt">';
    for(var i=0;i<instanceLabel.length;i++){
        instanceLabel[i].chosen=0;
        if(tmpInstanceAlready.indexOf(instanceLabel[i].lid)!=-1){
            var tmpHtml=' <span class="label label-success">' +
                instanceLabel[i].labelname +
                '</span>';
            instanceHtml=instanceHtml+tmpHtml;
        }else{
            var tmpHtml=' <span class="label label-default" id="instance-label-'+i+'" flag="0" ilabeltype="instance" >' +
                instanceLabel[i].labelname +
                '</span>';
            instanceHtml=instanceHtml+tmpHtml;
        }
    }
    instanceHtml=instanceHtml+'</h4>';
    $("#instance-label-div").html(instanceHtml);

    /**
     * 写入item1的标签
     * @type {string}
     */
    var item1Html='<h4 style="line-height:10pt">';
    for(var i=0;i<item1Label.length;i++){
        item1Label[i].chosen=0;
       // console.log(item1Label[i].lid);
       // console.log(tmpItem1Already);
        if(tmpItem1Already.indexOf(item1Label[i].lid)!=-1){
            var tmpHtml=' <span class="label label-success">' +
                item1Label[i].labelname +
                '</span>';
            item1Html=item1Html+tmpHtml;
        }else{
            var tmpHtml=' <span class="label label-default" id="item1-label-'+i+'" flag="0" ilabeltype="item1">' +
                item1Label[i].labelname +
                '</span>';
            item1Html=item1Html+tmpHtml;
        }
    }
    item1Html=item1Html+'</h4>';
    $("#item1-label-div").html(item1Html);


    /**
     * 写入item2的标签
     * @type {string}
     */
    var item2Html='<h4 style="line-height:10pt">';
    for(var i=0;i<item2Label.length;i++){
        item2Label[i].chosen=0;
        if(tmpItem2Already.indexOf(item2Label[i].lid)!=-1){
            var tmpHtml=' <span class="label label-success">' +
                item2Label[i].labelname +
                '</span>';
            item2Html=item2Html+tmpHtml;
        }else{
            var tmpHtml=' <span class="label label-default" id="item2-label-'+i+'" flag="0" ilabeltype="item2">' +
                item2Label[i].labelname +
                '</span>';
            item2Html=item2Html+tmpHtml;
        }
    }
    item2Html=item2Html+'</h4>';
    $("#item2-label-div").html(item2Html);
};

/**
 * 点击标签的操作
 * @param obj
 */
function changeLabelColor(obj) {

    /**
     * 添加所选的标签
     */
    if($("#"+obj).attr("flag")==0){
        //console.log(obj);


        /**
         * 根据类型设置chosen=1
         */
        if($("#"+obj).attr("ilabeltype")=="instance"){

            if(limitInstanceLabelNum>curInstanceLabelNum){
                var i=obj.substring(15,obj.length);
                instanceLabel[parseInt(i)].chosen=1;

                curInstanceLabelNum++;
                //console.log(instanceLabel);
                $("#"+obj).attr("flag","1");
                $("#"+obj).addClass("label-primary").removeClass("label-default");

            }else{
                alert("已经超过最大可以选择的标签数量");
            }


        }else if($("#"+obj).attr("ilabeltype")=="item1"){

            if(limitItem2LabelNum>curItem1LabelNum){
                var i=obj.substring(12,obj.length);
                item1Label[parseInt(i)].chosen=1;

                curItem1LabelNum++;
                // console.log(item1Label);
                $("#"+obj).attr("flag","1");
                $("#"+obj).addClass("label-primary").removeClass("label-default");
            }else{
                alert("已经超过最大可以选择的标签数量");
            }

        }else if($("#"+obj).attr("ilabeltype")=="item2"){

            if(limitItem2LabelNum>curItem2LabelNum){
                var i=obj.substring(12,obj.length);
                item2Label[parseInt(i)].chosen=1;
                //console.log(item2Label);

                curItem2LabelNum++;
                $("#"+obj).attr("flag","1");
                $("#"+obj).addClass("label-primary").removeClass("label-default");
            }else{
                alert("已经超过最大可以选择的标签数量");
            }

        }

        /**
         * 移除所选的标签
         */
    }else if($("#"+obj).attr("flag")==1){

        $("#"+obj).attr("flag","0");
        $("#"+obj).addClass("label-default").removeClass("label-primary");

        /**
         * 根据类型设置chosen=0
         */
        if($("#"+obj).attr("ilabeltype")=="instance"){

            var i=obj.substring(15,obj.length);
            instanceLabel[parseInt(i)].chosen=0;
            curInstanceLabelNum--;
            //console.log(instanceLabel);
        }else if($("#"+obj).attr("ilabeltype")=="item1"){

            var i=obj.substring(12,obj.length);
            item1Label[parseInt(i)].chosen=0;

            curItem1LabelNum--;
            //console.log(item1Label);
        }else if($("#"+obj).attr("ilabeltype")=="item2"){

            var i=obj.substring(12,obj.length);
            item2Label[parseInt(i)].chosen=0;
            curItem2LabelNum--;
            //console.log(item2Label);
        }
    }
};



