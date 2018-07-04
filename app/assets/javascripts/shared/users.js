var ready = function() {
  if ($('#user_design').val() != undefined) {
    $('body').attr('class', 'smart-style-' + $('#user_design').val())
  }
  $('#user_design').change(function() {
    $('body').attr('class', 'smart-style-' + $('#user_design').val())
  })
};

$(document).ready(ready);
