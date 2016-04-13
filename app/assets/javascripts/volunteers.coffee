ready = ->
  filterResults = ->
    allResults = $('.match').map (m) ->
      $(m).data('id')
    return allResults

  renderVolunteers = ->
    results = filterResults()
    $('.match').each (_, m) ->
      match = $(m)
      id = match.data('id')

      if results.includes(id) || true
        match.show()
      else
        match.hide()

  renderVolunteers()

$(document).ready(ready)
$(document).on('page:load', ready)
