// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require rails-ujs
//= require jquery
//= require materialize
//= require_tree .

function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete.setBounds(circle.getBounds());
    });
  }
}

$(document).on("turbolinks:load",function(){
  M.AutoInit();
  $('select').formSelect();
  $('.dropdown-trigger').dropdown();
  $('.tooltipped').tooltip();
  $('.modal').modal();


  $('#call_date_start').datepicker({
    container: 'body'
  })
  $('#call_date_end').datepicker();


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

  $("#call_date_clear").click(function() {
    $('#form_call_date #call_date_start').val('');
    $('#form_call_date #call_date_end').val('');
    $('#form_call_date').submit();
  })

})
