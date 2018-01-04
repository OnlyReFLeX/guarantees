$(document).on "turbolinks:load", ->
  loaded_product = $('#warranty_model :selected').text()
  categorys = $('#warranty_model').html()
  $('#hidden_model').hide()
  if loaded_product.length != 0
   brand = $('#warranty_boiler :selected').text()
   escaped_brand = brand.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
   options = $(categorys).filter("optgroup[label=#{escaped_brand}]").html()
   $('#warranty_model').html(options)
   $('#hidden_model').show()
  $('#warranty_boiler').change ->
    brand = $('#warranty_boiler :selected').text()
    escaped_brand = brand.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(categorys).filter("optgroup[label='#{escaped_brand}']").html()
    if options
      $('#warranty_model').html(options)
      $('#hidden_model').show()
    else
      $('#warranty_model').empty()
      $('#hidden_model').hide()
