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
    renderVolunteers()
    return

  $('#add_filter').submit ->
    filter = $(this).find('select').val()
    $('[data-filter=' + filter + ']').show()
    renderVolunteers()
    return false

  $('.filter input').change ->
    renderVolunteers()

  $('.filter input').keyup ->
    renderVolunteers()

  renderVolunteers()

$(document).ready(ready)
$(document).on('page:load', ready)
