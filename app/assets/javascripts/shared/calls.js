var ready = function() {
  if (document.querySelector('.call_form')) {

    $('#call_serial_code').change(function() {
      $.getJSON("/admin/warranties/fields_autocomplete?serial=" + $('#call_serial_code').val(), function(data) {
        if (data != null) {
          $('#call_product_model_id').val(data['product_model_id']).trigger('change')
          $('#call_username').val(data['name'])
          $('#call_adress').val(data['adress'])
          $('#call_phone').val(data['phone'])
        }
      });
    })

    $("#call_phone").mask("+7(999)999-99-99", {
      placeholder: "+7(___)___-__-__",
      clearIfNotMatch: true
    });

    var hidden_div = $('#hidden_div')
    if ($('#call_guarantee').val() == "true") {
      hidden_div.show();
    } else {
      hidden_div.hide();
      $('call_serial_code').val('');
    }

    $('#call_guarantee').change(function() {
      if (this.value == "true") {
        hidden_div.show();
      } else {
        hidden_div.hide();
        $('#call_serial_code').val('');
      }
    })

    ymaps.ready(function(){
      var suggestView = new ymaps.SuggestView('call_adress', {
        provider: {
          suggest:(function(request, options){
           return ymaps.suggest(request);
          })
        }
      });
    });

    $(function() {
      $("#call_serial_code").autocomplete({
        minLength: 2,
        source: function(request, response) {
          $.getJSON("/admin/serial_autocomplete", request, function(data, status, xhr) {
            response(data);
          });
        }
      });
    });
  }
};

$(document).ready(ready);
