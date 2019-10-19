$(function() {
  $('.index-btn').click(function() {
    $('.active').removeClass('active');
    
    var clickedIndex = $('.index-btn').index($(this));
    
    $('.tab-content').eq(clickedIndex).addClass('active');
  });
});