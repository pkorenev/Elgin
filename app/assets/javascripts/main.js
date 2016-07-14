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

$.clickOut('.popup .text', function(){
      $('.popup').removeClass('show-it')
    }, {except: '.plus'} )

$(document).ready(function(){
  $('body').on("click", ".share", function(){
    $('.popup-social').addClass('show-it')
    $('.header-container').css({"display": "none"})
  });
  $('.popup-social').on("click", ".close-popup", function(){
    $('.popup-social').removeClass('show-it')
    $('.header-container').css({"display": "block"})
  });
})

$.clickOut('.popup-social .social-container', function(){
      $('.popup-social').removeClass('show-it')
    }, {except: '.share'} )

$("body").on("click", ".questions li, .choose-language", function(){
  $(this).toggleClass('show-it')
})