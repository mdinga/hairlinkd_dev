jQuery ->
  cities = $("#stylist_area_id").html()
  $("#stylist_city_id").change ->
    city = $("#stylist_city_id :selected").text()
    options = $(cities).filter("optgroup[label='#{city}']").html()
    if options
      $('#stylist_area_id').html(options)
    else
      $('#stylist_area_id').empty()
