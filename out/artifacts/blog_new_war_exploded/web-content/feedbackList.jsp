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
    <script type="text/javascript" src="../js/feedbackList.js"></script>
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
            <input type="text" value="" id="receiver" style="display: none">
            <input type="text" value="" id="feedback-id" style="display: none">
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">mode_edit</i>
                    <textarea id="feedback-content" class="materialize-textarea"></textarea>
                    <label for="feedback-content">Reply</label>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a class=" modal-action modal-close btn-flat" id="feedback-send" onclick="reply_send()">Send!</a>
        </div>
    </div>

<jsp:include page="Footer.jsp"/>
<!--  Scripts-->
<script src="../js/jquery-3.1.0.min.js"></script>
<script src="../plugin/materialize/js/materialize.js"></script>
<script src="../plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
