<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <link rel="stylesheet" href="editor.md-master/css/editormd.css" />
    <script type="text/javascript" src="materialize/jquery-3.1.0.min.js"></script>
    <%
        Cookie[] cookies = request.getCookies();
        String userName = "";
        boolean flag = false;
        for (Cookie each : cookies) {
            if (each.getName().equals("userName") && each.getValue() != null) {
                userName = each.getValue();
                flag = true;
            }
            System.out.print(each.getValue());
        }
//        if (!flag) {
//            response.sendRedirect("main_unSigned.jsp");
//        }
    %>
    <script>
        $(document).ready(function () {
            $('.modal-trigger').leanModal();
        });
    </script>
</head>
<body>

<div class="container">
    <nav>
        <div class="nav-wrapper">
            <ul class="left hide-on-med-and-down">
                <!-- Dropdown Trigger -->
                <li><a id="name" class="dropdown-button" href="#" data-activates="profile"><%=userName%><i class="material-icons right">arrow_drop_down</i></a></li>
                <ul id='profile' class='dropdown-content'>
                    <li><a href="#modal-changePassword" class="modal-trigger">Change Password</a></li>
                    <li><a>Feedback.</a></li>
                    <li class="divider"></li>
                    <li><a href="main_unSigned.jsp">Sign out</a></li>
                </ul>
            </ul>
            <a href="#" class="center brand-logo">Stary's Blog</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="#">Article</a></li>
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
                <input name="userName" value="<%=userName%>" placeholder="User Name" required type="text" class="validate">
                <input name="password" placeholder="password" required type="password" class="validate">
                <input name="newPassword" placeholder="new Password" required type="password" class="validate">
            </div>
            <div class="modal-footer">
                <input type="reset" value="Cancel!" class="modal-action modal-close btn-flat">
                <input type="submit" value="Change!" class=" btn-flat">
            </div>
        </div>
    </form>


    <div class="row" style="margin-top: 40px;">
        <form class="col s12" action="writeArticle.action" method="post">
            <div class="row">
            <div class="input-field col s6">
                <input name="m_article.author" id="author" value="<%=userName%>" required type="text" class="validate">
                <label for="author">author</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input name="m_article.date" type="date" class="validate">
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

<script src="editor.md-master/examples/js/jquery.min.js"></script>
<script src="editor.md-master/editormd.js"></script>
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
<script src="materialize/js/materialize.js"></script>
<script src="materialize/js/materialize.min.js"></script>
</body>
</html>