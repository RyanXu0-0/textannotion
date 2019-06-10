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

var paraLabelAlreadyDone=new Array;//每段已经选中的label


var paraId=new Array;//每段的数据库ID，做任务传值需要-->contentid
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


    $("#select-docStatus").click(function(){

        /**
         * 调用ajax上传标签
         */
        ajaxDocContent(docId);

    });

    $("#complete-doc").click(function(){

        /**
         * 调用ajax上传标签
         */
        ajaxCompleteDoc(docId);

    });




});



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


            /**
             * 获取文件内容，提前加载
             */
            ajaxDocContent(docId);

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
        userId:userId,
        taskId:taskId
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
            paraIndex =data.data.length;//段落数
            var div_footer='<div class="text-center">';
            for(var i=0;i<paraIndex;i++){
                //todo:可以合并存
                para_label[i]=new Array;
                paraContent[i]=data.data[i].paracontent;//每段内容

                paraLabelAlreadyDone[i]=data.data[i].alreadyDone;
                paraId[i]=data.data[i].pid;//console.log(paraId[i]);//每段内容的ID

                var panel_footer="";
                if(i==curParaIndex){
                    panel_footer= '\xa0\xa0\xa0\xa0<a class="layui-form-label" id="panel-footer-index-'+i+'" style="color: #FF0000" onclick="footerIndex(this.id)">'
                        + (i+1)
                        +'</a>\xa0\xa0\xa0';//页脚 1，2，3数字
                }else{
                    panel_footer= '\xa0\xa0\xa0\xa0<a class="layui-form-label" id="panel-footer-index-'+i+'" style="color: #0d96f2" onclick="footerIndex(this.id)">'
                        + (i+1)
                        +'</a>\xa0\xa0\xa0';//页脚 1，2，3数字
                }


                panel_footer_index[i]="panel-footer-index-"+i;//页脚a标签对应的ID

                div_footer=div_footer+panel_footer;
            }
            div_footer=div_footer+'</div>';
            $("#p-para").html(paraContent[curParaIndex]);

            //$("#div-para-footer").html(div_footer);//显示页脚

            /**
             * 调用label处理函数
             */
            labelHtml(labelList);



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

                }
            });





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

    var tmpLabelId=new Array;
    var tmpGood=new Array;
    var tmpBad=new Array;
    var tmpDtdId=new Array;
    for(var i=0;i<paraLabelAlreadyDone[curParaIndex].length;i++){
        tmpLabelId[i]=paraLabelAlreadyDone[curParaIndex][i].label_id;
        tmpGood[i]=paraLabelAlreadyDone[curParaIndex][i].goodlabel;
        tmpBad[i]=paraLabelAlreadyDone[curParaIndex][i].badlabel;
        //tmpDtdId[i]=paraLabelAlreadyDone[curParaIndex][i].dtd_id;
    }
    console.log(paraLabelAlreadyDone[curParaIndex]);

    console.log(tmpLabelId);

    if(tmpLabelId.length>0){
        var label_html="";



        for(var i=0;i<labelLength;i++){
            var list_html="";
            if(tmpLabelId.indexOf(labelList[i].lid)!=-1){
                var tmpIndex=tmpLabelId.indexOf(labelList[i].lid);
                console.log(tmpLabelId.indexOf(labelList[i].lid));
                console.log(labelList[i].lid);
                list_html ='<li class="list-group-item">'
                    +'<div class="layui-row">'
                    +'<div class="layui-col-md10">'
                    +'<img class="isAns" src="/images/isAns.png" id="label-list-img-'+i+'">'
                    +labelList[i].labelname
                    +'</div>'
                    +'<div class="layui-col-md1">'
                    +'<span id="sg_'+tmpIndex+'">' +tmpGood[tmpIndex]
                    +'</span>'

                    +'<img class="notGood" src="/images/goodlabel.png" id="good_'+tmpIndex+'" onclick="goodfunc(this.id);">'
                    +'</div>'

                    +'<div class="layui-col-md1">'
                    +'<span id="sb_'+tmpIndex+'">' +tmpBad[tmpIndex]
                    +'</span>'

                    +'<img class="notBad" src="/images/bad3.png" id="bad_'+tmpIndex+'" onclick="badfunc(this.id);">'
                    +'</div>'

                    +'</div>'
                    +'</li>';
            }else{
                list_html ='<li class="list-group-item">'
                    +'<img class="notAns" src="/images/notAns.png" id="label-list-img-'+i+'" >'
                    +labelList[i].labelname
                    +'</li>';
            }

            label_html =label_html+list_html;
            label_list_img[i]="label-list-img-"+i;
        }

        $("#ul-label-list").html(label_html);
    }else{
        var label_html="";
        for(var i=0;i<labelLength;i++){
            var list_html ='<li class="list-group-item">'
                +'<img class="notAns" src="/images/notAns.png" id="label-list-img-'+i+'" >'
                +labelList[i].labelname
                +'</li>';
            label_html =label_html+list_html;
            label_list_img[i]="label-list-img-"+i;
        }

        $("#ul-label-list").html(label_html);
    }


    /**
     * 将值都初始化为-1，选中label则替换-1
     */
    for(var i=0;i<paraIndex;i++){
        for(var j=0;j<labelLength;j++){
            para_label[i][j]=-1;
        }
    }

};

function goodfunc(obj) {

   console.log(obj);
   // $("#"+obj).attr("src","./images/goodlabel2.png");

    var i=obj.substring(5,obj.length);
    var curDtdIndex=parseInt(i);
    var dtdId=paraLabelAlreadyDone[curParaIndex][curDtdIndex].dtd_id;
    var flg=1;

    if($("#"+obj).hasClass("notGood")){


        $("#"+obj).attr("src","/images/goodlabel2.png");
        $("#"+obj).addClass("isGood").removeClass("notGood");
        var cNum=1;
        ajaxComment(dtdId,cNum,flg,curDtdIndex);

    }else{


        $("#"+obj).attr("src","/images/goodlabel.png");
        $("#"+obj).addClass("notGood").removeClass("isGood");
        var cNum=-1;
        ajaxComment(dtdId,cNum,flg,curDtdIndex);
    }
};

function badfunc(obj) {
    //console.log(obj);
    //$("#"+obj).attr("src","./images/goodlabel2.png");

    var i=obj.substring(4,obj.length);
    var curDtdIndex=parseInt(i);
    var dtdId=paraLabelAlreadyDone[curParaIndex][curDtdIndex].dtd_id;
    var flg=-1;
    if($("#"+obj).hasClass("notBad")){

        $("#"+obj).attr("src","/images/bad4.png");
        $("#"+obj).addClass("isBad").removeClass("notBad");

        var cNum=1;
        ajaxComment(dtdId,cNum,flg,curDtdIndex);
    }else{
        $("#"+obj).attr("src","/images/bad3.png");
        $("#"+obj).addClass("notBad").removeClass("isBad");

        var cNum=-1;
        ajaxComment(dtdId,cNum,flg,curDtdIndex);
    }


};
function ajaxCompleteDoc(docId) {
    var docid={
        docId: docId,
        taskId:taskId,userId:0
    };
    $.ajax({
        url: "/classify/doc/status",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {
            console.log(data);


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}


function ajaxComment(dtdId,cNum,flg,curDtdIndex) {
    var commentData={
        dtdId: dtdId,
        cNum:cNum,
        flag:flg,
        uId:userId
    };
    console.log(commentData);
    $.ajax({
        url: "/classify/ucomment",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:commentData,
        success: function (data) {
            if(flg>0){
                var sgood="sg_"+curDtdIndex;
                $("#"+sgood).html(data.data.goodlabel);
            }else{
                var sbad="sb_"+curDtdIndex;
                $("#"+sbad).html(data.data.badlabel);
            }
            console.log(data);

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}