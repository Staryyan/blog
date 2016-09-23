<%@ page import="beans.Article" %>
<%@ page import="utils.dbUtil.DBUtil" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/material-icons.css" type="text/css" rel="stylesheet">
    <link href="../plugin/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="../plugin/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="../plugin/editor.md-master/css/editormd.preview.css" />
    <link rel="stylesheet" href="../plugin/editor.md-master/css/editormd.css" />
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
	<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
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
                var url = "InsertArticleCommentAction";
                var params = {
                    author:$("#name").val(),
                    content:$("#comment-content").val(),
                    id:<%=id%>
                };
                $.ajax({
                    url:url,
                    data:params,
                    type:'POST',
                    async:false,
                    success:function (Data) {
                        Materialize.toast("Comment succeed!", 2000);
                        reloadComments();
                        $("#modal-comment").closeModal();
                    },
                    error:function (XML) {
                        alert(XML.responseText);
                    }
                });

            });
        });
        function reloadComments() {
            var url = "ListArticleCommentsAction";
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
    <script type="text/javascript" src="../js/main.js"></script>
</head>
<body>
<div class="container">
    <jsp:include page="Navigation.jsp"/>

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
            <div class="modal-content" style="width: 800px; margin-left: auto; margin-right: auto;">
                    <div class="input-field col s12">
                        <textarea id="comment-content" class="materialize-textarea"></textarea>
                        <label for="comment-content">Comment</label>
                    </div>
                <div class="modal-footer">
                    <button type="submit" class="waves-effect waves-green btn-flat" id="comment-submit">Submit</button>
                </div>
            </div>
    </div>
</div>
<jsp:include page="Footer.jsp"/>

<script src="../plugin/editor.md-master/examples/js/jquery.min.js"></script>
<script src="../plugin/editor.md-master/lib/marked.min.js"></script>
<script src="../plugin/editor.md-master/lib/prettify.min.js"></script>

<script src="../plugin/editor.md-master/lib/raphael.min.js"></script>
<script src="../plugin/editor.md-master/lib/underscore.min.js"></script>
<script src="../plugin/editor.md-master/lib/sequence-diagram.min.js"></script>
<script src="../plugin/editor.md-master/lib/flowchart.min.js"></script>
<script src="../plugin/editor.md-master/lib/jquery.flowchart.min.js"></script>

<script src="../plugin/editor.md-master/editormd.js"></script>
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
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../plugin/materialize/js/materialize.js"></script>
<script src="../plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
