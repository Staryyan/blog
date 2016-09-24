<%--
  Created by IntelliJ IDEA.
  User: yanzexin
  Date: 16/9/24
  Time: 下午12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserList</title>
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
            loadUserList();
        });
        function loadUserList() {
            var url="listUsers";
            var params={
                none:""
            };
            $.ajax({
               url:url,
                data:params,
                type:'POST',
                async:false,
                success:function (data) {
                    var Data = eval("(" + data + ")");
                    var list = Data["list"];
                    for (var object in list) {
                        var li = $("<li></li>");
                        li.append("<div class='collapsible-header'><i class='material-icons'>perm_identity</i>" + list[object]["userName"] + "</div>");
                        li.append("<div class='collapsible-body'><p style='padding-bottom: 15px; padding-top: 15px;'><i class='material-icons'>email</i>" + list[object]["email"] + "</p>" +
                                "<p style='padding-bottom: 15px; padding-top: 15px;'><i class='material-icons'>contacts</i>"+ list[object]["phone"] +"</p></div>");
                        $("#user-list").append(li);
                    }
                },
                error:function (XML) {
                    alert(XML.responseText);
                }
            });
        }
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="Navigation.jsp" />
    <ul id="user-list" class="collapsible" data-collapsible="accordion" style="margin-top: 40px;">
    </ul>
    <ul class="pagination">
        <li class="waves-effect"><a><i class="material-icons">chevron_left</i></a></li>
        <li id="last-page" class="waves-effect"><a><i class="material-icons">chevron_right</i></a></li>
    </ul>
</div>
<jsp:include page="Footer.jsp"/>
<!--  Scripts-->
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../plugin/materialize/js/materialize.js"></script>
<script src="../plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
