$(document).ready(function () {
    loadArticles(1);
});
function loadArticles(page) {
    $("#waiting").removeClass("active");
    var url = "listArticle";
    var params = {
        none:""
    };
    $.ajax({
        url:url,
        data:params,
        type:'POST',
        async:false,
        success:function (data) {
            var Data = eval("("+data+")");
            var list = Data["list"];
            var total = 0;
            $("#list").empty();
            if (list.length == 0) {
                $("#list-div").append("<h1>No articles here!</h1>")
            }
            for (var object in list) {
                total++;
                if (object < 16 * page && object >= 16 * (page - 1)) {
                    var li = $("<li></li>");
                    li.append("<div class='collapsible-header'><i class='material-icons'>filter_drama</i>" + list[object]["title"] + "</div>");
                    li.append("<div class='collapsible-body'><p>" + list[object]["description"] + "</p><a class='btn waves-effect waves-light' type='submit' " +
                        "href='readArticle.jsp?id=" + list[object]["id"] + "' style='margin: 10px; " +
                        "position: relative; bottom: 10px; left: 10px;'><i class='material-icons left'>visibility</i>Read more!</a></div>");
                    $("#list").append(li);
                }
            }
            var pages = total / 16;
            if (total % 16 != 0) {
                pages++;
            }
            $("#Articles-list").empty();
            for (var i = 1; i <= pages; i++) {
                $("#Articles-list").append("<li id='page"+ i +"' class='waves-light pages'><a onclick='loadArticles("+i+")'>"+i+"</a></li>");
            }
            $("#page"+page).addClass("active");
        },
        error:function (XML) {
            alert(XML.responseText);
        }
    })
}
