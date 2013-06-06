@init_date_picker = () ->
  $('input.date_picker').datepicker()
  $('form').on('nested:fieldAdded', (event) ->
    $(event.field).find('input.date_picker').removeClass('hasDatepicker').datepicker()
  )

$ ->
  init_date_picker()
