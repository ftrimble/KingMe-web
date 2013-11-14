# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

gm_init = ->
  gm_center = new google.maps.LatLng(54, 12)
  gm_map_type = google.maps.MapTypeId.ROADMAP
  map_options = {center: gm_center, zoom: 8, mapTypeId: gm_map_type}
  new google.maps.Map(@map_canvas,map_options);

$ ->
  map = gm_init()

