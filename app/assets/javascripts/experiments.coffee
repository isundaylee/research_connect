ready = ->
  return unless $('body#experiments_new').length > 0

  $('.remove').click ->
    $(this).parent('.field').hide()
    false

  $('#add_field').submit ->
    field = $(this).find('select').val()
    $('[data-field=' + field + ']').show()
    false

  has_field = (field) ->
    $('[data-field=' + field + ']').is(':visible')

  $('#preview').click ->
    fields = {}

    fields.subject = $('[name=subject]').val() if has_field('subject')
    fields.start_date = $('[name=start_date]').val() if has_field('date')
    fields.end_date = $('[name=end_date]').val() if has_field('date')
    fields.description = $('[name=description]').val() if has_field('description')
    fields.keywords = $('[name=keywords]').val() if has_field('keywords')
    fields.keywords = $('[name=location]').val() if has_field('location')

    $('[name=fields]').val(JSON.stringify(fields))
    $('#preview_form').submit()

    false

$(document).ready(ready)
$(document).on('page:load', ready)