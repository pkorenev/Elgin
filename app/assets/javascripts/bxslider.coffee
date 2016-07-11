$(document).ready ->
    slider = $('.bxslider-1').bxSlider
        controls: false
        pager: false
        infiniteLoop: true
        hideControlOnEnd: true
        speed: 500
        pause: 200000
        auto: true
        infiniteLoop: true
        onSlideAfter: ->
            $('.current-slide .number').text((slider.getCurrentSlide()+1))
    $('.slider-prev').click ->
      current = slider.getCurrentSlide()
      slider.goToPrevSlide(current) - 1
    $('.slider-next').click ->
      current = slider.getCurrentSlide()
      slider.goToNextSlide(current) + 1

$(document).ready ->
  $squareWidth = $('.carousel .square').width()
  slider2 = $('.carousel').bxSlider
    pager: false
    controls: false
    minSlides: 2
    maxSlides: 6
    slideWidth: $squareWidth
    slideMargin: 10
  $('.carousel-slider-prev').click ->
    current = slider2.getCurrentSlide()
    slider2.goToPrevSlide(current) - 1
  $('.carousel-slider-next').click ->
    current = slider2.getCurrentSlide()
    slider2.goToNextSlide(current) + 1