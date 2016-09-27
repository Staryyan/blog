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
        Article m_article = DBUtil.queryArticle(id, "UncheckedArticles");
    %>
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <script>
        function Delete(id) {
            var url="deleteUncheckedArticle";
            var params={
                id:id
            };
            $.ajax({
                url:url,
                type:'POST',
                data:params,
                async:false,
                success:function (Data) {
                    Materialize.toast("Delete Article succeed!", 2000);
                    window.location.href="listCheckArticles.jsp";
                },
                error:function (XML) {
                    alert(XML.responseText);
                }
            })
        }
        function Reply() {
            $("#modal-Articles-reply").openModal();
        }
        function reply_apply() {
            var url="applyUncheckedArticles";
            var params={
                id:<%=m_article.getId()%>,
                content:$("#reply-content").val()
            };
            $.ajax({
                url:url,
                type:'POST',
                data:params,
                async:false,
                success:function (Data) {
                    window.location.href = "listCheckArticles.jsp";
                },
                error:function (XML) {
                    alert(XML.responseText);
                }
            })
        }
        function reply_deny() {
            var url="denyUncheckedArticles";
            var params={
                id:<%=m_article.getId()%>,
                content:$("#reply-content").val()
            };
            $.ajax({
                url:url,
                type:'POST',
                data:params,
                async:false,
                success:function (Data) {
                    window.location.href = "listCheckArticles.jsp";
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
    <jsp:include page="Navigation.jsp"/>

    <h2 class="header"><%=m_article.getTitle()%></h2>
    <h5><i class="material-icons left">perm_identity</i><small>Author:</small><%=m_article.getAuthor()%></h5>
    <h5><i class="material-icons left">perm_identity</i><small>Date:</small><%=m_article.getDate()%></h5>
    <h5><i class="material-icons left">info_outline</i><small>Description:</small><%=m_article.getDescription()%></h5>
    <hr>
    <div id="test-editormd-view2">
        <textarea style="display:none;"><%=m_article.getContent()%></textarea>
    </div>
    <hr />
    <button class="btn green" onclick="Reply()"><i class="material-icons">verified_user</i>Reply</button>
    <a class="btn red" onclick="Delete(<%=m_article.getId()%>)"><i class="material-icons">delete</i>Delete</a>


    <!-- Modal Structure -->
    <div id="modal-Articles-reply" class="modal">
        <div class="modal-content">
            <h4>Reply</h4>
            <p>We will send an email to the author.</p>
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">mode_edit</i>
                    <textarea id="reply-content" class="materialize-textarea"></textarea>
                    <label for="reply-content">Reply</label>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a class="modal-action modal-close btn-flat" id="feedback-deny" onclick="reply_deny()">deny!</a>
            <a class="modal-action modal-close btn-flat" id="feedback-apply" onclick="reply_apply()">Apply!</a>
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
