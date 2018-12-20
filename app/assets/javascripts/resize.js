/*jslint node: true */
'use strict';
$(window).on('load resize', function(){
  trimming('.photo');//ここにトリミングしたい枠の種類
});
function trimming (amazon_image) {
  $(amazon_image).each(function(){
    let box = $(this);
    let image = $('img',this);
    let box_height =$(box).height();
    let image_height =$(image).height();
    //画像の縦横と枠の縦横を比べて分岐させ、画像の幅と高さを設定する
    if (image_height < box_height) { //画像の高さが枠より小さい場合は幅を100%にする
      $(image).css({
        'width': '100%',
        'position': 'absolute'
      });
    }else{
      $(image).css({//画像が枠より大きい場合は高さと幅を枠に合わせる
        'width': '100%',
        'height':'100%'
      });
    }
  });
}
