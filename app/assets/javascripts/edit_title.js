/*jslint node: true */
"use strict";
$(function() {
  $(document).on("click", ".edit_title", function() {
    let edit_area = $("#edit_area"); // タイトル編集フォーム
    let update_url = $(location).attr("pathname"); // updateのURLを形成
    let error_msg = $("#user-error-message"); // エラーメッセージ表示場所
    //AddClassされている場合はajaxを実行
    if ($(".edit_content").length) {
      $.ajax({
        type: "PATCH",
        url: update_url,
        // 編集フォームの値を送信
        data: {
          user: { title: edit_area.val() }
        }
      })
        .done(function(data) {
          // 返却されたJSONをもとに書き換え
          $("#btn_title").text(data["title"]);
          form_toggle();
          error_msg.hide();
          location.reload();
        })
        .fail(function(data) {
          // エラーの場合はエラーメッセージを表示
          let errors = JSON.parse(data.responseText).errors;
          $.each(errors, function(column_name, msg) {
            error_msg.text(column_name + msg);
          });
          error_msg.show();
        });
      //1回目のエディットボタン押下
    } else {
      // フォームの表示・非表示を切り替え、編集フォームにクラスを付与
      form_toggle();
      edit_area.addClass("edit_content");
    }
  });
});
function form_toggle() {
  $("#title_text").toggle();
  $("#edit_area").toggle();
  $(".title_submit").toggle();
}
