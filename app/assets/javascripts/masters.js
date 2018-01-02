$(document).on("turbolinks:load", function() {
  $('a.edit_master').click(function(e) {
    e.preventDefault();
    var master_id;
    var form;
    var title;

    master_id = $(this).data('masterId')

    form = $('#edit_master_' + master_id);
    title = $('#master_title_' + master_id);

    if (!$(this).hasClass('cancel')) {
      $(this).removeClass('fa-pencil-square-o');
      $(this).addClass('fa-times cancel');
    } else {
      $(this).removeClass('fa-times cancel');
      $(this).addClass('fa-pencil-square-o');
    }
    form.toggle();
    title.toggle();
  });
});
