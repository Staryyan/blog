$(document).ready(function () {
    loadArticles();
});
function loadArticles() {
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
            $("#articles-list").empty();
            for (var object in list) {
                var li = $("<li></li>");
                li.append("<div class='collapsible-header'><i class='material-icons'>filter_drama</i>" + list[object]["title"] + "</div>");
                li.append("<div class='collapsible-body'><p>" + list[object]["description"] + "</p><a class='btn waves-effect waves-light' type='submit' " +
                    "href='checkArticles.jsp?id=" + list[object]["id"] + "' style='margin: 10px; " +
                    "position: relative; bottom: 10px; left: 10px;'><i class='material-icons left'>visibility</i>Check</a></div>");
                $("#articles-list").append(li);
            }
        },
        error:function (XML) {
            alert(XML.responseText);
        }
    });
}
