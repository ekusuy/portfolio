/*jslint node: true */
'use strict';
$(window).on('load resize', function(){
  trimming('.photo');//ここにトリミングしたい枠の種類
});
function trimming (amazon_img) {
  $(amazon_img).each(function(){
    let box = $(this);
    let i = $('img',this);
    let box_w =$(box).width();
    let box_h =$(box).height();
    let i_w =$(i).width();
    let i_h =$(i).height();
    let i_par =i_w / i_h; //画像の縦横比
    let box_par =box_w / box_h; //画像を包むボックスの縦横比
    //画像の縦横比と枠の縦横比を比べて分岐させ違うトリミングをする
    if (i_par > box_par) { //画像が枠より横長の場合高さ100%で幅左右を切る
      $(i).css({
        'width': 'auto',
        'height':'100%'
      });
    }else{
      $(i).css({//画像が枠より縦長または同じの場合幅100%にして高さの上下を切る
        'width': '100%',
        'height':'auto'
      });
    }
  });
}

$( function() {
  $( '#sortable' ).sortable();
  $( '#sortable' ).disableSelection();
} );
