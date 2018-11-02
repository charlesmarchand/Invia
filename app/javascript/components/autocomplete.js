function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var schoolAddress = document.getElementById('school_address');

    if (schoolAddress) {
      var autocomplete = new google.maps.places.Autocomplete(schoolAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(schoolAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
