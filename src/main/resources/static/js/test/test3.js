// Stopwatch
var timeInterval = 0;      // The interval for our loop.循环的间隔。 

var stopwatchClock = $(".container.stopwatch").find(".clock"),
    Timer = stopwatchClock.find('span');





localStorage.stopwatchRunningTime = 0;




/* 实现开始结束 */
$("#stopwatch-btn-start").toggle(function() {
    $(this).text ('开始').css("background", "#3bb4f2");
    if(stopwatchClock.hasClass('inactive')){
        startStopwatch()
    }

}, function() {

    $(this).text ('结束').css("background", "red");
    pauseStopwatch();
})



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
    clearInterval(timeInterval);

    var beginTime = new Date().getTime(),
        runTime = 0;

    localStorage.beginTimer = beginTime;
    localStorage.runTimer = 1;
    timeInterval = setInterval(function () {
        var newTime = (new Date().getTime() - beginTime + runTime);

        Timer.text(timeFormat(newTime));
    }, 100);

    clock.removeClass('inactive');
}

/*停止计时*/
function pauseStopwatch(){
    //  停止计时  
    clearInterval(timeInterval);

    if(Number(localStorage.beginTimer)){

        // 计算运行时间。 
        // 新的运行时间=上次运行时间+现在-最后一次启动 
        var runningTime = Number(localStorage.runTimer) + new Date().getTime() - Number(localStorage.beginTimer);

        localStorage.beginTimer = 0;
        localStorage.runTimer = runningTime;

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

function timeFormat(time){
    var
        seconds = Math.floor((time/1000) % 60),
        minutes = Math.floor((time/(1000*60)) % 60),
        hours = Math.floor((time/(1000*60*60)) % 24);
    seconds = seconds < 10 ? '0' + seconds : seconds;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    return hours + ":" + minutes + ":" + seconds;
}