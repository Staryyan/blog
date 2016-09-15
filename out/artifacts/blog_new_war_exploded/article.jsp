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
    <script type="text/javascript" src="js/main.js"></script>
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
<script src="js/jquery-3.1.0.min.js"></script>
<script src="plugin/materialize/js/materialize.js"></script>
<script src="plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
