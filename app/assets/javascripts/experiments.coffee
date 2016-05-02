ready = ->
  return unless $('body#experiments_new').length > 0

  $('.remove').click ->
    $(this).parent('.field').hide()
    field = $(this).parent('.field').data('field')
    $('#add_field select').append($('<option>').attr('value', field).text(field.charAt(0).toUpperCase() + field.substr(1)))
    false

  $('#add_field').submit ->
    field = $(this).find('select').val()
    $('[data-field=' + field + ']').show()
    $('[data-field=' + field + ']').detach().insertBefore($('#add_field'))
    $('option[value=' + field + ']').remove()
    false

  has_field = (field) ->
    $('[data-field=' + field + ']').is(':visible')

  $('#preview').click ->
    fields = {}
    error = ''

    fields.subject = $('[name=subject]').val() if has_field('subject')
    if has_field('date')
      fields.start_date = $('[name=start_date]').val()
      fields.end_date = $('[name=end_date]').val()
      error += 'Invalid start date. ' unless /\d{4}-\d{2}-\d{2}/.test(fields.start_date)
      error += 'Invalid end date. ' unless /\d{4}-\d{2}-\d{2}/.test(fields.end_date)
    fields.description = $('[name=description]').val() if has_field('description')
    fields.keywords = $('[name=keywords]').val() if has_field('keywords')
    fields.keywords = $('[name=location]').val() if has_field('location')

    if error == ''
      $('[name=fields]').val(JSON.stringify(fields))
      $('#preview_form').submit()
    else
      $('.error').text(error)

    false

$(document).ready(ready)
$(document).on('page:load', ready)