// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function toTitleCase(str) {
  return str.replace(/\w\S*/g, function(str) {
    return str.charAt(0).toUpperCase() + str.substr(1).toLowerCase();
  });
}

$(function() {
  $('#forecast').submit(function(e) {
    e.preventDefault();
    e.stopPropagation();
    var forecastLocation = toTitleCase($('#forecast_location').val());
    $('#calendar_url').val('https://' + location.host + '/forecast/' + forecastLocation + '.ics');
    $('#calendar').show();
  });
});
