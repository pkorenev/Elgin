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