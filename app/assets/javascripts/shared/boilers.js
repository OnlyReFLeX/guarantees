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
