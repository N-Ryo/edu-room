var timeout_id;
var slider;
$(document).on('turbolinks:load', function(){
  slider = $('.bxslider').bxSlider({
    onSliderLoad: function () {
        timeout_id = setTimeout(function(){} , 1000);
    },
    onSlideAfter: function () {
        timeout_id = setTimeout(TimeoutFunc , 1000);
    },
    auto: true,           // 自動スライド
    speed: 1000,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 5000,          // 自動スライドの待ち時間
    maxSlides: 12,         // 一度に表示させる最大数
    minSlides: 12,
    autoHover: true       // ホバー時に自動スライドを停止
  });
  
  function TimeoutFunc(){
    slider.startAuto();
  };
});