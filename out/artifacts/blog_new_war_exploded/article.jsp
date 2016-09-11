<html>
<head>
    <title>Title</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <script type="text/javascript" src="materialize/jquery-3.1.0.min.js">
        $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').leanModal();
        });
    </script>
</head>
<body>
<div class="container">
<nav>
    <div class="nav-wrapper">
        <a href="#!" class="brand-logo" style="margin-left: 10px;">Stary</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="#">Article</a></li>
            <li><a href="#">Discussion</a></li>
            <!-- Dropdown Trigger -->
            <li><a class="dropdown-button" href="#" data-activates="profile">Dropdown<i class="material-icons right">arrow_drop_down</i></a></li>
            <ul id='profile' class='dropdown-content'>
                <li><a href="#">Register</a></li>
                <li><a href="#">Write Article</a></li>
                <li class="divider"></li>
                <li><a href="#">Log out</a></li>
            </ul>
        </ul>
    </div>
</nav>
    <div style="position: fixed; bottom: 90px; right: 30px;">
    <a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
    </div>
    <ul class="collapsible popout" data-collapsible="accordion" style="margin-top: 40px;">
    <li>
        <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.
            Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.</p>
            <button class="btn waves-effect waves-light" type="submit" name="action" style="margin: 10px; position: relative; bottom: 30px; left: 10px;">
                <i class="material-icons left">visibility</i>Read more!
            </button>

        </div>
    </li>
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
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="materialize/js/materialize.js"></script>
<script src="materialize/js/materialize.min.js"></script>
</body>
</html>
