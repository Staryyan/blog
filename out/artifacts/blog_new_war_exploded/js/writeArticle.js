$(document).ready(function () {
   Signed();
});
function Signed() {
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
                profile.empty();
                profile.append("<li><a onclick='logIn()'>Log in</a></li>");
                profile.append("<li><a onclick='register()'>Register</a></li>");
            } else {
                profile.empty();
                if ( Data["userName"] == "root") {
                    profile.append("<li><a href='../web-content/listCheckArticles.jsp'>Check Articles</a></li>");
                    profile.append("<li><a href='../web-content/feedbackList.jsp'>Check Feedback</a></li>");
                    profile.append("<li><a href='../web-content/userList.jsp'>User List</a>");
                    profile.append("<li><a id='name' onclick='Profile()'>"+ Data["userName"] +"</a></li>");
                    document.getElementById("changePassword_userName").value = Data["userName"];
                } else {
                    profile.append("<li><a id='name' onclick='Profile()'>"+ Data["userName"] +"</a></li>");
                    document.getElementById("changePassword_userName").value = Data["userName"];
                }
                document.getElementById("author").value = Data["userName"];
            }
        }
    });
}
