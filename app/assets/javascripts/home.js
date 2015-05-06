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
    var calendar_address = '/forecast/' + forecastLocation;
    $('#calendar_url').val('https://' + location.host + calendar_address + '.ics');
    $('#calendar').show();

    var $forecastPreview = $('#forecast_preview');
    $.get(calendar_address + '.json', function(data) {
      $forecastPreview.empty();
      var today = moment();
      var foundRain = false;
      for(var i = 0; i < data.length; i++) {
        var appointment = data[i];
        var timeFrom = moment(appointment['time_from']);
        var timeTo = moment(appointment['time_to']);
        if(timeFrom.isSame(today, 'day')) {
          foundRain = true;
          var times = timeFrom.format('HH:mm') + ' - ' + timeTo.format('HH:mm');
          var $appointment = $('<div class="card blue darken-2"><div class="card-content white-text"><div class="card-title"></div><div class="appointment-times"></div></div></div>');
          $appointment.find('.card-title').text('Rain');
          $appointment.find('.appointment-times').text(times);
          $forecastPreview.append($appointment);
        }
      }
      if(!foundRain) {
        $forecastPreview.append('<p>No rain today!</p>');
      }
      $('#forecast_for_today').show();
    });
  });
});
