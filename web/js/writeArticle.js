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
                profile.append("<li><a class='modal-trigger' href='#modal-login'>Log in</a></li>");
                profile.append("<li><a class='modal-trigger' href='#modal-register'>Register</a></li>");
            } else {
                profile.empty();
                profile.append("<li><a onclick='Profile()' style='margin-left:20px; margin-right:20px;'>"+ Data["userName"] +"</a></li>");
                document.getElementById("author").value = Data["userName"];
            }
        }
    });
}
