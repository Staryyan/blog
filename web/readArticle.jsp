<%@ page import="beans.Article" %>
<%@ page import="actions.dbUtil.DBUtil" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.ArticleComment" %>
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
    <link rel="stylesheet" href="plugin/editor.md-master/css/editormd.preview.css" />
    <link rel="stylesheet" href="plugin/editor.md-master/css/editormd.css" />
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Article m_article = DBUtil.queryArticle(id);
    %>
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
	<script>
	$(document).ready(function () {
        reloadComments();
	    $("#comment").click(function () {
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
                        $("#modal-comment").openModal();
                    }
                }
            });
	    });
        $("#comment-submit").click(function () {
            var url = "insertComment";
            var params = {
                author:$("#name").val(),
                content:$("#comment-content").val(),
                id:<%=id%>
            };
            $.ajax({
               url:url,
                data:params,
                async:false,
                success:function (Data) {
                    reloadComments();
                },
                error:function (XML) {
                    alert(XML.responseText);
                }
            });

        });
	});
    function reloadComments() {
        var url = "listArticleComments";
        var params = {
            id:<%=m_article.getId()%>
        };
        $.ajax({
           url:url,
            type:'POST',
            data:params,
            async:false,
            success:function (data) {
                var Data = eval("("+data+")");
                var Comments = Data["comments"];
                var comment_id = $("#comments");
                for (var comment in Comments) {
                    comment_id.append("<h5><i class='material-icons left'>perm_identity</i><small>Author:</small>" + Comments[comment]["author"]  + "</h5>");
                    comment_id.append("<h5><i class='material-icons left'>perm_identity</i><small>Date:</small>" + Comments[comment]["date"] + "</h5>");
                    comment_id.append("<p>" + Comments[comment]["content"] + "</p>");
                    comment_id.append("<hr />");
                }
            }

        });
    }
	</script>
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
                <li><a href="article.jsp">Article</a></li>
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
                <input type="text" id="Remember_me" />
                <label for="Remember_me">Remember me!</label>
            </p>
            <a  class="modal-trigger" href="#modal-forget">Forget your password?</a>
        </div>
        <div class="modal-footer">
            <input type="reset" value="Cancel" class="modal-action modal-close btn-flat">
            <input id="logIn" type="submit" value="Log in" class=" btn-flat">
        </div>
    </div>
    <%-- Find Password!--%>
    <div id="modal-forget" class="modal">
        <div class="modal-content">
            <h4>Find your password!</h4>
            <p>We will send you an email to reset your password! Please input your original email to reset your password.</p>
            <div class="input-field col s6">
                <input id="p_userName" required type="text" class="validate">
                <label for="p_userName">User Name</label>
            </div>
            <div class="input-field col s6">
                <input id="p_email" required type="email" class="validate">
                <label for="p_email">Email</label>
            </div>
        </div>
        <div class="modal-footer">
            <input type="reset" value="Cancel" class="modal-action modal-close btn-flat">
            <input id="reset_password" type="submit" value="Submit" class="btn-flat">
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
                        <input id="changePassword_userName" value="" placeholder="User Name" required type="text" readonly>
                        <input id="changePassword_oldpassword" placeholder="password" required type="password" class="validate">
                        <input id="changePassword_newPassword" placeholder="new Password" required type="password" class="validate">
                        <a id="changePassword-btn" class="waves-light btn"><i class="material-icons right">cloud</i>SUBMIT</a>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">place</i>Feedback</div>
                    <div class="collapsible-body"><p>If you have any suggestion or advice about `Stary's blog`. You can send us a email.</p></div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">input</i><a onclick="signOut()">Sign out!</a></div>
                </li>
            </ul>
        </div>
    </div>


    <div style="position: fixed; bottom: 90px; right: 30px;">
        <!-- Modal Trigger -->
        <a class="btn-floating btn-large red" id="comment"><i class="large material-icons">mode_edit</i></a>
    </div>

    <h2 class="header"><%=m_article.getTitle()%></h2>
    <h5><i class="material-icons left">perm_identity</i><small>Author:</small><%=m_article.getAuthor()%></h5>
	<h5><i class="material-icons left">perm_identity</i><small>Date:</small><%=m_article.getDate()%></h5>
    <h5><i class="material-icons left">info_outline</i><small>Description:</small><%=m_article.getDescription()%></h5>
    <hr>
    <div id="test-editormd-view2">
        <textarea style="display:none;"><%=m_article.getContent()%></textarea>
    </div>

    <hr />
    <h2 class="header">Comments</h2>
        <div id="comments">

        </div>

    <!-- Modal Structure -->
    <div id="modal-comment" class="modal bottom-sheet">
        <form action="insertArticleComment.action" method="post">
            <div class="modal-content" style="width: 800px; margin-left: auto; margin-right: auto;">
                <h4 style="text-align: center">Comment</h4>
                <textarea id="comment-content"></textarea>
            </div>
            <div class="modal-footer">
                <button type="submit" class="waves-effect waves-green btn-flat" id="comment-submit">Submit</button>
            </div>
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
<script src="plugin/editor.md-master/lib/marked.min.js"></script>
<script src="plugin/editor.md-master/lib/prettify.min.js"></script>

<script src="plugin/editor.md-master/lib/raphael.min.js"></script>
<script src="plugin/editor.md-master/lib/underscore.min.js"></script>
<script src="plugin/editor.md-master/lib/sequence-diagram.min.js"></script>
<script src="plugin/editor.md-master/lib/flowchart.min.js"></script>
<script src="plugin/editor.md-master/lib/jquery.flowchart.min.js"></script>

<script src="plugin/editor.md-master/editormd.js"></script>
<script type="text/javascript">
    $(function() {
        var testEditormdView, testEditormdView2;

        $.get("test.md", function(markdown) {

            testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // ?? HTML ????????????????
                htmlDecode      : "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm            : true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // ??? ToC ???
                //gfm             : false,
                //tocDropdown     : true,
                // markdownSourceCode : true, // ???? Markdown ????????????? Textarea ??
                emoji           : true,
                taskList        : true,
                tex             : true,  // ?????
                flowChart       : true,  // ?????
                sequenceDiagram : true,  // ?????
            });

            //console.log("???? jQuery ?? =>", testEditormdView);

            // ??Markdown??
            //console.log(testEditormdView.getMarkdown());

            //alert(testEditormdView.getMarkdown());
        });

        testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            emoji           : true,
            taskList        : true,
            tex             : true,  // ?????
            flowChart       : true,  // ?????
            sequenceDiagram : true,  // ?????
        });
    });
</script>
<script type="text/javascript">
    var testEditor;
    $(function() {
        testEditor = editormd("test-editormd", {
            width           : "90%",
            autoHeight      : true,
            path            : "editor.md-master/lib/",
            htmlDecode      : "style,script,iframe",
            tex             : true,
            emoji           : true,
            taskList        : true,
            flowChart       : true,
            sequenceDiagram : true
        });

        $("#append-btn").click(function(){
            $.get("./test.md", function(md){
                testEditor.appendMarkdown(md);
            });
        });
    });
</script>
<!--  Scripts-->
<script src="js/jquery-3.1.0.min.js"></script>
<script src="plugin/materialize/js/materialize.js"></script>
<script src="plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
