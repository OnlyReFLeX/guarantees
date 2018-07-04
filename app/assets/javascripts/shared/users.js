var ready = function() {
  function setSmartStyle() {
    $('body').attr('class', 'smart-style-' + $('#user_design').val())
  }

  if ($('#user_design').val() != undefined) {
    setSmartStyle();
  }
  $('#user_design').change(function() {
    setSmartStyle();
  })
};

$(document).ready(ready);
