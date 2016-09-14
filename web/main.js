/**
 * Created by yanzexin on 16/9/14.
 */
$(document).ready(function () {
    Signed();
    $('.modal-trigger').leanModal();
    $("#userName").blur(function () {
        var url = "checkuserName";
        var params = {
            userName:$("#userName").val()
        };
        $.ajax({
            url:url,
            type:'POST',
            data:params,
            async: false,
            success:function (data) {
                var Data = eval("("+data+")");
                if (Data["error"]) {
                    document.getElementById("result").innerHTML = "<p style='color: red'>"+ Data["info"] + "</p>";
                } else {
                    document.getElementById("result").innerHTML = "<p style='color: green'>" + Data["info"] + "</p>";
                }
            },
            error:function () {
            }
        });
    });
    $("#btn").click(function () {
        var url = "register";
        var params = {
            userName:$("#userName").val(),
            password:$("#password").val(),
            email:$("#email").val(),
            phone:$("#phone").val()
        };
        $.ajax({
            url:url,
            type:'POST',
            data:params,
            async: false,
            success:function (data) {
                var Data = eval("("+data+")");
                if (Data["error"]) {
                    Materialize.toast("Register failed!", 2000);
                } else {
                    Materialize.toast('Register succeed!', 2000);
                    $('#modal-register').closeModal();
                }
            },
            error:function (XML) {
                alert(XML.responseText);
            }
        });
    });
    $("#logIn").click(function () {
        var url = "login";
        var params = {
            userName:$("#l_userName").val(),
            password:$("#l_password").val()
        };
        $.ajax({
            url:url,
            tyep:'POST',
            data:params,
            async:false,
            success:function (data) {
                var Data = eval("("+data+")");
                if (Data["error"]) {
                    Materialize.toast(Data["info"], 2000);
                } else {
                    Materialize.toast('Log in succeed!', 2000);
                    $('#modal-login').closeModal();
                    Signed();
                }
            },
            error:function (XML) {
                alert(XML.responseText);
            }
        });
    });
    $("#cancel").click(function () {
        document.getElementById("result").innerHTML = "";
    });
    $("#changePassword-btn").click(function () {
        var url="changePassword";
        var params = {
            userName:$("#changePassword_userName").val(),
            oldPassword:$("#changePassword_oldpassword").val(),
            newpassword:$("#changePassword_newPassword").val()
        };
        $.ajax({
            url:url,
            type:'POST',
            data:params,
            async:false,
            success:function (data) {
                var Data = eval("("+data+")");
                if (Data["error"]) {
                    Materialize.toast(Data["info"], 2000);
                } else {
                    Materialize.toast("Change Password succeed!", 2000);
                }
            },
            error:function (XML) {
                alert(XML.responseText);
            }
        });
    });
});

function Signed() {
    var url = "signed";
    var params = {
        none:""
    };
    $.ajax({
        url:url,
        type:'POST',
        data:params,
        async:false,
        success:function (data) {
            var Data = eval("("+data+")");
            var profile = $("#profile");
            if (!Data["signed"]) {
                profile.empty();
                profile.append("<li><a class='modal-trigger' href='#modal-login'>Log in</a></li>");
                profile.append("<li><a class='modal-trigger' href='#modal-register'>Register</a></li>");
            } else {
                profile.empty();
                profile.append("<li><a onclick='Profile()' style='margin-left:20px; margin-right:20px;'>"+ Data["userName"] +"</a></li>");
                document.getElementById("changePassword_userName").value = Data["userName"];
            }
        }
    });
}
function Profile() {
    $("#modal-profile").openModal();
}
