$(document).on( "click", "a.edit_model", function(e) {
  e.preventDefault();
  var model_id;
  var form;
  var title;
  var icon;

  model_id = $(this).data('modelId')

  form = $('#edit_product_model_' + model_id);
  title = $('#product_model_title_' + model_id);

  icon = $(this).children();


  if (icon.html() == 'cancel') {
    icon.html('edit');
  } else {
    icon.html('cancel');
  }
  form.toggle();
  title.toggle();
});
