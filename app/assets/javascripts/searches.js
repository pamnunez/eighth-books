$(document).on('ready page:load', function(){
    $('.table > tbody > tr').click(function(){
        var href = $(this).find("a").attr("href");
        console.log(href);
        if(href) {
            window.location = href;
        }
    });
});