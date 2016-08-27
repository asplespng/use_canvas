$(document).on 'turbolinks:load', ->
  $('input.datepicker').each (input) ->
    $(this).datepicker
      dateFormat: 'yy-mm-dd'
      altField: $(this).next()
