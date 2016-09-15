<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="plugin/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="plugin/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <link rel="stylesheet" href="plugin/editor.md-master/css/editormd.css" />
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script>
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
                        document.getElementById("author").value = Data["userName"];
                    }
                }
            });
        }
        function Profile() {
            $("#modal-profile").openModal();
        }
    </script>
</head>
<body>
<div class="container">
    <nav>
        <div class="nav-wrapper">
            <ul id="profile" class="right hide-on-med-and-down">
            </ul>
            <a href="#!" class="center brand-logo" style="margin-left: 10px;">Stary's Blog</a>
            <ul class="left hide-on-med-and-down">
                <li><a href="listArticle.action">Article</a></li>
                <li><a href="#">Discussion</a></li>
                <li><a href="writeArticle.jsp">Write Article</a></li>
            </ul>
        </div>
    </nav>
    <!--Log in Operation-->
    <form action="changePassword.action">
        <div id="modal-changePassword" class="modal" style="width: 400px">
            <div class="modal-content">
                <h4 style="text-align: center">Change Password</h4>
                <input name="userName" value="yes" placeholder="User Name" required type="text" class="validate">
                <input name="password" placeholder="password" required type="password" class="validate">
                <input name="newPassword" placeholder="new Password" required type="password" class="validate">
            </div>
            <div class="modal-footer">
                <input type="reset" value="Cancel!" class="modal-action modal-close btn-flat">
                <input type="submit" value="Change!" class=" btn-flat">
            </div>
        </div>
    </form>
    <!--Log in Operation-->
    <div id="modal-login" class="modal" style="width: 400px">
        <div class="modal-content">
            <h4 style="text-align: center">Log in</h4>
            <input id="l_userName" placeholder="User Name" required type="text" class="validate">
            <input id="l_password" placeholder="password" required type="password" class="validate">
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


    <div class="row" style="margin-top: 40px;">
        <form class="col s12" action="writeArticle.action" method="post">
            <div class="row">
            <div class="input-field col s6">
                <input name="m_article.author" id="author" value="" required type="text" class="validate">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input name="m_article.title" id="title" required type="text" class="validate">
                <label for="title">Title</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input name="m_article.description" id="description" type="text" required class="validate">
                <label for="description">Description</label>
            </div>
        </div>
        <div class="row">
        <div id="test-editormd">
            <textarea style="display:none;" name="m_article.content"></textarea>
        </div>
        </div>
        <button class="btn waves-effect waves-light" type="submit" name="action" style="float: right">Finish!
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>
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

<script src="plugin/editor.md-master/examples/js/jquery.min.js"></script>
<script src="plugin/editor.md-master/editormd.js"></script>
<script type="text/javascript">
    var testEditor;
    $(function() {
        // You can custom @link base url.
        editormd.urls.atLinkBase = "https://github.com/";

        testEditor = editormd("test-editormd", {
            width     : "90%",
            height    : 720,
            toc       : true,
            //atLink    : false,    // disable @link
            //emailLink : false,    // disable email address auto link
            todoList  : true,
            path      : 'editor.md-master/lib/'
        });
    });
</script>
<!--  Scripts-->
<script src="plugin/materialize/js/materialize.js"></script>
<script src="plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
