$(function() {
  //各画像左上のeditページリンクにマウスを乗せたら発動
  $('.photo i').hover(function() {
    //ページめくりクラスを付与
    $('.photo').addClass("hvr-curl-top-left");
  //ここにはマウスを離したときの動作を記述
  }, function() {
    //付与したクラスを削除
    $('.photo').removeClass("hvr-curl-top-left");
  });
});
