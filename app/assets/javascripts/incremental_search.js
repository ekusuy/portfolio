//FIXME AmazonAPIの停止に伴い暫定で停止
// $(window).on('load', function() {
//   let timer;
//   let preInput = "";

//   ajaxSearch = function(input) {
//     $.ajax({
//       url: $(location).attr('pathname'),
//       type: "GET",
//       dataType: 'script',
//       data: ("keyword=" + input)
//     });
//   };

//   triggerAjax = function(input) {
//     //文字列が変更ときのみメソッド実行する
//     if(preInput !== input){
//       clearTimeout(timer);
//       // 処理を500ms毎に実行
//       timer = setTimeout(ajaxSearch, 500, input);
//     }
//   };

//   $('#search-form').on('keyup', function() {
//     // 文字列の先頭と末尾の空白を削除
//     input = $.trim($(this).val());
//     triggerAjax(input);
//     preInput = input;
//   });
// });
