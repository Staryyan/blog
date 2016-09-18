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
    <script type="text/javascript" src="js/writeArticle.js"></script>
</head>
<body>
<div class="container">
    <jsp:include page="Navigation.jsp"/>
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

<jsp:include page="Footer.jsp"/>
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
