$(document).on( "click", "a.edit_master", function(e) {
  e.preventDefault();
  var master_id;
  var form;
  var title;
  var icon;

  master_id = $(this).data('masterId')

  form = $('#edit_master_' + master_id);
  title = $('#master_title_' + master_id);

  icon = $(this).children();


  if (icon.hasClass('fa-times')) {
    icon.addClass('fa-pencil')
    icon.removeClass('fa-times')
  } else {
    icon.addClass('fa-times')
    icon.removeClass('fa-pencil')
  }
  form.toggle();
  title.toggle();
});
