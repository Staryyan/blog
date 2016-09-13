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
    <link href="materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
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
            <a href="#!" class="center brand-logo">Stary's Blog</a>
            <ul class="right hide-on-med-and-down">
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

    <div style="position: fixed; bottom: 90px; right: 30px;">
        <a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
    </div>

    <ul class="collapsible popout" data-collapsible="accordion" style="margin-top: 40px;">
            <%
                ArrayList<Article> m_articles = (ArrayList<Article>) session.getAttribute("list");
                if (m_articles != null && m_articles.size() != 0) {
                    for (Article each : m_articles) {
                    %>
            <li>
            <div class="collapsible-header"><i class="material-icons">filter_drama</i><%=each.getTitle()%></div>
            <div class="collapsible-body"><p><%=each.getDescription()%></p>
                <a class="btn waves-effect waves-light" type="submit" href="readArticle.jsp?id=<%=each.getId()%>" style="margin: 10px; position: relative; bottom: 10px; left: 10px;">
                    <i class="material-icons left">visibility</i>Read more!
                </a>
            </div>
            </li>
            <%
                    }
                }
            %>
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
<script src="materialize/jquery-3.1.0.min.js"></script>
<script src="materialize/js/materialize.js"></script>
<script src="materialize/js/materialize.min.js"></script>
</body>
</html>
