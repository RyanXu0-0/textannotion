// Stopwatch
var stopwatchInterval = 0;      // The interval for our loop.循环的间隔。

var stopwatchClock = $(".container.stopwatch").find(".clock"),
    stopwatchDigits = stopwatchClock.find('span');
$(function () {

    /* 实现开始结束 */
    $("#stopwatch-btn-start").click(function() {
        startStopwatch();
    });
    // $('#js-export').click(function(){
    //     console.log("hah");
    //     window.location.href="/file/export?tid=13";
    // });
    // var test="1";
    // ajaxdoTaskInfo(test);
    // console.log("haha");
});

/**
 * 做任务上传自己的标签
 * @param doTaskData
 */
// function ajaxdoTaskInfo(doTaskData) {
//
//     $.ajax({
//         url: "/test/test1",
//         type: "post",
//         traditional: true,
//         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
//         dataType: "json",
//         data:doTaskData,
//         success: function (data) {
//             console.log(data);
//
//         }, error: function (XMLHttpRequest, textStatus, errorThrown) {
//
//
//         },
//     });
//
//
// };










// 检查前一个会话是否在秒表运行时结束。
//  如果是的话，按时间重新开始。
//即 关闭浏览器，点击开始，在后台保持计时的状态
if(Number(localStorage.stopwatchBeginingTimestamp) && Number(localStorage.stopwatchRunningTime)){

    var runningTime = Number(localStorage.stopwatchRunningTime) + new Date().getTime() - Number(localStorage.stopwatchBeginingTimestamp);

    localStorage.stopwatchRunningTime = runningTime;  //保存后台一直进行的时间

    startStopwatch();
}


//如果前一个会话有运行时间，就把它写在时钟上。
// 如果没有初始化为0。
//即结束时不可刷新
if(localStorage.stopwatchRunningTime){

    stopwatchDigits.text(returnFormattedToMilliseconds(Number(localStorage.stopwatchRunningTime)));

}
else{
    localStorage.stopwatchRunningTime = 0;
}



/* 实现开始结束 */
// $("#stopwatch-btn-start").toggle(function() {
//     $(this).text ('开始').css("background", "#3bb4f2");
//     if(stopwatchClock.hasClass('inactive')){
//         startStopwatch()
//     }
//
// }, function() {
//
//     $(this).text ('结束').css("background", "red");
//     pauseStopwatch();
// });



// Pressing the clock will pause/unpause the stopwatch.
//按下暂停/恢复的时钟秒表

/*stopwatchClock.on('click',function(){

 if(stopwatchClock.hasClass('inactive')){
 startStopwatch()
 }
 else{
 pauseStopwatch();
 }
 });*/


/*开始计时*/
function startStopwatch(){
    // 防止多个间隔同时进行。
    clearInterval(stopwatchInterval);

    var startTimestamp = new Date().getTime(),
        runningTime = 0;

    localStorage.stopwatchBeginingTimestamp = startTimestamp;
    console.log("3");
    // 应用程序还记得上一次会话运行了多长时间。
    // if(Number(localStorage.stopwatchRunningTime)){
    //     runningTime = Number(localStorage.stopwatchRunningTime);
    // }
    // else{
    //     localStorage.stopwatchRunningTime = 1;
    // }

    // 每隔100ms重新计算运行时间，计算公式是
    //   当你上次启动时钟+上次运行时间
    localStorage.stopwatchRunningTime = 1;
    stopwatchInterval = setInterval(function () {
        var stopwatchTime = (new Date().getTime() - startTimestamp + runningTime);

        stopwatchDigits.text(returnFormattedToMilliseconds(stopwatchTime));
    }, 100);

    stopwatchClock.removeClass('inactive');
};

/*停止计时*/
function pauseStopwatch(){
    //  停止计时
    clearInterval(stopwatchInterval);

    if(Number(localStorage.stopwatchBeginingTimestamp)){

        // 计算运行时间。
        // 新的运行时间=上次运行时间+现在-最后一次启动
        var runningTime = Number(localStorage.stopwatchRunningTime) + new Date().getTime() - Number(localStorage.stopwatchBeginingTimestamp);

        localStorage.stopwatchBeginingTimestamp = 0;
        localStorage.stopwatchRunningTime = runningTime;

        stopwatchClock.addClass('inactive');
    }
}

// 重置.
/*function resetStopwatch(){
 clearInterval(stopwatchInterval);

 stopwatchDigits.text(returnFormattedToMilliseconds(0));
 localStorage.stopwatchBeginingTimestamp = 0;
 localStorage.stopwatchRunningTime = 0;

 stopwatchClock.addClass('inactive');
 }
 */

function returnFormattedToMilliseconds(time){
    var
        seconds = Math.floor((time/1000) % 60),
        minutes = Math.floor((time/(1000*60)) % 60),
        hours = Math.floor((time/(1000*60*60)) % 24);
    seconds = seconds < 10 ? '0' + seconds : seconds;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    return hours + ":" + minutes + ":" + seconds;
}
