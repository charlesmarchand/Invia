import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';


const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 46.227638, lng: 2.213749 });
  map.setZoom(5);

  const buttons = document.querySelectorAll('.show_schools');
  buttons.forEach((button, index) => {
    button.addEventListener('click', (event) => {
      map.removeMarkers();
      const markers = JSON.parse(event.currentTarget.dataset.markers);
      map.addMarkers(markers);

        if (markers.length === 0) {
          map.setZoom(2);
        } else if (markers.length === 1) {
          map.setCenter(markers[0].lat, markers[0].lng);
          map.setZoom(14);
        } else {
          map.fitLatLngBounds(markers);
        }

    google.maps.event.trigger(markers[index], 'click');
      });
  });
}

autocomplete();
