/*jslint node: true */
'use strict';
$(function(){
  $(document).on('click','.edit_title', function() {
    let title_area =  $('#title_text'); // タイトル表示エリア
    let edit_area =  $('#edit_area'); // タイトル編集フォーム
    let update_url = $(location).attr('pathname'); // updateのURLを形成
    let error_msg = $('#user-error-message'); // エラーメッセージ表示場所
    let title_submit = $('.title_submit') // 編集完了ボタン
    //AddClassされている場合はajaxを実行
    if($('.edit_content').length){
      $.ajax({
        type: 'PATCH',
        url: update_url,
        // 編集フォームの値を送信
        data: {
          user:{title: edit_area.val()}
        }
      }).done(function (data) {
        // 返却されたJSONをもとに書き換え
        $('#title_text h2').text(data['title']);
        title_area.toggle();
        edit_area.toggle();
        title_submit.toggle();
        error_msg.hide();
      }).fail(function(data){
        // エラーの場合はエラーメッセージを表示
        let errors = JSON.parse(data.responseText).errors;
        $.each(errors, (function(column_name, msg){
          error_msg.text(column_name + msg);
        }));
        error_msg.show();
      });
    //1回目のエディットボタン押下
    }else{
      // フォームの表示・非表示を切り替え、編集フォームにクラスを付与
      title_area.toggle();
      edit_area.toggle().addClass("edit_content");
      title_submit.toggle();
    }
  });
});
