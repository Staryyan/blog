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

    <link href="materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <link rel="stylesheet" href="editor.md-master/css/editormd.preview.css" />
    <link rel="stylesheet" href="editor.md-master/css/editormd.css" />
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
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
//		if (!flag) {
//		    response.sendRedirect("main_unSigned.jsp");
//		    }
		%>
	<script>
	$(document).ready(function () {
		$('.modal-trigger').leanModal();
	});
	</script>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Article m_article = DBUtil.queryArticle(id);
        ArrayList<ArticleComment> m_comments = DBUtil.queryArticleComments(id);
	%>
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


    <div style="position: fixed; bottom: 90px; right: 30px;">
        <!-- Modal Trigger -->
        <a class="btn-floating btn-large waves-effect red modal-trigger" href="#modal1"><i class="large material-icons">mode_edit</i></a>
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
    <%
        for (ArticleComment each : m_comments) { %>
        <h5><i class="material-icons left">perm_identity</i><small>Author:</small><%=each.getAuthor()%></h5>
        <h5><i class="material-icons left">perm_identity</i><small>Date:</small><%=each.getDate()%></h5>
            <p><%=m_article.getContent()%></p>
        <hr />
    <%
        }
    %>


    <!-- Modal Structure -->
    <div id="modal1" class="modal bottom-sheet">
        <form action="insertArticleComment.action" method="post">
            <div class="modal-content" style="width: 800px; margin-left: auto; margin-right: auto;">
                <h4 style="text-align: center">Comment</h4>
                <div id="test-editormd">
                    <textarea style="display:none;"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</button>
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

<script src="editor.md-master/examples/js/jquery.min.js"></script>
<script src="editor.md-master/lib/marked.min.js"></script>
<script src="editor.md-master/lib/prettify.min.js"></script>

<script src="editor.md-master/lib/raphael.min.js"></script>
<script src="editor.md-master/lib/underscore.min.js"></script>
<script src="editor.md-master/lib/sequence-diagram.min.js"></script>
<script src="editor.md-master/lib/flowchart.min.js"></script>
<script src="editor.md-master/lib/jquery.flowchart.min.js"></script>

<script src="editor.md-master/editormd.js"></script>
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
<script src="materialize/jquery-3.1.0.min.js"></script>
<script src="materialize/js/materialize.js"></script>
<script src="materialize/js/materialize.min.js"></script>
</body>
</html>
