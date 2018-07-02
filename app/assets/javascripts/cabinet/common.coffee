$ ->
  # init menu
  $('nav ul').jarvismenu
    accordion: true
    speed: 235
    closedSign: '<em class="fa fa-plus-square-o"></em>'
    openedSign: '<em class="fa fa-minus-square-o"></em>'

  $('#toggle-menu').on 'click', (e) ->
    $('body').toggleClass 'hidden-menu'
    e.preventDefault()
    return

  # init select2 plugin for input
  $('.select2').select2
    theme: 'bootstrap'
    language: 'ru'
    delay: 0
    minimumResultsForSearch: -1

  # add calendar for input
  $('.datepicker').each ->
    $this = $(this)
    minDate = $this.data('minDate') or ''
    maxDate = $this.data('maxDate') or ''
    #    alert maxDate
    $this.datepicker
      dateFormat: 'yy-mm-dd'
      language: 'ru'
      prevText: '<i class="fa fa-chevron-left"></i>'
      nextText: '<i class="fa fa-chevron-right"></i>'
      changeMonth: true
      changeYear: true
      yearRange: "-100:+100"
      minDate: minDate
      maxDate: maxDate
