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

  $("#call_phone").mask("+7(000)000-00-00", {
    placeholder: "+7(___)___-__-__",
    clearIfNotMatch: true
  });

  $('#call_call_date').datepicker();

  if ($('#call_guarantee').val() != undefined) {
    var hidden_div = $('#hidden_div')
    if ($('#call_guarantee').val() == "true") {
      hidden_div.show();
    } else {
      hidden_div.hide();
      $('call_serial_code').val('');
    }
    document.getElementById('call_guarantee').addEventListener('change', function () {
        var style = this.value == "true" ? 'block' : 'none';
        document.getElementById('hidden_div').style.display = style;
        $('#call_serial_code').val('');
    });
  }

  $('#call_adress').bind("keyup change", function(e) {
    var suggestView = new ymaps.SuggestView('call_adress', {
      provider: {
        suggest:(function(request, options){
         return  ymaps.suggest(request);
        })
      }
    });
  });

  $('#call_serial_code').bind("keyup change", function(e) {
    $.ajax({
       url: '/admin/serial_autocomplete',
       data: { autocomplete: $('#call_serial_code').val() },
       type: 'GET'
    })
  });
};

$(document).on('turbolinks:load',ready);
