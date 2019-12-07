$(function(){
  $(".body__next--top--heading--category--popularitycategory a").on("click", function(){
    let id = $(this).attr("href");
    let position = $(id).offset().top;
    $("html, body").animate({
      "scrollTop": position
    }, 500);
    return false;
  })
})