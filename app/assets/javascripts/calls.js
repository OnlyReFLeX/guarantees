var ready = function() {
  M.AutoInit();
  $('#call_date_start').datepicker({
    container: 'body'
  });
  $('#call_date_end').datepicker({
    container: 'body'
  });

  $('#created_at_start').datepicker({
    container: 'body'
  });
  $('#created_at_end').datepicker({
    container: 'body'
  });

  $("#call_date_clear").click(function() {
    $('#form_call_date #call_date_start').val('');
    $('#form_call_date #call_date_end').val('');
    $('#form_call_date').submit();
  });

  $("#created_at_clear").click(function() {
    $('#form_created_at #created_at_start').val('');
    $('#form_created_at #created_at_end').val('');
    $('#form_created_at').submit();
  });

  // search
  if ($('#call_search_form #search').val() != '') {
    $('#call_search_form').removeClass('hidden');
    $('#call_search_button').addClass('hidden');
  }
  $('#call_search_button').click(function(e) {
    e.preventDefault();
    $('#call_search_form').removeClass('hidden');
    $(this).addClass('hidden');
    $('#call_search_form #search').focus();
  });
};

$(document).ready(ready);
$(document).on('turbolinks:load',ready);
