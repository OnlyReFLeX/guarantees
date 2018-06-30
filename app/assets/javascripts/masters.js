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


  if (icon.html() == 'cancel') {
    icon.html('edit');
  } else {
    icon.html('cancel');
  }
  form.toggle();
  title.toggle();
});
