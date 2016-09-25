$(document).ready(function () {
    loadArticles(1);
});
function loadArticles(page) {
    var url="listUncheckedArticles";
    var params={
        none:""
    };
    $.ajax({
        url:url,
        type:'POST',
        data:params,
        async:false,
        success:function (Data) {
            var data = eval("(" + Data + ")");
            var list = data["list"];
            var total = 0;
            $("#articles-list").empty();
            if (list.length == 0) {
                $("#UncheckedArticles-div").append("<h1 style='text-align: center'>No checked articles here.</h1>")
            }
            for (var object in list) {
                total++;
                if (object < 16 * page && object >= 16 * (page - 1)) {
                    var li = $("<li></li>");
                    li.append("<div class='collapsible-header'><i class='material-icons'>filter_drama</i>" + list[object]["title"] + "</div>");
                    li.append("<div class='collapsible-body'><p>" + list[object]["description"] + "</p><a class='btn waves-effect waves-light' type='submit' " +
                        "href='checkArticles.jsp?id=" + list[object]["id"] + "' style='margin: 10px; " +
                        "position: relative; bottom: 10px; left: 10px;'><i class='material-icons left'>visibility</i>Check</a></div>");
                    $("#articles-list").append(li);
                }
            }
            var pages = total / 16;
            if (total % 16 != 0) {
                pages++;
            }
            $("#UncheckedArticles-list").empty();
            for (var i = 1; i <= pages; i++) {
                $("#UncheckedArticles-list").append("<li id='page"+ i +"' class='waves-light pages'><a onclick='loadArticles("+i+")'>"+i+"</a></li>");
            }
            $("#page"+page).addClass("active");
        },
        error:function (XML) {
            alert(XML.responseText);
        }
    });
}
