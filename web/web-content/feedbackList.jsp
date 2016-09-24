<%--
  Created by IntelliJ IDEA.
  User: yanzexin
  Date: 16/9/24
  Time: 下午1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback List</title>
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
    <link href="../plugin/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="../plugin/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="../css/main.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <script>
        $(document).ready(function () {
            loadFeedback();
        });
        function loadFeedback() {
            var url="listFeedback";
            var params={
                none:""
            };
            $.ajax({
               url:url,
                type:'POST',
                data:params,
                async:false,
                success:function (Data) {
                    var data = eval("("+Data+")");
                    var list = data["list"];
                    $("#feedback-list").empty();
                    for (var object in list) {
                        var li = $("<li></li>");
                        li.append("<div class='collapsible-header'><i class='material-icons'>perm_identity</i>"+list[object]["author"]+"</div>");
                        li.append("<div class='collapsible-body'><p style='padding-top: 15px; padding-bottom: 15px;'><i class='material-icons'>today</i>" + list[object]["date"]+"</p>" +
                                "<p style='padding-top: 15px; padding-bottom: 15px;'><i class='material-icons'>assignment</i>"+ list[object]["content"]+"</p>" +
                                "<a class='btn' type='submit' " +
                                "style='margin: 10px; " +
                                "position: relative; bottom: 10px; left: 10px;' onclick='reply("+ list[object]["id"] + ")'><i class='material-icons left'>verified_user</i>Reply</a>" +
                                "<a class='btn red waves-red' type='submit' style='position: relative; top: 5px; left: 20px;' onclick='Delete("+ list[object]["id"] +")'><i class='material-icons left'>delete</i>Delete</a></div>");
                        $("#feedback-list").append(li);
                    }
                }
            });
        }
        function reply(id) {
            document.getElementById("receiver").value = id;
            $("#modal-reply").openModal();
        }
        function Delete(id) {
            var url="deleteFeedback";
            var params= {
                id: id
            };
            $.ajax({
                url:url,
                type:'POST',
                data:params,
                async:false,
                success:function (Data) {
                    Materialize.toast("Delete Feedback succeed!", 2000);
                    loadFeedback();
                },
                error:function (XML) {
                    alert(XML.responseText);
                }
            })
        }
        function reply_send() {

        }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="Navigation.jsp" />
        <ul id="feedback-list" class="collapsible" data-collapsible="accordion" style="margin-top: 40px;">
        </ul>
        <ul class="pagination">
            <li class="waves-effect"><a><i class="material-icons">chevron_left</i></a></li>
            <li id="last-page" class="waves-effect"><a><i class="material-icons">chevron_right</i></a></li>
        </ul>
    </div>

    <!-- Modal Structure -->
    <div id="modal-reply" class="modal">
        <div class="modal-content">
            <h4>Reply</h4>
            <p>We will send an email to the author.</p>
            <input type="text" value="" id="receiver" style="display: none;">
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">mode_edit</i>
                    <textarea id="feedback-content" class="materialize-textarea"></textarea>
                    <label for="feedback-content">Reply</label>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a class=" modal-action modal-close btn-flat" id="feedback-send">Send!</a>
        </div>
    </div>

<jsp:include page="Footer.jsp"/>
<!--  Scripts-->
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../plugin/materialize/js/materialize.js"></script>
<script src="../plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
