$(document).on( "click", "a.edit_master", "turbolinks:load", function(e) {
  e.preventDefault();
  var master_id;
  var form;
  var title;
  var danger_form;
  master_id = $(this).data('masterId')

  danger_form = $('.master-errors_' + master_id);
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
  danger_form.toggle();
});
