$(document).ready(function () {
    loadFeedback(1);
});
function loadFeedback(page) {
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
            var total = 0;
            $("#feedback-list").empty();
            if (list.length == 0) {
                $("#Feedback-div").append("<h1 style='text-align: center'>No feedback here.</h1>")
            }
            for (var object in list) {
                total++;
                if (object < 16 * page && object >= 16 * (page - 1)) {
                    var li = $("<li></li>");
                    li.append("<div class='collapsible-header'><i class='material-icons'>perm_identity</i>" + list[object]["author"] + "</div>");
                    li.append("<div class='collapsible-body'><p style='padding-top: 15px; padding-bottom: 15px;'><i class='material-icons'>today</i>" + list[object]["date"] + "</p>" +
                        "<p style='padding-top: 15px; padding-bottom: 15px;'><i class='material-icons'>assignment</i>" + list[object]["content"] + "</p>" +
                        "<a class='btn' type='submit' " +
                        "style='margin: 10px; " +
                        "position: relative; bottom: 10px; left: 10px;' onclick='reply(\"" + list[object]["author"] + "\"," + list[object]["id"] + ")'><i class='material-icons left'>verified_user</i>Reply</a>" +
                        "<a class='btn red waves-red' type='submit' style='position: relative; top: 5px; left: 20px;' onclick='Delete(" + list[object]["id"] + ")'><i class='material-icons left'>delete</i>Delete</a></div>");
                    $("#feedback-list").append(li);
                }
            }
            var pages = total / 16;
            if (total % 16 != 0) {
                pages++;
            }
            $("#feedback-list-page").empty();
            for (var i = 1; i <= pages; i++) {
                $("#feedback-list-page").append("<li id='page"+ i +"' class='waves-light pages'><a onclick='loadArticles("+i+")'>"+i+"</a></li>");
            }
            $("#page"+page).addClass("active");
        }
    });
}
function reply(author, id) {
    document.getElementById("receiver").value = author;
    document.getElementById("feedback-id").value = id;
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
    var url="reply";
    var params={
        author:$("#receiver").val(),
        content:$("feedback-content").val(),
        id:$("#feedback-id").val()
    };
    $.ajax({
        url:url,
        type:'POST',
        data:params,
        async:false,
        success:function (Data) {
            Materialize.toast("Reply succeed!", 2000);
            loadFeedback();
        },
        error:function (XML) {
            alert(XML.responseText);
        }
    })
}
