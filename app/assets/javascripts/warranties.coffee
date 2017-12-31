$(document).on "turbolinks:load", ->
  loaded_product = $('#warranty_model :selected').text()
  categorys = $('#warranty_model').html()
  $('#warranty_model').parent().hide()
  if loaded_product.length != 0
   brand = $('#warranty_boiler :selected').text()
   escaped_brand = brand.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
   options = $(categorys).filter("optgroup[label=#{escaped_brand}]").html()
   $('#warranty_model').html(options)
   $('#warranty_model').parent().show()
  $('#warranty_boiler').change ->
    brand = $('#warranty_boiler :selected').text()
    escaped_brand = brand.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(categorys).filter("optgroup[label='#{escaped_brand}']").html()
    if options
      $('#warranty_model').html(options)
      $('#warranty_model').parent().show()
    else
      $('#warranty_model').empty()
      $('#warranty_model').parent().hide()
