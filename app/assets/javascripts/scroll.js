$(function(){
  $(".category--sen a").on("click", function(){
    let id = $(this).attr("href");
    let position = $(id).offset().top;
    $("html, body").animate({
      "scrollTop": position
    }, 500);
    return false;
  })

  $(".brand--sen a").on("click", function(){
    let id = $(this).attr("href");
    console.log(id);
    let position = $(id).offset().top;
    $("html, body").animate({
      "scrollTop": position
    }, 500);
    return false;
  })
 
})