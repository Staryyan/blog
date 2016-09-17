<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Article" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        /* fallback */
        @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src: local('Material Icons'), local('MaterialIcons-Regular'),
            url(https://fonts.gstatic.com/s/materialicons/v18/2fcrYFNaTjcS6g4U3t-Y5UEw0lE80llgEseQY3FEmqw.woff2) format('woff2');
        }

        .material-icons {
            font-family: 'Material Icons';
            font-weight: normal;
            font-style: normal;
            font-size: 24px;
            line-height: 1;
            letter-spacing: normal;
            text-transform: none;
            display: inline-block;
            white-space: nowrap;
            word-wrap: normal;
            direction: ltr;
            -webkit-font-feature-settings: 'liga';
            -webkit-font-smoothing: antialiased;
        }
    </style>
    <link href="plugin/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="plugin/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/main.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script>
        /**
         * Created by yanzexin on 16/9/14.
         * The Navigation.
         */
        $(document).ready(function () {
            Signed();
            loadArticles();
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
                            window.location.href = "../writeArticle.jsp";
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
        function loadArticles() {
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
                    for (var object in list) {
                        var li = $("<li></li>");
                        li.append("<div class='collapsible-header'><i class='material-icons'>filter_drama</i>" + list[object]["title"] + "</div>");
                        li.append("<div class='collapsible-body'><p>" + list[object]["description"] + "</p><a class='btn waves-effect waves-light' type='submit' " +
                                "href='readArticle.jsp?id=" + list[object]["id"] + "' style='margin: 10px; " +
                                "position: relative; bottom: 10px; left: 10px;'><i class='material-icons left'>visibility</i>Read more!</a></div>");
                        $("#list").append(li);
                    }
                },
                error:function (XML) {
                    alert(XML.responseText);
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <%--Navigation--%>
    <nav>
        <div class="nav-wrapper">
            <ul id="profile" class="right hide-on-med-and-down">
            </ul>
            <a href="main.jsp" class="center brand-logo">Stary's Blog</a>
            <ul class="left hide-on-med-and-down">
                <li><a href="listArticle.action">Article</a></li>
                <li><a href="#">Discussion</a></li>
                <li><a id="writeArticle">Write Article</a></li>
            </ul>
        </div>
    </nav>
    <!--Log in Operation-->
    <div id="modal-login" class="modal">
        <div class="modal-content">
            <h4>Log in</h4>
            <input id="l_userName" placeholder="User Name" required type="text" class="validate">
            <input id="l_password" placeholder="password" required type="password" class="validate">
            <p>
                <input type="checkbox" id="Remember-me" />
                <label for="Remember-me">Remember me!</label>
            </p>
            <a>Forget your password?</a>
        </div>
        <div class="modal-footer">
            <input type="reset" value="Cancel" class="modal-action modal-close btn-flat">
            <input id="logIn" type="submit" value="Log in" class=" btn-flat">
        </div>
    </div>
    <!--Register Operation-->
    <div id="modal-register" class="modal">
        <div class="modal-content">
            <h4>Register</h4>
            <p>We will keep your information safe. Please trust us!</p>
            <input  id="userName"  placeholder="User Name" required type="text" class="validate">
            <p id="result"></p>
            <input id="password" placeholder="password" required type="password" class="validate">
            <input id="email" placeholder="email" required type="email" class="validate">
            <input id="phone" placeholder="phone" required type="tel" class="validate">
        </div>
        <div class="modal-footer">
            <input id="cancel" type="reset" value="Cancel" class="modal-action modal-close btn-flat">
            <input id="btn" type="submit" value="Agree" class="btn-flat">
        </div>
    </div>
    <!--Profile Operation-->
    <div id="modal-profile" class="modal">
        <div class="modal-content">
            <h4>Profile Operation</h4>
            <ul class="collapsible" data-collapsible="accordion">
                <li>
                    <div class="collapsible-header"><i class="material-icons">filter_drama</i>Change Password</div>
                    <div class="collapsible-body profile">
                        <p>You can change password.</p>
                        <input id="changePassword_userName" value="" placeholder="User Name" required type="text" class="validate" readonly>
                        <input id="changePassword_oldpassword" placeholder="password" required type="password" class="validate">
                        <input id="changePassword_newPassword" placeholder="new Password" required type="password" class="validate">
                        <a id="changePassword-btn" class="waves-effect waves-light btn"><i class="material-icons right">cloud</i>SUBMIT</a>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">place</i>Feedback</div>
                    <div class="collapsible-body"><p>If you have any suggestion or advice about `Stary's blog`. You can send us a email.</p></div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">input</i>Sign out!</div>
                </li>
            </ul>
        </div>
    </div>

    <div style="position: fixed; bottom: 90px; right: 30px;">
        <a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
    </div>

    <ul id="list" class="collapsible popout" data-collapsible="accordion" style="margin-top: 40px;">
    </ul>

</div>
<footer class="page-footer">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">About Stary!</h5>
                <p class="grey-text text-lighten-4">If you wanna write article to share with others you can just send me a email.</p>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2016 Copyright Stary. All right reserved!
        </div>
    </div>
</footer>
<!--  Scripts-->
<script src="js/jquery-3.1.0.min.js"></script>
<script src="plugin/materialize/js/materialize.js"></script>
<script src="plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
