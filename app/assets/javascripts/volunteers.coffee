ready = ->
  return unless $('body#volunteers_index').length > 0
  
  processMatchFilter = (prev, f, func) ->
    filter = $('[data-filter=' + f + ']')

    return prev if !filter.is(':visible')

    return _.filter prev, (volunteer) ->
      selected = filter.find('[type=checkbox]:checked').map ->
        $(this).val()
      .toArray()
      match = func selected, (opt) ->
        volunteer[f].indexOf(opt) > -1
      return match

  processAgeFilter = (prev) ->
    filter = $('[data-filter=age]')

    return prev if !filter.is(':visible')

    minAge = parseInt($('[name=min_age]').val())
    maxAge = parseInt($('[name=max_age]').val())

    return _.filter prev, (volunteer) ->
      (isNaN(minAge) || volunteer.age >= minAge) &&
      (isNaN(maxAge) || volunteer.age <= maxAge)

  filterResults = ->
    results = gon.volunteers
    results = processMatchFilter(results, 'gender', _.any)
    results = processMatchFilter(results, 'race', _.any)
    results = processMatchFilter(results, 'language', _.all)
    results = processAgeFilter(results)

    return _.map results, (v) -> v.id

  renderVolunteers = ->
    results = filterResults()

    $('.match').each (_, m) ->
      match = $(m)
      id = match.data('id')

      if results.includes(id)
        match.show()
      else
        match.hide()

  $('.remove').click ->
    $(this).parent('.filter').hide()
    filter = $(this).parent('.filter').data('filter')
    $('#add_filter select').append($('<option>').attr('value', filter).text(filter.charAt(0).toUpperCase() + filter.substr(1)))
    renderVolunteers()
    return

  $('#add_filter').submit ->
    filter = $(this).find('select').val()
    $('[data-filter=' + filter + ']').show()
    $('[data-filter=' + filter + ']').detach().appendTo($('.filters'))
    $('option[value=' + filter + ']').remove()
    renderVolunteers()
    return false

  $('.filter input').change ->
    renderVolunteers()

  $('.filter input').keyup ->
    renderVolunteers()

  $('.matches a').click ->
    $(this).find('.match').addClass('visited')
    true

  renderVolunteers()

readyChat = ->
  return unless $('body#volunteers_chat').length > 0

  $('input').keydown (e) ->
    if e.keyCode == 13
      $('input').before($('<p>').addClass('name mine').text('Me'))
      $('input').before($('<p>').addClass('msg mine').text($('input').val()))
      $('input').val('')

$(document).ready(ready)
$(document).ready(readyChat)
$(document).on('page:load', ready)
$(document).on('page:load', readyChat)
