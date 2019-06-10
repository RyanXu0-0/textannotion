// /**
//  * Created by lenovo on 2018/12/15.
//  */
// console.log("hhaa");
// var data22;
// layui.use('table', function(){
//     var table = layui.table;
//
//     table.on('tool(test)', function(obj){
//         data22 = obj.data;
//         if(obj.event === 'detailcontent'){
//             //layer.msg('ID：'+ data.id + ' 的查看操作');
//             // alert(data.id);
//
//
// //                $.ajax({
// //                    url: "/task/addTask",
// //                    type: "post",
// //                    traditional: true,
// //                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
// //                    dataType: "json",
// //
// //                    success: function (data) {
// //
// //                    }, error: function (XMLHttpRequest, textStatus, errorThrown) {
// //                        console.log(XMLHttpRequest.status);
// //                        console.log(XMLHttpRequest.readyState);
// //                        console.log(textStatus);
// //
// //                    },
// //                });
//         }
//     });
// });
// layui.use(['jquery', 'layer'], function(){
//     var $ = layui.$ //重点处
//         ,layer = layui.layer;
//
//     //后面就跟你平时使用jQuery一样
//     $(function(){
//
//         console.log();
//         $("#testButton").click(function() {
//
//
//         });
//
//
//
//
//     });
//
//     function initData() {
//         $.ajax({
//             url: "/task/selectAll",
//             type: "get",
//             traditional: true,
//             contentType: "application/x-www-form-urlencoded; charset=UTF-8",
//             dataType: "json",
//             success: function (data) {
//                 // var taskList=data.data.task;
//                 // var taskHtml="";
//                 // for(var i=0;i<taskList.length;i++){
//                 //     taskHtml += '<tr><td>' + taskList[i].id + '</td><td>'
//                 //         + taskList[i].id + '</td><td>'
//                 //         + taskList[i].id+ '</td><td>'
//                 //         + taskList[i].id + '</td><td>'
//                 //         + taskList[i].id + '</td><td>'
//                 //         + taskList[i].id + '</td><td>'
//                 //         + taskList[i].id + '</td><td>'
//                 //         + taskList[i].id + '</td></tr>>';
//                 // }
//                 // $("#test tbody").append(taskHtml);
//
//             }, error: function (XMLHttpRequest, textStatus, errorThrown) {
//                 console.log(XMLHttpRequest.status);
//                 console.log(XMLHttpRequest.readyState);
//                 console.log(textStatus);
//
//             },
//         });
//     };
// });
