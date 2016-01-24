function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var fullAddress = this.getPlace().formatted_address
  $("#teacher_company_address").val(fullAddress);
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('teacher_company_address');
});
