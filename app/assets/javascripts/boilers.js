$(document).on("turbolinks:load", function() {
  $('a.edit_model').click(function(e) {
    e.preventDefault();
    var model_id;
    var form;
    var title;

    model_id = $(this).data('modelId')

    form = $('#edit_product_model_' + model_id);
    title = $('#product_model_title_' + model_id);

    if (!$(this).hasClass('cancel')) {
      $(this).removeClass('fa-pencil-square-o');
      $(this).addClass('fa-times cancel');
    } else {
      $(this).removeClass('fa-times cancel');
      $(this).addClass('fa-pencil-square-o')
    }
    form.toggle();
    title.toggle();
  });
});
$(document).on("turbolinks:load", function() {
  $('a.edit_boiler').click(function(e) {
    e.preventDefault();
    var boiler_id;
    var form;
    var title;

    boiler = $(this).data('boilerId')

    form = $('#edit_boiler_' + boiler);
    title = $('#boiler_title_' + boiler);

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
