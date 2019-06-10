/**
 * 信息抽取处理函数
 * Created by lenovo on 2018/12/20.
 */

/**
 * 获取任务的详细信息
 */
var taskInfo;//任务相关信息
var labelList;//label的列表
var documentList=new Array;//文件列表
var curLabelIndex=0;//当前被选中的label


/**
 * 做任务必传的值
 */
var taskId;//从页面跳转中获取
var docId;//从documentList中获取
var docStatus="全部";
var paraId=new Array;//每段的数据库ID，做任务传值需要-->contentid

/**
 * 页面处理要用的数据
 */
var paraIndex=0;//文章的段落数，document->content
var paraContent=new Array;//每段的内容

var alreadyDone=new Array;//每段已经做了的信息抽取的值

var curParaIndex=0;//当前正在做段落的页面的索引
var labelLength;//label的数量

/**
 * 页面的控件ID
 * @type {Array}
 */
var panel_footer_index=new Array;//段落处页脚数字的跳转ID，用来控制显示第几段

var label_ans_div=new Array;//标签panel-body的div的ID

var label_list_img=new Array;//标签前面图片的ID，notAns,isAns

var label_ans_ul=new Array;//label->ul ID,控制添加每个标签下的li
var label_ans_li=new Array;//二维数组，
var li_ans_div=new Array;//二维数组，li的内容

var label_ul_li_start=new Array;
var label_ul_li_end=new Array;
var label_ul_li_span=new Array;

var li_img_ok=new Array;//二维数组
var li_img_del=new Array;//二维数组
var li_img_num=new Array;

var label_color=new Array;

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
        $("#row-div-dotask").show();
        $("#div-dotaskbtn").hide();
        $('#taskInfoPanel').collapse('hide');


    });


    $("#select-docStatus").click(function(){
        ajaxDocContent(docId);
    });

    $("#complete-doc").click(function(){
        ajaxCompleteDoc(docId);
    });

    $("#complete-para").click(function(){
        ajaxCompletePara(docId);
    });

    /**
     * 鼠标选定文本事件
     */
    $('#p-para').mouseup(function(){
        var txt = window.getSelection?window.getSelection():document.selection.createRange().text;

        //var as =window.getSelection().anchorOffset;console.log(as);
        //var fs =window.getSelection().focusOffset-1;console.log(fs);
        //label_ul_li_start[curLabelIndex][curLiDiv]=as;
        //label_ul_li_end[curLabelIndex][curLiDiv]=fs;

        $("#"+li_ans_div[curLabelIndex][li_img_num[curLabelIndex]]).text(txt);

        // var parentP = window.getSelection().baseNode.parentNode;
        // var parentP2 = window.getSelection().focusNode.childNodes;

        // console.log(parentP);
        // console.log(parentP2[1].innerHTML);
        // var firstIndex = parentP.innerText.indexOf(tarStr);
        // var lastIndex = parentP.innerText.indexOf(tarStr) + tarStr.length;
        // console.log(firstIndex);
        // console.log(lastIndex);

    });

    // $("#label-list-img-test").click(function () {
    //
    //     console.log(labelList);
    //     if($("#label-list-img-test").hasClass("isAns")){
    //         $("#label-list-img-test").attr("src","./images/notAns.png")
    //         $("#label-list-img-test").addClass("notAns").removeClass("isAns");
    //
    //     }else{
    //         $("#label-list-img-test").attr("src","./images/isAns.png");
    //         $("#label-list-img-test").removeClass("notAns").addClass("isAns");
    //     }
    // });

});

/**
 * 显示隐藏自己要做的label
 * @param obj
 */
function imgClick(obj) {
    var i=obj.substring(15,obj.length);
    curLabelIndex=i;

    if($("#"+label_list_img[i]).hasClass("isAns")){

        $("#"+label_list_img[i]).attr("src","/images/notAns.png");
        $("#"+label_list_img[i]).addClass("notAns").removeClass("isAns");
        curLabelIndex=0;

    }else{
        /**
         * 把其他的label全部隐藏
         */
        for(var j=0;j<labelLength;j++){
            $("#"+label_list_img[j]).attr("src","/images/notAns.png");
            $("#"+label_list_img[j]).removeClass("isAns").addClass("notAns");
            $("#"+label_ans_div[j]).collapse('hide');
        }

        $("#"+label_list_img[i]).attr("src","/images/isAns.png");
        $("#"+label_list_img[i]).removeClass("notAns").addClass("isAns");
        $("#"+label_ans_div[i]).collapse('show');
    }

};

/**
 * 点击ok添加新的li
 * @param obj
 */
function imgOkClick(obj) {

    var addLiNum= li_img_num[curLabelIndex];//当前的Li的index

    /**
     * 鼠标选中一段文本，点击添加后对选中的文本样式进行改变
     * @type {Selection}
     */
    var selection = window.getSelection(); //console.log(selection);
    var range = selection.getRangeAt(0);//返回索引对应的选区中的 DOM 范围。
    var txt = window.getSelection?window.getSelection():document.selection.createRange().text;

    /**
     * 可以根据用户选中的颜色标记文本
     * @type {string}
     */
        // var testcolor="#"+$("#"+label_color[curLabelIndex]).val();//console.log(testcolor);
    var span = document.createElement("span");
    span.style.fontSize = "20px";
    // span.style.color=testcolor;
    span.style.color=labelList[curLabelIndex].color;
    span.id="label-ul-li-span-"+curLabelIndex+"-"+(addLiNum);
    span.appendChild(document.createTextNode(txt));
    // console.log(document.createTextNode(txt));
    selection.deleteFromDocument();//从文档中删除选区中的文本
    range.insertNode(span);//将你要添加的格式添加到DOM范围里

    /**
     * 传给递归函数的值
     * @type {jQuery}
     */
    var str=$("#p-para").html();
    var strid="label-ul-li-span-"+curLabelIndex+"-"+(addLiNum);
    var testNum=0;//这是添加的span的前面文本内容字数
    var strLen=$("#"+li_ans_div[curLabelIndex][addLiNum]).html().length;//console.log("strLen="+strLen);

    /**
     * 调用递归函数获取index
     * @type {*}
     */
    var recurisonRes=getParaStartEnd(str,strid,testNum,strLen,addLiNum);  //console.log(recurisonRes);
    if(recurisonRes==-1){
        alert("请鼠标选中文本后再点击添加!");
    }else{
        var doTaskData={
            taskId :taskId,
            docId:docId,
            paraId:paraId[curParaIndex],
            labelId:labelList[curLabelIndex].lid,
            indexBegin:label_ul_li_start[curLabelIndex][addLiNum],
            indexEnd:label_ul_li_end[curLabelIndex][addLiNum],
            userId:0
        };
        console.log(doTaskData);

        /**
         * 调用上传任务接口
         */
        ajaxdoTaskInfo(doTaskData,curLabelIndex,addLiNum,str);
    }

};

/**
 * 对每个label->ul->li的内容进行移除
 * @param obj
 */
function imgDelClick(obj) {

    var delLiLength=curLabelIndex.length+12;//console.log(delLiLength);
    var delLiStr =obj.substring(delLiLength,obj.length);//console.log(delLiStr);
    var delLiNum =parseInt(delLiStr); //console.log(delLiNum);
    $("#"+li_ans_div[curLabelIndex][delLiNum]).html("");

};

/**
 * 对每个标签的第一个li的内容进行处理
 * @param obj  -->用不到这个参数
 */
function imgDeleteClick(obj) {
    $("#"+li_ans_div[curLabelIndex][0]).html("");
};

/**
 * 页脚1，2，3对应的点击事件
 * @param obj
 */
function footerIndex(obj) {
    $("#"+obj).css("color","red");


    $("#"+panel_footer_index[curParaIndex]).css("color","#0d96f2");

    var aIndex=obj.substring(19,obj.length);//console.log("当前的段落索引为："+aIndex);
    curParaIndex=aIndex;//当前段落的索引
    var curParaIndexNum =parseInt(curParaIndex);
    $("#span-index").html("第"+(curParaIndexNum+1)+"段");//设置内容面板的标题
    console.log(paraContent[curParaIndex]);
    $("#p-para").html(paraContent[curParaIndex]);//设置内容

    if(paraContent[curParaIndex].indexOf("<span")==-1){
        paintAlreadyDone2();
    }

};

// $("#link1").click(function(){
//     console.log("hha");
// });

/**
 * 获取任务的详细信息，taskInfo,labelList,documentList
 * @param taskId
 */
function ajaxTaskInfo(taskId) {
    var taskid={
        tid:taskId,
        typeId:1,
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
                if(documentList[i].filetype==".txt"){
                    taskFileHtml=  '<p><a id="taskfile-'+i+'" onclick="ajaxtaskFileId(this.id)"><img src="/images/TXT.png">'
                        +documentList[i].filename+'</a></p>';
                }else if(documentList[i].filetype==".doc"){
                    taskFileHtml=  '<p><a id="taskfile-'+i+'" onclick="ajaxtaskFileId(this.id)"><img src="/images/DOC.png">'
                        +documentList[i].filename+'</a></p>';
                }else if(documentList[i].filetype==".docx"){
                    taskFileHtml=  '<p><a id="taskfile-'+i+'" onclick="ajaxtaskFileId(this.id)"><img src="/images/DOCX.png">'
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
            ajaxDocContent(docId);

            /**
             * 对label的加载和处理，以及页面的显示
             */
            labelHtml(labelList);


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });


};

/**
 * 获取文件的内容
 * @param docId
 */
function ajaxDocContent(docId){
    var docid={
        docId: docId,
        status:docStatus,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/extraction",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:docid,
        success: function (data) {

            /**
             * 左边文件内容的显示处理
             */
            paraIndex =data.data.length;//段落数
            var div_footer='<div class="text-center">';
            for(var i=0;i<paraIndex;i++){
                paraContent[i]=data.data[i].paracontent;//每段内容

                alreadyDone[i]=data.data[i].alreadyDone;//每段已经做了的信息抽取的值

                //console.log(alreadyDone);
                paraId[i]=data.data[i].pid;//console.log(paraId[i]);//每段内容的ID


                var panel_footer="";
                if(i==curParaIndex){
                    panel_footer= '\xa0\xa0\xa0\xa0<a id="panel-footer-index-'+i+'" style="color: #FF0000" onclick="footerIndex(this.id)">'
                        + (i+1)
                        +'</a>\xa0\xa0\xa0';//页脚 1，2，3数字
                }else{
                    panel_footer= '\xa0\xa0\xa0\xa0<a id="panel-footer-index-'+i+'" style="color: #0d96f2" onclick="footerIndex(this.id)">'
                        + (i+1)
                        +'</a>\xa0\xa0\xa0';//页脚 1，2，3数字
                }


                panel_footer_index[i]="panel-footer-index-"+i;//页脚a标签对应的ID

                div_footer=div_footer+panel_footer;
            }
            div_footer=div_footer+'</div>';


            /**
             * 绘制已经做了的任务
             */
            paintAlreadyDone2();

            //$("#div-para-footer").append(div_footer);//显示页脚

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


                    if(paraContent[curParaIndex].indexOf("<span")==-1){
                        paintAlreadyDone2();
                    }


                }
            });










        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
};

/**
 * 对label的加载和处理
 * @param labelList
 */
function labelHtml(labelList){

    labelLength =labelList.length;//label的数量

    var label_html="";
    for(var i=0;i<labelLength;i++){
        label_ans_div[i]="label-ans-div-"+i;//panel-body-div的ID

        var list_html = '<div class="panel panel-success">'
            +'<div class="panel-heading">'
            +'<h4 class="panel-title">'
            +'<a data-toggle="collapse" data-parent="#accordion" href="#'+label_ans_div[i]+'">'
            +'<img class="notAns" src="/images/notAns.png" id="label-list-img-'+i+'" onclick="imgClick(this.id)">'
            +'</a>'
                +'<span style="color: '+labelList[i].color+'">'
            +labelList[i].labelname+
            '</span> '

            +'</h4>'
            +'</div>'
            +'<div id="label-ans-div-'+i+'" class="panel-collapse collapse">'
            +'<div class="panel-body">'
            +'<ul class="list-group" id="label-ans-ul-'+i+'">'
            +'<li class="list-group-item" id="label-ans-li-'+i+'-0">'
            +'<div class="layui-row">'
            +'<div class="layui-col-md10" id="li-ans-div-'+i+'-0">'
            +'.</div>'
            +'<div class="layui-col-md1">'
            +'<img class="okAns" src="/images/ok.png" id="li-img-ok-'+i+'-0" onclick="imgOkClick(this.id)">'
            +'</div>'
            +'<div class="layui-col-md1">'
            +'<img class="delAns" src="/images/delete.png" id="li-img-del-'+i+'-0" onclick="imgDeleteClick(this.id)">'
            +'</div>'
            +'</div>'
            +'</li>'
            +'</ul>'
            +'</div>'
            +'</div>'
            +'</div>';

        label_html =label_html+list_html;
        label_list_img[i]="label-list-img-"+i;
        label_ans_ul[i]="label-ans-ul-"+i;
        label_color[i]="label-color-"+i;

        label_ans_li[i]=new Array;
        label_ans_li[i][0]= "label-ans-li-"+i+"-0";

        li_img_ok[i]=new Array;
        li_img_ok[i][0] ="li-img-ok-"+i+"-0";

        li_img_del[i]=new Array;
        li_img_del[i][0] ="li-img-del-"+i+"-0";

        li_ans_div[i]=new Array;
        li_ans_div[i][0]= "li-ans-div-"+i+"-0";

        label_ul_li_start[i]=new Array;
        label_ul_li_end[i]=new Array;
        label_ul_li_span[i]=new Array;
        label_ul_li_span[i][0] ="label-ul-li-span-"+i+"-0";

        li_img_num[i]=0;
    }

    $("#labellist-div-panel").append(label_html);

};

/**
 * 做任务上传自己的标签
 * @param doTaskData
 */
function ajaxdoTaskInfo(doTaskData,curLabelIndex,addLiNum,str) {

    $.ajax({
        url: "/extraction",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:doTaskData,
        success: function (data) {
            //console.log(data);
            if(data.status=="0"){

                /**
                 * 每段文本的内容变为标记成功后的内容
                 */
                paraContent[curParaIndex]=str;//console.log(str);
                alert("添加成功");
                $("#"+li_img_ok[curLabelIndex][addLiNum]).attr("src","/images/blank.PNG");
                $("#"+li_img_ok[curLabelIndex][addLiNum]).removeAttr("onclick");
                $("#"+li_img_del[curLabelIndex][addLiNum]).attr("src","/images/labelsuccess.png");
                $("#"+li_img_del[curLabelIndex][addLiNum]).removeAttr("onclick");


                li_img_num[curLabelIndex]++;
                /**
                 * 提交一个li之后，添加一个li
                 */
                var addLi= '<li class="list-group-item" id="label-ans-li-'+curLabelIndex+'-'+(addLiNum+1)+'">'
                    +'<div class="row">'
                    +'<div class="col-lg-10" id="li-ans-div-'+curLabelIndex+'-'+(addLiNum+1)+'">'
                    +'</div>'
                    +'<div class="col-lg-1">'
                    +'<img class="okAns" src="/images/ok.png" id="li-img-ok-'+curLabelIndex+'-'+(addLiNum+1)+'" onclick="imgOkClick(this.id)">'
                    +'</div>'
                    +'<div class="col-lg-1">'
                    +'<img class="delAns" src="/images/delete.png" id="li-img-del-'+curLabelIndex+'-'+(addLiNum+1)+'" onclick="imgDelClick(this.id)">'
                    +'</div>'
                    +'</div>'
                    +'</li>';
                label_ans_li[curLabelIndex][addLiNum+1]= "label-ans-li-"+curLabelIndex+"-"+(addLiNum+1);
                li_ans_div[curLabelIndex][addLiNum+1]= "li-ans-div-"+curLabelIndex+"-"+(addLiNum+1);
                li_img_ok[curLabelIndex][addLiNum+1] ="li-img-ok-"+curLabelIndex+"-"+(addLiNum+1);
                label_ul_li_span[curLabelIndex][addLiNum+1] ="label-ul-li-span-"+curLabelIndex+"-"+(addLiNum+1);
                li_img_del[curLabelIndex][addLiNum+1] ="li-img-del-"+curLabelIndex+"-"+(addLiNum+1);

                $("#"+label_ans_ul[curLabelIndex]).append(addLi);
            }


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {

        },
    });


};

/**
 * 获取被选中的文本的startIndex和endIndex
 * 这里用的是递归去除span标签
 * todo:试试正则表达式？
 * @param paraStr
 * @param paraLabelId
 * @param testNum
 * @param strLen
 * @param addLiNum
 * @returns {*}
 */
function getParaStartEnd(paraStr,paraLabelId,testNum,strLen,addLiNum){
    // console.log("---------------------------------------start")
    // console.log("paraStr="+paraStr);
    // console.log("paraLabelId="+paraLabelId);
    // console.log("strLen="+strLen);

    var num1=paraStr.indexOf("<");//console.log("num1="+num1);
    var num2=paraStr.indexOf(">");//console.log("num2="+num2);
    var str1=paraStr.substring(num1,num2+1);//console.log("str1="+str1);
    var str2=paraStr.substring(0,num1)+paraStr.substring(num2+1);//console.log("str2="+str2);

    if(num1<0 || num2<0){
        /**
         * 没有往页面里插入span成功的情况，容易造成死循环
         */
        return -1;
    }else if(str1.indexOf(paraLabelId)!=-1){
        // console.log("num1段落="+paraStr.substring(0,num1));
        testNum=paraStr.substring(0,num1).length; //console.log("testNum="+testNum);

        /**
         * 设置被选中的str 的startIndex,endIndex
         * @type {*}
         */
        label_ul_li_start[curLabelIndex][addLiNum]=testNum+1;//todo:+1
        label_ul_li_end[curLabelIndex][addLiNum]=testNum+strLen;

        return 1;

    }else{
        return getParaStartEnd(str2,paraLabelId,testNum,strLen,addLiNum);
    }



}

/**
 * 查看文件内容
 * @param obj
 */
function ajaxtaskFileId(obj){
    //console.log(obj);

    var i=obj.substring(9,obj.length);
    var docId=documentList[parseInt(i)].did;
    console.log(docId);
    var dataDocId={
        docId: docId,
        userId:0
    };

    $.ajax({
        url: "/content/getContent",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:dataDocId,
        success: function (resdata) {
            //console.log(resdata.data[0]);

            var strLength =resdata.data.length;

            var strContent="" ;
            for(var i=0;i<strLength;i++){
                //console.log(resdata.data[i]);
                strContent=strContent+"<p>"+"\xa0\xa0\xa0\xa0"+resdata.data[i].paracontent+"</p>";
            }
            $("#modal_content").append(strContent);
            $('#myModal').modal('show');
            //alert(strContent);
            // layui.use('layer',function(){
            //     var layer=layui.layer;
            //     layer.open({
            //         type:0,
            //         area: '600px',
            //         content:strContent
            //     })
            // });

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
}

/**
 * 绘制已经做了的
 */
function paintAlreadyDone() {

    var alreadyLeftIndex=new Array;
    var alreadyRightIndex=new Array;

    for(var i=0;i<alreadyDone[curParaIndex].length;i++){
        alreadyLeftIndex[i]=alreadyDone[curParaIndex][i].index_begin-1;
        alreadyRightIndex[i]=alreadyDone[curParaIndex][i].index_end-1;
    }
    //console.log(alreadyLeftIndex);
    //console.log(alreadyRightIndex);


    if(alreadyDone[curParaIndex].length>0){

        var tmpPara=paraContent[curParaIndex].split("");
        var tmpHtml="";//console.log(tmpPara);
        for(var i=0;i<tmpPara.length;i++){

            var tmpLeft="";
            var tmpRight="";
            if(alreadyLeftIndex.indexOf(i)!=-1){

                tmpLeft='<span style="color: #00F7DE">';
            }
            if(alreadyRightIndex.indexOf(i)!=-1){

                tmpRight='</span>';
            }
            tmpHtml=tmpHtml+tmpLeft+tmpPara[i]+tmpRight;

        }
        $("#p-para").html(tmpHtml);
    }else{
        $("#p-para").html(paraContent[curParaIndex]);//显示第1段内容
    }
}

/**
 * 绘制已经做了的
 * 方法二
 */
function paintAlreadyDone2() {

    //console.log("jinrule");
    var tmpAlreadyPara=alreadyDone[curParaIndex];
    //console.log(tmpAlreadyPara);
    var tmpContentArray=paraContent[curParaIndex].split("");
    //console.log(tmpContentArray);
    if(tmpAlreadyPara.length>0){

        for(var i=0;i<tmpAlreadyPara.length;i++){
            var leftIndex=tmpAlreadyPara[i].index_begin-1;
            var rightIndex=tmpAlreadyPara[i].index_end-1;

            var tmpcolor=tmpAlreadyPara[i].color;
            //console.log(tmpcolor);
            tmpContentArray[leftIndex]='<span style="color:'+tmpcolor+'">'+tmpContentArray[leftIndex];
            tmpContentArray[rightIndex]=tmpContentArray[rightIndex]+'</span>';

            //console.log(tmpContentArray[leftIndex]);
            //console.log(tmpContentArray[rightIndex]);
        }

        var tmpHtml=tmpContentArray.join("");
        $("#p-para").html(tmpHtml);
    }else{
        $("#p-para").html(paraContent[curParaIndex]);//显示第1段内容
    }

}

function ajaxCompleteDoc(docId) {
    var docid={
        docId: docId,
        taskId:taskId,
        userId:0
    };
    $.ajax({
        url: "/dpara/doc/status",
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
};

function ajaxCompletePara(docId) {
    var docid={
        docId: docId,
        taskId:taskId,
        paraId:paraId[curParaIndex],
        userId:0
    };
    $.ajax({
        url: "/dpara/status",
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
};