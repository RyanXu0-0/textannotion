/**
 * 文本关系配对处理函数
 * Created by lenovo on 2018/12/20.
 */

/**
 * 获取任务的详细信息
 */
var taskInfo;//任务相关信息
var documentList=new Array;//文件列表
var instanceItem;//文件内容
var instanceLength;//instance长度
var listItem= new Array;//instance里面listitem的内容
var taskType;

/**
 * 当前的值
 */
var curInstanceIndex=0;//当前的instanceIndex
var x1;//左边
var x2;
var y1;//右边
var y2;
var curLeftId;
var curRightId;

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


/**
 * 存储的值
 */
var lineLR=new Array;//页面上已经绘制的线
var tempNum=new Array;

var lineLRInit=new Array;//页面上已经绘制的线
var tempNumInit=new Array;

/**
 * 左右分开存储
 */




$(function ($) {

    /**
     * 任务列表跳转时获得参数，形如http://localhost:8080/doTask3.html?taskid=7
     * @type {string}
     */
    var loc = location.href; console.log("loc===="+loc);
    var index = loc.indexOf('?');
    var str = loc.substring(index + 1);
    var arr = str.split('&');
    var taskidArr=arr[0].split("=");
    taskId = taskidArr[1];console.log(taskId);
    var userIdArr=arr[1].split("=");
    userId = userIdArr[1];console.log(userId);


    $("#select-docStatus").click(function(){
        ajaxDocInstanceItem(docId);
    });
    /**
     * 对连线的li进行初始化
     * @param options
     */
    $.fn.onLine = function (options) {
        var box = this; //console.log(this);

        /**
         * 对上下两个div进行初始化，设定绘画的位置
         */
        box.find(".showleft").children("li").each(function (index, element) {
            $(this).attr({
                left: $(this).position().left + $(this).outerWidth(),
                top: $(this).position().top + $(this).outerHeight() / 2
            });
        });
        box.find(".showright").children("li").each(function (index, element) {

            $(this).attr({
                left:box.find(".showright").position().left+$(this).position().left,
                top: $(this).position().top + $(this).outerHeight() / 2
            });

        });

        var canvas =box.find(".canvas")[0];  //获取canvas  实际连线标签
        canvas.width=box.find(".show").width();//canvas宽度等于div容器宽度
        canvas.height=box.find(".show").height();

        var canvas2 =box.find(".backcanvas")[0];  //获取canvas  实际连线标签
        canvas2.width=box.find(".show").width();//canvas宽度等于div容器宽度
        canvas2.height=box.find(".show").height();

    };

    /**
     *ajax获取task详细信息
     */
    ajaxTaskInfo(taskId);

    /**
     * 点击我要做任务显示的面板，
     * 同时将任务详细信息折叠面板设为hide
     */
    $("#btn-dotask").click(function(){

        $("#op-dotask").hide();
        $("#op-button").show();
        $('#taskInfoPanel').collapse('hide');


    });

    /**
     * 后退一步，等于重新画页面
     * todo:看看有没有其他更好的方法
     */
    $("#backOneStep").click(function(){
        /**
         * 先清除整个画布
         * @type {Element}
         */
        var canvas = document.getElementById('canvas-front');
        var cWidth=$("#canvas-front").attr("width");
        var cHeight=$("#canvas-front").attr("height");
        var context = canvas.getContext('2d');
        context.clearRect(0,0,cWidth,cHeight);

        /**
         * 临时存储连线的点和几条线
         */
        var tempArr = jQuery.extend(true, {}, lineLR[curInstanceIndex]); console.log(lineLR);
        var tempN=tempNum[curInstanceIndex]-1;

        /**
         * 清除原数据
         * @type {number}
         */
        tempNum[curInstanceIndex]=0;
        lineLR[curInstanceIndex]=new Array;

        /**
         * 重新画图
         */
        for(var i=0;i<tempN;i++){
            for (var property in tempArr[i]){
                drawLeft(property);// console.log(property);
                drawRight(tempArr[i][property]);
            }
        }

    });

    /**
     * 提交所有的线
     * todo:设置一个变量存储这个已经提交的线
     */
    $("#submit-instance").click(function(){

        /**
         * 先清除整个画布
         * @type {Element}
         */
        var canvas = document.getElementById('canvas-front');
        var cWidth=$("#canvas-front").attr("width");
        var cHeight=$("#canvas-front").attr("height");
        var context = canvas.getContext('2d');
        context.clearRect(0,0,cWidth,cHeight);

        /**
         * 临时存储连线的点和几条线
         */
        var tempArr = jQuery.extend(true, {}, lineLR[curInstanceIndex]); //console.log(tet);
        var tempN=tempNum[curInstanceIndex];

        /**
         * 清除原数据
         * @type {number}
         */
        tempNum[curInstanceIndex]=0;
        lineLR[curInstanceIndex]=new Array;



        var fRes=0;

        var aListitemId=new Array;
        var bListitemId=new Array;
        for(var i=0;i<tempN;i++){
            for (var property in tempArr[i]){
                //drawLeftBack(property); console.log("property="+property);
                //console.log(tempArr[i][property]);

                //drawRightBack(tempArr[i][property]);

                //console.log(property.substring(5));
                //console.log(listItem);
                // aListitemId[i]=listItem[property.substring(5)-1].liid;
                aListitemId[i]=property.substring(5);
                //console.log(aListitemId);
                //console.log(tempArr[i][property].substring(6));
                bListitemId[i]=tempArr[i][property].substring(6);
                // bListitemId[i]=listItem[tempArr[i][property].substring(6)-1].liid;
                //console.log(bListitemId);

            }
        }

        var doTaskData={
            taskId :taskId,
            docId:docId,
            instanceId:instanceItem[curInstanceIndex].instid,
            aListitemId:aListitemId,
            bListitemId:bListitemId,
            taskType:taskType,
            userId:0
        };console.log(doTaskData);

        ajaxdoTaskInfo(doTaskData,fRes);
        // if(fRes==-1){
        //     alert("提交失败");
        // }else{
        //     alert("提交成功");
        // }
        tempNum[curInstanceIndex]=0;
        lineLR[curInstanceIndex]=new Array;

    });

});

/**
 * 获取任务的详细信息
 * @param taskId
 */
function ajaxTaskInfo(taskId) {
    var taskid={
        tid:taskId,
        typeId:4,
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
            /**
             * 获取文件内容，提前加载
             */

            console.log(data);
            taskInfo=data.data; //console.log(taskInfo);
            documentList =data.data.documentList;//console.log(documentList);
            docId=documentList[0].did;//console.log(docId);

            ajaxDocInstanceItem(docId);
            taskType=data.data.typeName;

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
        url: "/pairing/detail",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            console.log(data);

            instanceItem=data.instanceItem; //console.log(instanceItem);
            instanceLength=instanceItem.length;
            listItem=instanceItem[curInstanceIndex].listitems;


            //curInstanceIndex=0;

            lineLR[curInstanceIndex] = new Array;
            tempNum[curInstanceIndex]=0;

            tempNumInit[curInstanceIndex]=0;
            lineLRInit[curInstanceIndex]=new Array;
            /**
             * 将第一部分内容写入dotask面板
             */
            // paintDoTask(listItem);
            var ajaxNewData={
                    instanceIndex:instanceItem[0].instid,
                    tid:taskId,
                    docId:docId
                };
            ajaxResHandle(ajaxNewData);

            /**
             * 左边ul导航点击定位
             */
            var ul_html="";
            for(var i=0;i<instanceLength;i++){
                var li_html="";
                if(i==curInstanceIndex){
                    li_html=' <li class="active" id="li-'+i+'"><a id="a-'+i+'" onclick="curInstanceId(this.id)">' +
                        '第'+(i+1)+'部分'+'</a></li>';
                }else{
                    li_html=' <li  id="li-'+i+'"><a id="a-'+i+'" onclick="curInstanceId(this.id)">' +
                        '第'+(i+1)+'部分'+'</a></li>';
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
    lineLR[curInstanceIndex] = new Array;

    tempNum[curInstanceIndex]=0;

    lineLRInit[curInstanceIndex] = new Array;

    tempNumInit[curInstanceIndex]=0;
    listItem=instanceItem[curInstanceIndex].listitems;

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
        url: "/pairing/result",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:ajaxNewData,
        success: function (data) {

            var resPairing=data.resPairing;

            if(resPairing.length>0){

                var resPairingHtml='  <table class="tablex" border="1">' +
                    ' <tr> ' +
                    '<th style="width: 45%;text-align:center;vertical-align: middle;">左连线分句</th> ' +
                    '<th style="width: 45%;text-align:center;vertical-align: middle;">右连线分句</th>' +
                    '<th style="width: 10%;text-align:center;vertical-align: middle;">被连线次数</th> ' +
                    '</tr>';
                for(var i=0;i<resPairing.length;i++){

                    var resHtml='  <tr> ' +
                        '<td style="vertical-align: middle;">' +resPairing[i].aContent+
                        '</td> ' +
                        '<td style="vertical-align: middle;">' +resPairing[i].bContent+
                        '</td> ' +
                        '<td style="text-align:center;vertical-align: middle;">' +resPairing[i].num+
                        '</td> ' +
                        '</tr>';
                    resPairingHtml=resPairingHtml+resHtml;
                }
                resPairingHtml=resPairingHtml+'</table>';


                var doTaskContentHtml=' <div class="panel-body" id="res-panel"> ' +
                    '<div class="layui-row"> ' +
                    '<div class="layui-col-md12"> ' +
                    '<div class="panel panel-default">' +
                    ' <table class="table">' +
                    ' <tr><td>预处理结果/待排序内容:</td></tr>' +
                    ' </table> ' +
                    '<div class="panel-body" id="testTable2">' +
                    ' </div> </div> </div> </div> </div>';

                $("#dotaskDiv").html(doTaskContentHtml);
                $("#testTable2").html(resPairingHtml);
                console.log("hha");
            }else{
                alert("该部分还没有人参与");
                var doTaskContentHtml='   <div class="show cb" id="showCb"> ' +
                    '<div class="layui-col-md5 showleft " id="div-left">' +
                    '</div> <div class="layui-col-md2">.</div>' +
                    ' <div class="layui-col-md5 showright " id="div-right"> </div> </div>';
                $("#dotaskDiv").html(doTaskContentHtml);
                paintDoTask(listItem);

            }


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}

/**
 * 根据curInstanceIndex输出右边连线的面板
 * @param listItem
 */
function paintDoTask(listItem) {

    console.log(listItem);
    var left_Html="";
    var right_Html="";
    for(var i=0;i<listItem.length;i++){
        /**
         * 设置一个flag用来标注这个词标注没，todo:不确定用不用得到
         * @type {number}
         */
        listItem[i].flag=0;


        /**
         * 分别写入左右两边
         */
        console.log("paint");
        if(listItem[i].listIndex=="1"){
            var lt= '<li class="showitem" id="left-'+listItem[i].ltid+'" >'
                +listItem[i].litemcontent+'</li>';
            left_Html=left_Html+lt;
        }else if(listItem[i].listIndex=="2"){
            var rt='<li class="showitem" id="right-'+listItem[i].ltid+'" >'
                +listItem[i].litemcontent+'</li>';
            right_Html=right_Html+rt;
        }
    }

    /**
     * 顺序执行，todo:会不会出现不是顺序执行的情况？
     * @type {number}
     */

    $("#div-left").html(left_Html);
    $("#div-right").html(right_Html);

    /**
     * todo:每次都重新加载canvas,等下看下如何保存已经连接的值
     * @type {string}
     */
    var canvasHtml=' <canvas class="canvas" id="canvas-front"></canvas>'
    +'<canvas class="backcanvas" id="canvas-back"></canvas>';
    $("#showCb").append(canvasHtml);

    /**
     *调用onLine进行元素初始化，设置元素的left和top方便连线
     * @type {*}
     */
    var obj = $(".dotaskDiv");  //console.log(obj);
    for(var i=0; i<obj.size(); i++ ){
        obj.eq(i).onLine({
            // regainCanvas: true
        });
    }

}

/**
 * 点击左边做任务面板的事件
 * @param obj
 */
// function drawLeft(obj) {
//     curLeftId=obj;
//     x1=$("#"+obj).attr("left");
//     x2=$("#"+obj).attr("top");
//
//     var listLen=listItem.length;
//     for(var i=0;i<listLen;i++){
//
//         if(listItem[i].listIndex==1){
//             var tempList= "left-"+listItem[i].ltid;
//             console.log(tempList);
//             $("#"+tempList).css("background-color","#5bc0de");
//         }
//
//     }
//     $("#"+obj).css("background-color","#F96");
//
//
//
// }

/**
 * 点击右边做任务面板的事件
 * @param obj
 */
// function drawRight(obj) {
//     curRightId=obj;
//
//     var tempObj={};
//     tempObj[curLeftId]=curRightId;
//
//     console.log(lineLR[curInstanceIndex]);
//     console.log(tempObj);
//
//     if(JSON.stringify(lineLRInit[curInstanceIndex]).indexOf(JSON.stringify(tempObj))!=-1){
//         alert("这条线已提交，请不要重复绘制");
//     }else if(JSON.stringify(lineLR[curInstanceIndex]).indexOf(JSON.stringify(tempObj))!=-1){
//         alert("这条线已绘制，请不要重复绘制");
//     }else {
//         y1=$("#"+obj).attr("left");
//         y2=$("#"+obj).attr("top");
//
//         var linewidth = 2, linestyle = "#0C6";//连线绘制--线宽，线色
//         var canvas = document.getElementById('canvas-front');
//         var context = canvas.getContext('2d');
//         context.lineWidth=linewidth;
//         context.strokeStyle = linestyle;
//
//         context.beginPath();
//         context.moveTo(x1, x2);
//         context.lineTo(y1, y2);
//         context.stroke();
//         context.restore();
//
//         lineLR[curInstanceIndex][tempNum[curInstanceIndex]]={};
//         lineLR[curInstanceIndex][tempNum[curInstanceIndex]][curLeftId]=curRightId;
//         tempNum[curInstanceIndex]++;
//         console.log("-------");
//         console.log(lineLR[curInstanceIndex]);
//
//         /**
//          * todo:取值调用接口
//          * todo:查看正在进行中的任务
//          * @type {Array}
//          */
//
//     }
//
//     $("#"+curLeftId).css("background-color","#5bc0de");
//
// };



/**
 * 点击左边做任务面板的事件
 * @param obj
 */
// function drawLeftBack(obj) {
//     curLeftId=obj;
//     x1=$("#"+obj).attr("left");
//     x2=$("#"+obj).attr("top");
// }


function drawLeftInit(obj){
    curLeftId=obj;
    x1=$("#"+obj).attr("left");
    x2=$("#"+obj).attr("top");
}


function drawRightInit(obj){
    curRightId=obj;


    y1 = $("#" + obj).attr("left");
    y2 = $("#" + obj).attr("top");

    var linewidth = 2, linestyle = "#5bc0de";//连线绘制--线宽，线色
    var canvas = document.getElementById('canvas-back');
    var context = canvas.getContext('2d');
    context.lineWidth = linewidth;
    context.strokeStyle = linestyle;

    context.beginPath();
    context.moveTo(x1, x2);
    context.lineTo(y1, y2);
    context.stroke();
    context.restore();

}
/**
 * 点击右边做任务面板的事件
 * @param obj
 */
function drawRightBack(obj) {
    curRightId=obj;

    var tempObj={};
    tempObj[curLeftId]=curRightId;

    if(JSON.stringify(lineLR[curInstanceIndex]).indexOf(JSON.stringify(tempObj))!=-1){
        console.log("已经划过了");
    }else {
        y1 = $("#" + obj).attr("left");
        y2 = $("#" + obj).attr("top");

        var linewidth = 2, linestyle = "#5bc0de";//连线绘制--线宽，线色
        var canvas = document.getElementById('canvas-back');
        var context = canvas.getContext('2d');
        context.lineWidth = linewidth;
        context.strokeStyle = linestyle;

        context.beginPath();
        context.moveTo(x1, x2);
        context.lineTo(y1, y2);
        context.stroke();
        context.restore();

        lineLR[curInstanceIndex][tempNum[curInstanceIndex]] = {};
        lineLR[curInstanceIndex][tempNum[curInstanceIndex]][curLeftId] = curRightId;
        tempNum[curInstanceIndex]++;
        console.log(lineLR[curInstanceIndex]);

        /**
         * todo:取值调用接口
         * todo:查看正在进行中的任务
         * @type {Array}
         */

    }


    $("#"+curLeftId).css("background-color","#5bc0de");

};




// var keys=[];
// for (var property in tempArr[i]) {
//     keys.push(property);
// }
// console.log(keys);

/**
 * 做任务上传自己的标注内容
 * @param doTaskData
 */
function ajaxdoTaskInfo(doTaskData,fRes) {
    $.ajax({
        url: "/pairing",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:doTaskData,
        success: function (data) {
            ajaxDocInstanceItem(docId);
            //console.log(data);
        }, error: function (XMLHttpRequest, textStatus, errorThrown) {

        },
    });
};