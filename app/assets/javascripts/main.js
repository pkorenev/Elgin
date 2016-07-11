$(document).ready(function(){
  $('.square').on("click", ".plus", function(){
    $container = $(this).closest('.square')
    $container.find(".popup").addClass("show-it")
    $('.header-container').css({"display": "none"})
  });
  $('.square').on("click", ".close-popup", function(){
    $container = $(this).closest('.square')
    $container.find(".popup").removeClass("show-it")
    $('.header-container').css({"display": "block"})
  });
})
// $.clickOut('.popup .text', function(){
//   $('.popup').removeClass('show-it')
// })
$("body").on("click", ".questions li", function(){
  $(this).toggleClass('show-it')
})