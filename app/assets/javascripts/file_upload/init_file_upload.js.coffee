init_ajax_delete = () ->
  $('.ajax_delete:not(.armed)').addClass('armed').on 'ajax:success', (evt, data) ->
    $(evt.target).closest('li').replaceWith(data)

init_file_upload = () ->
  $('.file_upload').fileupload
    dataType: 'script'
    add: (e, data) ->
      file = data.files[0]
      data.context = $(tmpl("template-upload", file))
      $('.upload_wrapper').append(data.context)
      data.submit()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    done: (e, data) ->
      $(data.context).slideUp()
      init_ajax_delete()

$ ->
  init_ajax_delete() if $('.ajax_delete').length
  init_file_upload() if $('.file_upload').length
