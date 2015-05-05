// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  $('#forecast').submit(function(e) {
    e.preventDefault();
    e.stopPropagation();
    var forecastLocation = $('#forecast_location').val();
    $('#calendar_url').val('https://' + location.host + '/' + forecastLocation + '/forecast.ics');
    $('#calendar').show();
  });
});
