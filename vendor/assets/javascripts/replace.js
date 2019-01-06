/*jslint node: true */
'use strict';
$(function() {
  $('#sortable').sortable({
    update: function(event, ui) {
      let order = [];
      let update_url = $(location).attr("pathname") + "/contents";

      $('#sortable li').each( function(e) {
        order[$(this).attr('id')] =  $(this).index() + 1;
      });

      $.ajax({
        url: update_url,
        type: "PATCH",
        data: {positions : order},
        dataType: "json"
      }).done(function(data) {
        // idを並び替え後のpositionで書き換え
        $('#sortable li').each( function(e) {
          $(this).attr('id', $(this).index() + 1);
        });
      });
    }
  });
});
