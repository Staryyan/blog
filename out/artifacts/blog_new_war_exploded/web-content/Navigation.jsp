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
            <input type="checkbox" id="Remember_me" />
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
                <div class="collapsible-header"><i class="material-icons">input</i><a onclick="signOut()">Sign out!</a></div>
            </li>
        </ul>
    </div>
</div>

<!-- Modal Trigger -->
<a class="btn-flat" style="position: fixed; bottom: 30px;
    right: 20px; background-color: white;color: darkseagreen; font-size: larger;
    vertical-align: sub" onclick="feedback()"><i class="Small material-icons">turned_in</i>Feedback!</a>

<!-- Modal Structure -->
<div id="modal-feedback" class="modal">
    <div class="modal-content">
        <h4>Feedback</h4>
        <p>If you have any suggestion about this blog, you can write down it and we will check it soon.</p>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">mode_edit</i>
                <textarea id="feedback-content" class="materialize-textarea"></textarea>
                <label for="feedback-content">Feedback</label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a class=" modal-action modal-close btn-flat" id="feedback-send">Send!</a>
    </div>
</div>
