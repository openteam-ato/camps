$ ->
  context = $('.need_collapser')
  $('.collapse_item', context).hide()
  $('.slider', context).on 'click', ->
    $(this).parent().next('.collapse_item').slideToggle()
    false
