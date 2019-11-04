$(function(){
  $(".inner-list").on("mouseover", function(){
    let now = $(".inner-list").index(this) ;
    $(".now-selected-red").removeClass("now-selected-red");
    $(".inner-list").eq(now).addClass("now-selected-red");
  });
  $(".category-boxs").hover(function(){
    $(".brand-list").css("display", "block");
  },
  function(){
    $(".brand-list").css("display", "none");
  });
})


