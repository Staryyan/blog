$(document).ready(function () {
    Signed();
    loadArticles(1);
    $("#feedback-send").click(function () {
        var url = "signed";
        var params = {
            none: ""
        };
        $.ajax({
            url: url,
            type: 'POST',
            data: params,
            async: false,
            success: function (data) {
                var Data = eval("(" + data + ")");
                var profile = $("#profile");
                if (!Data["signed"]) {
                    Materialize.toast("Please Sign in first.", 2000);
                } else {
                    url="insertFeedback";
                    var params={
                        author:Data["userName"],
                        content:$("#feedback-content").val()
                    };
                    $.ajax({
                        url:url,
                        type:'POST',
                        data:params,
                        async:false,
                        success:function (data) {
                            Materialize.toast("Feedback succeed!", 2000);
                        },
                        error:function (XML) {
                            alert(XML.responseText);
                        }
                    })
                }
            }
        });
    });
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
            type:'POST',
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
    $("#writeArticle").click(function () {
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
                    Materialize.toast("Please Sign in first.", 2000);
                } else {
                    window.location.href = "../web-content/writeArticle.jsp";
                }
            }
        });
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
                    $("#modal-profile").closeModal();
                }
            },
            error:function (XML) {
                alert(XML.responseText);
            }
        });
    });
    $("#reset_password").click(function () {
        var url="findPassword";
        var params = {
            userName:$("#p_userName").val(),
            email:$("#p_email").val()
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
                    Materialize.toast("Please check your email as soon as you can!", 2000);
                    $("#modal-forget").closeModal();
                }
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
function loadArticles(page) {
    $("#waiting").removeClass("active");
    var url = "listArticle";
    var params = {
        none:""
    };
    $.ajax({
        url:url,
        data:params,
        type:'POST',
        async:false,
        success:function (data) {
            var Data = eval("("+data+")");
            var list = Data["list"];
            var total = 0;
            $("#list").empty();
            for (var object in list) {
                total++;
                if (object < 16 * page && object >= 16 * (page - 1)) {
                    var li = $("<li></li>");
                    li.append("<div class='collapsible-header'><i class='material-icons'>filter_drama</i>" + list[object]["title"] + "</div>");
                    li.append("<div class='collapsible-body'><p>" + list[object]["description"] + "</p><a class='btn waves-effect waves-light' type='submit' " +
                        "href='readArticle.jsp?id=" + list[object]["id"] + "' style='margin: 10px; " +
                        "position: relative; bottom: 10px; left: 10px;'><i class='material-icons left'>visibility</i>Read more!</a></div>");
                    $("#list").append(li);
                }
            }
            var pages = total / 16;
            if (total % 16 != 0) {
                pages++;
            }
            $(".pages").remove();
            for (var i = 1; i <= pages; i++) {
                $("#last-page").before("<li id='page"+ i +"' class='waves-light pages'><a onclick='loadArticles("+i+")'>"+i+"</a></li>");
            }
            $("#page"+page).addClass("active");
        },
        error:function (XML) {
            alert(XML.responseText);
        }
    })
}

function feedback() {
    var url = "signed";
    var params = {
        none: ""
    };
    $.ajax({
        url: url,
        type: 'POST',
        data: params,
        async: false,
        success: function (data) {
            var Data = eval("(" + data + ")");
            var profile = $("#profile");
            if (!Data["signed"]) {
                Materialize.toast("Please Sign in first.", 2000);
            } else {
                $("#modal-feedback").openModal();
            }
        }
    });
}
