/**
 * Created by lenovo on 2018/12/20.
 */

var labelList;//label的列表
var labelLength;//label的数量
var curLabelIndex=0;//当前被选中的label
var label_list_img=new Array;//标签前面图片的ID
var label_p_ans =new Array;//标签内容的展示p
$(function () {
    var taskId={
        taskid:8
    };
    $.ajax({
        url: "/label/getLabelByTask",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        data:taskId,
        success: function (resdata) {
            labelList=resdata.label;
            labelLength =labelList.length;

            var label_html="";
            for(var i=0;i<labelLength;i++){
                var list_html ='<div class="layui-row" id="label-div-'+i+'">'
                                    +'<div class="layui-col-md3">'
                                        +'<img class="notAns" src="./images/notAns.png" id="label-list-img-'+(i+1)+'" onclick="testtt(this.id)">'
                                            +labelList[i].labelname+'：'
                                    +'</div>'
                                    +'<div class="layui-col-md9" id="label-div-ans'+i+'">'
                                        +'<p id ="label-p-ans-'+(i+1)+'"></p>'
                                    +'</div>'
                                +'</div>'+'<br>';
                label_html =label_html+list_html;

                label_list_img[i+1]="label-list-img-"+(i+1);
                label_p_ans[i+1]="label-p-ans-"+(i+1);
               // console.log(label_list_img[i]);
            }

            $("#labellist-div-panel").append(label_html);


        }, error: function (XMLHttpRequest, textStatus, errorThrown) {

        },
    });

    $('#test').mouseup(function(){
        var txt = window.getSelection?window.getSelection():document.selection.createRange().text;
        $("#label-p-ans-test").text(txt);
        console.log(curLabelIndex+"ha");
        console.log(label_list_img[curLabelIndex]);
        if(curLabelIndex!=0){
            $("#"+label_p_ans[curLabelIndex]).text(txt);
        }

        console.log(window.getSelection().anchorOffset);
    });

    $("#label-list-img-test").click(function () {

        console.log(labelList);
        if($("#label-list-img-test").hasClass("isAns")){
            $("#label-list-img-test").attr("src","./images/notAns.png")
            $("#label-list-img-test").addClass("notAns").removeClass("isAns");

        }else{
            $("#label-list-img-test").attr("src","./images/isAns.png");
            $("#label-list-img-test").removeClass("notAns").addClass("isAns");
        }
    });



});
function testtt(obj) {
    console.log(labelLength);
    var i=obj.substring(15,obj.length);

    curLabelIndex=i;
    console.log(curLabelIndex);
    var curlabelName=labelList[curLabelIndex-1].labelname;
    $("#label-selected").html(curlabelName);
    if($("#"+label_list_img[i]).hasClass("isAns")){
        $("#"+label_list_img[i]).attr("src","./images/notAns.png");
        $("#"+label_list_img[i]).addClass("notAns").removeClass("isAns");
        curLabelIndex=0;
        $("#"+label_p_ans[i]).text("");

        $("#label-selected").html("");
    }else{
        for(var j=1;j<labelLength+1;j++){
            $("#"+label_list_img[j]).attr("src","./images/notAns.png");
            $("#"+label_list_img[j]).removeClass("isAns").addClass("notAns");
           // console.log(j+"kkk");
        }
        //console.log(label_list_img[i]+"aa");
        $("#"+label_list_img[i]).attr("src","./images/isAns.png");
        $("#"+label_list_img[i]).removeClass("notAns").addClass("isAns");
    }

};