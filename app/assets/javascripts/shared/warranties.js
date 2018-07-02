var ready = function() {
  if (document.querySelector('.warranty_form')) {
    ymaps.ready(function(){
      var suggestView = new ymaps.SuggestView('warranty_adress', {
        provider: {
          suggest:(function(request, options){
           return  ymaps.suggest(request);
          })
        }
      });
    });

    $("#warranty_phone").mask("+7(999)999-99-99", {
      placeholder: "+7(___)___-__-__",
      clearIfNotMatch: true
    });

    var hidden_div = $('#hidden_div')
    if ($('#warranty_started').val() == "true") {
      hidden_div.show();
    } else {
      hidden_div.hide();
      $('#warranty_whodidfirststart').val('');
      $('#warranty_datefirststart').val('');
    }

    $('#warranty_started').change(function() {
      if (this.value == "true") {
        hidden_div.show();
      } else {
        hidden_div.hide();
        $('#warranty_whodidfirststart').val('');
        $('#warranty_datefirststart').val('');
      }
    })

      document.getElementById('warranty_started').addEventListener('change', function () {
          var style = this.value == "true" ? 'block' : 'none';
          document.getElementById('hidden_div').style.display = style;
          $('#warranty_whodidfirststart').val('');
          $('#warranty_datefirststart').val('');
      });
  }
};

$(document).ready(ready);
