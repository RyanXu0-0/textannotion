/**
 * 信息抽取处理函数
 * Created by lenovo on 2018/12/20.
 */

/**
 * 获取任务的详细信息
 */
var taskInfo;//任务相关信息
//labelList:Array(3)
// 0:{color: "#ff8080", lid: 44, labelname: "时间"}
// 1:{color: "#ffff80", lid: 45, labelname: "地点"}
// 2:{color: "#80ff80", lid: 46, labelname: "其他"}
var labelList = new Array;//label的列表
// var relaList = new Array({lid: 1, relation: "关系1"},
// {lid: 2, relation: "关系2"}
// ,{lid: 3, relation: "关系3"});
var relaList= new Array;
var documentList = new Array;//文件列表
var curLabelIndex = 0;//当前被选中的label
var curRelaIndex = 0;//当前被选中的实体
var dtstatus = new Array;
var deadline;



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
var relationLength;
/**
 * 页面的控件ID
 * @type {Array}
 */
var panel_footer_index=new Array;//段落处页脚数字的跳转ID，用来控制显示第几段

var label_ans_div=new Array;//标签panel-body的div的ID

var label_list_img=new Array;//标签前面图片的ID，notAns,isAns

var label_ans_ul=new Array;//label->ul ID,控制添加每个标签下的li，存储label的id
var label_ans_li=new Array;//二维数组，
var li_ans_div=new Array;//二维数组，li的内容

var label_ul_li_start=new Array;
var label_ul_li_end=new Array;
var label_ul_li_span=new Array;

var li_img_ok=new Array;//二维数组  label下li的添加数组id  li_img_ok-0-1
var li_img_del=new Array;//二维数组  label下li的删除数组id  li-img-del-0-1
var li_img_num=new Array;

var label_color=new Array;//存放标签颜色
var entity_done = new Array;//存放已经完成的实体
/**
 * 实体关系所用的变量
 * **/
//记录鼠标点击的实体id
var fromEntity = "";
var relation_ans_div = new Array;//标签panel-body的div的ID
//关系前面图片的ID，notAns,isAns
var rela_list_img = new Array;
//二维数组存储实体之间的关系，结构[[{entity1:1,entity2:2},{entity1:1,entity2:2}],[],[]]
var rela_done = new Array;

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
        //$("#timer").show();


        console.log(spaceTime);

         orign_time1 = new Date(deadline);
         deadline = Date.parse(orign_time1)/1000;
         currentTime = Date.parse(new Date())/1000;//转化成秒
         spaceTime = deadline-currentTime;
        // var testhtml='<div class="layui-col-md1" >'+
        //    ' <div id="timer" style="color:red" mce_style="color:red"></div>'+
        //  '</div>';
        // $("#div-dotaskbtn").html(testhtml);



    });


    $("#select-docStatus").click(function(){
        curParaIndex=0;
        ajaxDocContent(docId);
    });

    //下一个任务
    $("#nexttask").click(function(){
        var taskData={
            taskId :taskId,
            docId:docId,
            userId:0,
            paraId:paraId[curParaIndex],
            entities:entity_done,
            relations:rela_done
        };
        ajaxNextTask(taskData);
    });
//提交当前任务
    $("#submit-task").click(function(){
        if(entity_done == null){
            window.alert("任务未标注！");
        }else {
            //整理数据格式,将label-ans-li的id换成对应的实体和关系
            var entities = new Array();
            var relations = new Array();
            for (var i = 0; i < entity_done.length; i++) {
                for (var j = 0; j < entity_done[i].length; j++) {
                    var id = entity_done[i][j].spanId.substring(17);
                    var tempentity = {
                        entityId: id,
                        entityName: labelList[i].labelname,
                        entity: entity_done[i][j].entity,
                        startIndex: entity_done[i][j].start,
                        endIndex: entity_done[i][j].end
                    };
                    entities.push(tempentity);
                }
            }

            for (var i = 0; i < rela_done.length; i++) {
                for (var j = 0; j < rela_done[i].length; j++) {
                    var temprelation = {
                        relationId: rela_done[i][j].relaId.substring(12),
                        relation: relaList[i].relation,
                        headEntity: rela_done[i][j].fromId.substring(17),
                        tailEntity: rela_done[i][j].toId.substring(17)
                    };
                    relations.push(temprelation);
                }
            }
            var taskData = {
                taskId: taskId,
                userId: 0,
                entities: JSON.stringify(entities),
                relations: JSON.stringify(relations)
            };
            // console.log(JSON.stringify(entities));
            // console.log(JSON.stringify(relations));
            ajaxSubmitTask(taskData);
        }
    });

    /**
     * 鼠标选定文本事件
     */
    $('#p-para').mouseup(function(){
        //getSelection()方法可以返回一个Selection对象，用于表示用户选择的文本范围或插入符的当前位置。

        var selection = window.getSelection?window.getSelection():document.selection.createRange();
        var txt = selection.toString();
        if(txt != ""){
            $("#select-entity").text(txt);
            $("#choiceEntity").slideDown(300);
        }
    });

    //关闭关系弹窗
    $(".pop-close").click(function() {
        $("#choiceRela").slideUp(300);
        $("#choiceEntity").slideUp(300);
    });

    //关系弹窗点击确认触发事件
    $("#rela-ok").click(function() {
        $("#choiceRela").slideUp(300);
        // window.alert($("#from").text()+" "+$("#to").text()+$('input[name="relation"]:checked').val());
        var from = {},to = {};
        from.spanid = $("#from").attr("value");
        from.text = $("#from").text();
        to.spanid = $("#to").attr("value");
        to.text = $("#to").text();
        console.log("from"+from.spanid+from.text+"to"+to.spanid+to.text);
        relaPopClick(from,to,$('input[name="relation"]:checked').val());

    });

    $("#entity-ok").click(function() {
        $("#choiceEntity").slideUp(300);
        entityPopClick($("#select-entity").text(),$('input[name="entity"]:checked').val())
    });

});

/**
 * 显示隐藏自己要做的label
 * @param obj
 */
function imgClick(obj) {
    var i=obj.substring(15,obj.length);
    curLabelIndex=i;

    if($("#"+label_list_img[i]).hasClass("noClick")){

        alert("该段已经确认完成，不可以再进行修改");
        $("#"+label_ans_div[i]).collapse('hide');
    }else{
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
            console.log("label_ans_div[i]="+label_ans_div[i]);
        }

    }


};


// 点击实体关系，展现或隐藏已经做了了实体关系
function relaimgClick(obj) {
    //rela-list-img-0
    var i=obj.substring(14,obj.length);
    curRelaIndex=i;
    if($("#"+obj).hasClass("isAns")){
        $("#"+obj).attr("src","/images/notAns.png");
        $("#"+obj).addClass("notAns").removeClass("isAns");
        curLabelIndex=0;
    }else{
        /**
         * 把其他的label全部隐藏
         */
        for(var j=0;j<relationLength;j++){
            $("#rela-list-img-"+j).attr("src","/images/notAns.png");
            $("#rela-list-img-"+j).removeClass("isAns").addClass("notAns");
            $("#rela-ans-div-"+j).collapse('hide');
        }

        $("#rela-list-img-"+i).attr("src","/images/isAns.png");
        $("#rela-list-img-"+i).removeClass("notAns").addClass("isAns");
        $("#rela-ans-div-"+i).collapse('show');
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
    var selection = window.getSelection();
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
    // span.setAttribute("onclick", "getentity("+span.id+")");
    span.setAttribute("onclick", "selectentityforrela(id)");
    span.appendChild(document.createTextNode(txt));
    // console.log(document.createTextNode(txt));
    selection.deleteFromDocument();//从文档中删除选区中的文本
    // console.log(span);
    range.insertNode(span);//将你要添加的格式添加到DOM范围里

    /**
     * 传给递归函数的值
     * @type {jQuery}
     */
    //查找p-para中的内容
    var str=$("#p-para").html();
    var strid="label-ul-li-span-"+curLabelIndex+"-"+(addLiNum);
    var testNum=0;//这是添加的span的前面文本内容字数
    var strLen=$("#"+li_ans_div[curLabelIndex][addLiNum]).html().length;//console.log("strLen="+strLen);

    /**
     * 调用递归函数获取index
     * @type {*}
     */
    var recurisonRes=getParaStartEnd(str,strid,testNum,strLen,addLiNum);
    // console.log("recurisonRes"+recurisonRes);
    if(recurisonRes==-1){
        alert("请鼠标选中文本后再点击添加!");
    }else{
        var doTaskData={
            taskId :taskId,
            docId:docId,
            userId:0,
            paraId:paraId[curParaIndex],
            labelId:labelList[curLabelIndex].lid,
            indexBegin:label_ul_li_start[curLabelIndex][addLiNum],
            indexEnd:label_ul_li_end[curLabelIndex][addLiNum],
        };
        // console.log("doTaskData："+doTaskData.text);

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

    var del = obj.substring(13,obj.length);
    var spanid,i;
    var currentLabelId = "label-ans-li-"+curLabelIndex+"-"+del;
    //label-ul-li-span-1-0 标记集体的背景id
    // console.log(JSON.stringify(entity_done));
    for(i = 0;i < entity_done[curLabelIndex].length;i++){
        var temp = entity_done[curLabelIndex][i];
        console.log(temp.labelId);
        if(temp.labelId == currentLabelId){
            spanid = temp.spanId;
            break;
            // console.log("temp:"+temp);
        }
        // console.log(i+":"+JSON.stringify(temp));
    }
    // console.log(JSON.stringify(entity_done));

    //判断要删去的实体是否还存在关系
    if(judgeEntity(spanid)){
        window.alert("该实体与其他实体有关系！");
    }else{
        entity_done[curLabelIndex].splice(i,1);
        $("#"+currentLabelId).remove();
        var spantext = $("#"+spanid).text();
        $("#"+spanid).replaceWith(spantext);
    }
};


//obj=li-img-del-0-1
function relaDelClick(obj){
    var del = obj.substring(15,obj.length);
    //rela-img-del-0-0
    var relaDelId = "rela-ans-li-"+curRelaIndex+"-"+del;
    console.log(JSON.stringify(rela_done[curRelaIndex]));
    for(var i = 0;i < rela_done[curRelaIndex].length;i++){
        var temp = rela_done[curRelaIndex][i];
        console.log(temp.relaId);
        if(temp.relaId == relaDelId){
            rela_done[curRelaIndex].splice(i,1);
            // console.log("temp:"+temp);
        }
        // console.log(i+":"+JSON.stringify(temp));
    }
    console.log(JSON.stringify(rela_done[curRelaIndex]));
    $("#"+relaDelId).remove();
};

//判断要删去的实体是否还存在关系
function judgeEntity(obj) {
    for (var i = 0;i < rela_done.length;i++){
        for(var j = 0;j < rela_done[i].length;j++){
            var temp = rela_done[i][j];
            if(temp.fromId == obj || temp.toId == obj){
                return true;
            }
        }
    }
    return false;
}


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

            console.log("data"+JSON.stringify(data));

            taskInfo=data.data; //console.log(taskInfo);
            labelList=data.data.labelList;//console.log(labelList);
            relaList=data.data.relationList;console.log("relaList"+JSON.stringify(relaList));
            documentList =data.data.documentList;//console.log(documentList);
            docId=documentList[0].did;//console.log(docId);
            deadline=data.data.deadline;
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
             * 对实体label的加载和处理，以及页面的显示
             */
            labelHtml(labelList);
            labelpopHtml(labelList);
            //对实体关系的加载和处理，以及页面的显示
            relationHtml(relaList);
            relaPopHtml(relaList);

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
            if(data.data==null || data.data==""){
                alert("该文本已经全部完成，没有进行中的段落！")
            }else{

                /**
                 * 左边文件内容的显示处理
                 */
                console.log("docid"+docid);
                paraIndex =data.data.length;//段落数
                var sflag=0;
                //var div_footer='<div class="text-center">';
                for(var i=0;i<paraIndex;i++){
                    paraContent[i]=data.data[i].paracontent;//每段内容

                    dtstatus[i]=data.data[i].dtstatus;//每段的状态

                    if(data.data[i].dtstatus=="已完成"){

                        sflag++;
                    }
                    // data.data：[{"color":"#ff8080","index_begin":6,"index_end":5,"label_id":44},{"color":"#ff8080","index_begin":23,"index_end":22,"label_id":44},{"color":"#ffff80","index_begin":4,"index_end":3,"label_id":45}]
                    alreadyDone[i]=data.data[i].alreadyDone;//每段已经做了的信息抽取的值

                    // console.log("data.data："+JSON.stringify(alreadyDone[i]));
                    paraId[i]=data.data[i].pid;//console.log(paraId[i]);//每段内容的ID

                }


                //如果文档已经完成的话
                if(sflag==paraIndex){

                    if(!($("#nexttask").hasClass("disabled"))){
                        $("#nexttask").addClass("disabled");
                        $("#nexttask").attr("disabled","true");
                    }

                    if(!($("#submit-task").hasClass("disabled"))){
                        $("#submit-task").addClass("disabled");
                        $("#submit-task").attr("disabled","true");
                    }

                }else{
                    if($("#nexttask").hasClass("disabled")){
                        $("#nexttask").removeClass("disabled");
                        $("#nexttask").removeAttr("disabled");

                    }
                    if($("#submit-task").hasClass("disabled")){
                        $("#submit-task").removeClass("disabled");
                        $("#submit-task").removeAttr("disabled");
                    }
                }




                $("#p-para").html(paraContent[0]);//设置内容
                //对第一段的处理
                if(curParaIndex==0){
                    if(dtstatus[0]=="已完成"){

                        //todo:设置右边标签不可以被选中

                        for(var i=0;i<labelList.length;i++){

                            var togId="a_tog_"+i;
                            $("#"+togId).attr("data-toggle","t");

                            if($("#"+label_list_img[i]).hasClass("isAns")){

                                $("#"+label_list_img[i]).attr("src","/images/noClick.png");
                                $("#"+label_list_img[i]).addClass("noClick").removeClass("isAns");
                                $("#"+label_ans_div[i]).collapse('hide');


                            }else if($("#"+label_list_img[i]).hasClass("notAns")){

                                $("#"+label_list_img[i]).attr("src","/images/noClick.png");
                                $("#"+label_list_img[i]).addClass("noClick").removeClass("notAns");
                                $("#"+label_ans_div[i]).collapse('hide');

                            }

                        }
                        //todo:设置提交按钮不可以被提交
                        if(!($("#submit-task").hasClass("disabled"))){
                            $("#submit-task").addClass("disabled");
                            $("#submit-task").attr("disabled","true");
                        }

                    }else{

                        for(var i=0;i<labelList.length;i++){

                            var togId="a_tog_"+i;
                            $("#"+togId).attr("data-toggle","collapse");


                            if($("#"+label_list_img[i]).hasClass("noClick")){

                                $("#"+label_list_img[i]).attr("src","/images/notAns.png");
                                $("#"+label_list_img[i]).addClass("notAns").removeClass("noClick");
                                $("#"+label_ans_div[i]).collapse('hide');

                            }
                        }
                        if($("#submit-task").hasClass("disabled")){
                            $("#submit-task").removeClass("disabled");
                            $("#submit-task").removeAttr("disabled");

                        }
                    }
                }

                /**
                 * 绘制已经做了的任务
                 */
                // paintAlreadyDone();


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
                        // $("#p-para").html(paraContent[curParaIndex]);//显示第1段内容

                        var curParaIndexNum =parseInt(curParaIndex);
                        $("#span-index").html("第"+(curParaIndexNum+1)+"段");//设置内容面板的标题
                        $("#p-para").html(paraContent[curParaIndexNum]);//设置内容


                        if(paraContent[curParaIndex].indexOf("<span")==-1){
                            //paintAlreadyDone();
                        }

                        console.log(dtstatus[curParaIndexNum]);
                        //如果该段的状态是“已完成”
                        if(dtstatus[curParaIndexNum]=="已完成"){

                            //todo:设置右边标签不可以被选中

                            for(var i=0;i<labelList.length;i++){

                                var togId="a_tog_"+i;
                                $("#"+togId).attr("data-toggle","t");

                                if($("#"+label_list_img[i]).hasClass("isAns")){

                                    $("#"+label_list_img[i]).attr("src","/images/noClick.png");
                                    $("#"+label_list_img[i]).addClass("noClick").removeClass("isAns");
                                    $("#"+label_ans_div[i]).collapse('hide');


                                }else if($("#"+label_list_img[i]).hasClass("notAns")){

                                    $("#"+label_list_img[i]).attr("src","/images/noClick.png");
                                    $("#"+label_list_img[i]).addClass("noClick").removeClass("notAns");
                                    $("#"+label_ans_div[i]).collapse('hide');

                                }

                            }
                            //todo:设置提交按钮不可以被提交
                            if(!($("#submit-task").hasClass("disabled"))){
                                $("#submit-task").addClass("disabled");
                                $("#submit-task").attr("disabled","true");
                            }

                        }else{
                            if($("#submit-task").hasClass("disabled")){
                                $("#submit-task").removeClass("disabled");
                                $("#submit-task").removeAttr("disabled");
                            }

                            for(var i=0;i<labelList.length;i++){

                                var togId="a_tog_"+i;
                                $("#"+togId).attr("data-toggle","collapse");


                                if($("#"+label_list_img[i]).hasClass("noClick")){

                                    $("#"+label_list_img[i]).attr("src","/images/notAns.png");
                                    $("#"+label_list_img[i]).addClass("notAns").removeClass("noClick");
                                    $("#"+label_ans_div[i]).collapse('hide');

                                }
                            }

                        }

                    }
                });
            }




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
        entity_done[i] = new Array;
        label_ans_div[i]="label-ans-div-"+i;//panel-body-div的ID

        var list_html = '<div class="panel panel-success">'
            +'<div class="panel-heading">'
                +'<h4 class="panel-title">'
                    +'<a data-toggle="collapse" data-parent="#accordion" href="#'+label_ans_div[i]+'" id="a_tog_'+i+'">'
                        +'<img class="notAns" src="/images/notAns.png" id="label-list-img-'+i+'" onclick="imgClick(this.id)">'
                     +'</a>'+labelList[i].labelname
                +'</h4>'
            +'</div>'
            +'<div id="label-ans-div-'+i+'" class="panel-collapse collapse">'
                +'<div class="panel-body">'
                    +'<ul class="list-group" id="label-ans-ul-'+i+'">'
                        +'<li class="list-group-item" id="label-ans-li-'+i+'-0">'
                            +'<div class="row">'
                                +'<div class="col-lg-10" id="li-ans-div-'+i+'-0">'
                                +'</div>'
                                +'<div class="col-lg-1">'
                                    +'<img class="okAns" src="/images/ok.png" id="li-img-ok-'+i+'-0">'
                                +'</div>'
                                +'<div class="col-lg-1">'
                                    +'<img class="delAns" src="/images/delete.png" id="li-img-del-'+i+'-0">'
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

    //实体html的显示
    $("#labellist-div-panel").append(label_html);
};

function labelpopHtml(labelList){

    labelLength =labelList.length;//relation的数量

    var labelpop_Html="";
    for(var i=0;i<labelLength;i++){
        if(i == 0){
            var list_html ='<div>' +
                '<input type="radio" name="entity" value="'+i+'" checked="checked"  />' +
                labelList[i].labelname +
                '</div>';
        }else{
            var list_html ='<div>' +
                '<input type="radio" name="entity" value="'+i+'"/>' +
                labelList[i].labelname +
                '</div>';
        }

        labelpop_Html =labelpop_Html+list_html;

    }
    //测试实体关系的显示
    $("#label-pop").append(labelpop_Html);
};


/**
 * 右侧对实体关系的加载和处理，
 * @param relationList
 */
function relationHtml(relationList){

    relationLength =relationList.length;//relation的数量

    var relation_html="";
    for(var i=0;i<relationLength;i++){
        //初始化数组
        rela_done[i] = new Array;

        relation_ans_div[i]="rela-ans-div-"+i;//panel-body-div的ID

        var list_html = '<div class="panel panel-success">'
            +'<div class="panel-heading">'
            +'<h4 class="panel-title">'
            +'<a data-toggle="collapse" data-parent="#accordion" href="#'+relation_ans_div[i]+'" id="a_tog_'+i+'">'
            +'<img class="notAns" src="/images/notAns.png" id="rela-list-img-'+i+'" onclick="relaimgClick(this.id)">'
            +'</a>'+relationList[i].relation
            +'</h4>'
            +'</div>'
            +'<div id="rela-ans-div-'+i+'" class="panel-collapse collapse">'
            +'<div class="panel-body">'
            +'<ul class="list-group" id="rela-ans-ul-'+i+'">'
            +'<li class="list-group-item" id="rela-ans-li-'+i+'-0">'
            +'<div class="row">'
            +'<div class="col-lg-10" id="rela-ans-div-'+i+'-0">'
            +'</div>'
            +'<div class="col-lg-1">'
            +'<img class="okAns" src="/images/ok.png" id="rela-img-ok-'+i+'-0">'
            +'</div>'
            +'<div class="col-lg-1">'
            +'<img class="delAns" src="/images/delete.png" id="rela-img-del-'+i+'-0">'
            +'</div>'
            +'</div>'
            +'</li>'
            +'</ul>'
            +'</div>'
            +'</div>'
            +'</div>';

        relation_html =relation_html+list_html;
    }
    //测试实体关系的显示
    $("#relationlist-div-panel").append(relation_html);
};


function relaPopHtml(relationList){

    relationLength =relationList.length;//relation的数量

    var select_Html="";
    for(var i=0;i<relationLength;i++){
        if(i == 0){
            var list_html ='<div>' +
                '<input type="radio" name="relation" value="'+i+'" checked="checked" checked />' +
                relationList[i].relation +
                '</div>';
        }else{
            var list_html ='<div>' +
                '<input type="radio" name="relation" value="'+i+'"/>' +
                relationList[i].relation +
                '</div>';
        }

        select_Html =select_Html+list_html;

    }
    //测试实体关系的显示
    $("#relation-pop").append(select_Html);
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
                paraContent[curParaIndex]=str;//console.log("str:" + str);
                alert("添加成功");
                //隐藏当前label的添加和删除
                $("#"+li_ans_div[curLabelIndex][addLiNum]).append("<span>"+doTaskData.text+"</span>");
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
                    +'<img class="delAns" src="/images/delete.png" id="li-img-del-'+curLabelIndex+'-'+(addLiNum+1)+'">'
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
    console.log("---------------------------------------start")
    console.log("paraStr="+paraStr);
    console.log("paraLabelId="+paraLabelId);
    console.log("strLen="+strLen);

    var num1=paraStr.indexOf("<");//console.log("num1="+num1);
    var num2=paraStr.indexOf(">");//console.log("num2="+num2);
    var str1=paraStr.substring(window.getSelection(),num2+1);//console.log("str1="+str1);
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

//获取实体的开始和结束位置
function getEntityStartEnd(){
    var textarea = document.getElementById("p-para");
    var selection = window.getSelection();
    var txt = window.getSelection().toString();

    var selectAnchorNode = selection.anchorNode;
    var nodebegin = selection.anchorOffset;

    var begin = 0;
    var nodelist = textarea.childNodes;
    for (var i = 0;i < nodelist.length;i++){
        var templength = nodelist[i].textContent.length;
        if(nodelist[i].contains(selectAnchorNode) ){
            var nodeindex = nodelist[i].textContent.indexOf(selectAnchorNode.textContent);
            begin = begin + nodeindex + nodebegin;
            // console.log("-----");
            // console.log(begin);
            break;
        }
        begin += templength;
    }
    var end = begin+txt.length;
    var startend = {start:begin,end:end}
    return startend;
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
 * 绘制已经做了的实体
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

function ajaxNextTask(taskData) {
    $.ajax({
        url: "/extraction/nexttask",
        type: "post",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:taskData,
        success: function (data) {

        }, error: function (XMLHttpRequest, textStatus, errorThrown) {


        },
    });
};

//url: "/dpara/status",
function ajaxSubmitTask(taskData) {
    $.ajax({
        url: "/extraction/submit",
        type: "post",
        traditional: true,
        //application/x-www-form-urlencoded; charset=UTF-8
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "text",
        data:taskData,
        success: function (data) {
            top.location.href ="/html/u_homepage.html";
            //window.location.href ="do_Homepage.html";直接下一个任务了
        }, error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("跳转了error");
        },
    });
};

/**
 * 点击两个实体，触发的弹窗
 * @param entity
 */
function selectentityforrela(id){

    if(fromEntity == ""){
        fromEntity = id;
        console.log(id);
    }else if(fromEntity != id){
        $("#from").text($("#"+fromEntity).text());
        $("#from").attr("value",fromEntity);
        $("#to").text($("#"+id).text());
        $("#to").attr("value",id);
        $("#choiceRela").slideDown(300);
        fromEntity = "";
    }

};

//关系弹窗确认
function relaPopClick(fromentity,toentity,rela) {
    //隐藏当前label的添加和删除
    var addLiNum = rela_done[rela].length;

    $("#rela-ans-div-"+rela+"-"+addLiNum).text(fromentity.text+"-"+toentity.text+":"+relaList[rela].relation);
    // $("#rela-img-ok-"+rela+"-"+addLiNum).attr("src","/images/blank.PNG");
    $("#rela-img-ok-"+rela+"-"+addLiNum).attr("src","/images/labelsuccess.png");
    $("#rela-img-ok-"+rela+"-"+addLiNum).removeAttr("onclick");
    // $("#rela-img-del-"+rela+"-"+addLiNum).attr("src","/images/labelsuccess.png");
    $("#rela-img-del-"+rela+"-"+addLiNum).attr("onclick","relaDelClick(this.id)");


    /**
     * 提交一个li之后，添加一个li
     */
    var addLi= '<li class="list-group-item" id="rela-ans-li-'+rela+'-'+(addLiNum+1)+'">'
        +'<div class="row">'
        +'<div class="col-lg-10" id="rela-ans-div-'+rela+'-'+(addLiNum+1)+'">'
        +'</div>'
        +'<div class="col-lg-1">'
        +'<img class="okAns" src="/images/ok.png" id="rela-img-ok-'+rela+'-'+(addLiNum+1)+'">'
        +'</div>'
        +'<div class="col-lg-1">'
        +'<img class="delAns" src="/images/delete.png" id="rela-img-del-'+rela+'-'+(addLiNum+1)+'">'
        +'</div>'
        +'</div>'
        +'</li>';

    $("#rela-ans-ul-"+rela).append(addLi);
    var relaId = "rela-ans-li-"+rela+'-'+addLiNum;
    rela_done[rela].push({relaId:relaId,fromId:fromentity.spanid,fromEntity:fromentity.text,toId:toentity.spanid,toEntity:toentity.text});
};


function entityPopClick(entity,label) {
    //隐藏当前label的添加和删除
    var addLiNum = entity_done[label].length;

    /**
     * 鼠标选中一段文本，点击添加后对选中的文本样式进行改变
     * @type {Selection}
     */
    var selection = window.getSelection();
    console.log("anchorOffset:"+selection.anchorOffset);
    console.log("focusOffset:"+selection.focusOffset);
    var range = selection.getRangeAt(0);//返回索引对应的选区中的 DOM 范围。
    var txt = selection.toString();

    /**
     * 可以根据用户选中的颜色标记文本
     * @type {string}
     */
        // var testcolor="#"+$("#"+label_color[curLabelIndex]).val();//console.log(testcolor);
    var span = document.createElement("span");
    span.style.fontSize = "20px";
    // span.style.color=testcolor;
    span.style.color=labelList[label].color;
    span.id="label-ul-li-span-"+label+"-"+(addLiNum);
    // span.setAttribute("onclick", "getentity("+span.id+")");
    span.setAttribute("onclick", "selectentityforrela(id)");
    span.appendChild(document.createTextNode(txt));
    // console.log(document.createTextNode(txt));
    selection.deleteFromDocument();//从文档中删除选区中的文本
    // console.log(span);
    range.insertNode(span);//将你要添加的格式添加到DOM范围里
    $("#li-ans-div-"+label+"-"+addLiNum).text(entity);
    // $("#li-img-ok-"+label+"-"+addLiNum).attr("src","/images/blank.PNG");
    $("#li-img-ok-"+label+"-"+addLiNum).attr("src","/images/labelsuccess.png");
    $("#li-img-ok-"+label+"-"+addLiNum).removeAttr("onclick");
    // $("#li-img-del-"+label+"-"+addLiNum).attr("src","/images/labelsuccess.png");
    $("#li-img-del-"+label+"-"+addLiNum).attr("onclick","imgDelClick(this.id)");


    /**
     * 提交一个li之后，添加一个li
     */
    var addLi= '<li class="list-group-item" id="label-ans-li-'+label+'-'+(addLiNum+1)+'">'
        +'<div class="row">'
        +'<div class="col-lg-10" id="li-ans-div-'+label+'-'+(addLiNum+1)+'">'
        +'</div>'
        +'<div class="col-lg-1">'
        +'<img class="okAns" src="/images/ok.png" id="li-img-ok-'+label+'-'+(addLiNum+1)+'">'
        +'</div>'
        +'<div class="col-lg-1">'
        +'<img class="delAns" src="/images/delete.png" id="li-img-del-'+label+'-'+(addLiNum+1)+'">'
        +'</div>'
        +'</div>'
        +'</li>';

    $("#label-ans-ul-"+label).append(addLi);

    //将数据存入数组
    var spanId = "label-ul-li-span-"+label+"-"+(addLiNum);
    var labelId="label-ans-li-"+label+'-'+addLiNum;
    var startend = getEntityStartEnd();
    entity_done[label].push({spanId:spanId,labelId:labelId,entity:entity,start:startend.start,end:startend.end});
};


