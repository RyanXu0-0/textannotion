/**
 * Created by lenovo on 2018/12/15.
 */
$(function () {

    $.ajax({
        url: "/user/getUserinfo",
        type: "get",
        traditional: true,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",
        success: function (data) {

            var username =data.data.userInfo.username;

            $("#username").append(username);
            //console.log(username);
        }, error: function (XMLHttpRequest, textStatus, errorThrown) {

        },
    });


    $("#userlogout").click(function() {
        $.ajax({
            url: "/user/logout",
            type: "get",
            traditional: true,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "text",
            success: function (data) {

                window.location.href ="u_login.html";
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {

            },
        });
    });

});
