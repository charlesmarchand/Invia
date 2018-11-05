import GMaps from 'gmaps/gmaps.js';

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
          map.setZoom(13);
        } else {
          map.fitLatLngBounds(markers);
        }

    google.maps.event.trigger(markers[index], 'click');
      });
  });

  const schools = document.querySelectorAll('.list-group-item');
  schools.forEach((school, index) => {
    school.addEventListener('click', (event) => {
      console.log(school);
      const marker = event.currentTarget.dataset.marker;
      console.log(marker);
      //google.maps.Animation(marker, 'BOUNCE');
      google.maps.event.trigger(marker, 'click');
    });
  });

}


      // let shownMarkers = map.markers;
      // if (isInclude(shownMarkers, markers)) {
      //   console.log('DELETE')

      //   const newShownMarkers = shownMarkers.flatMap((marker) => {

      //   let bool = false;
      //   markers.forEach((mark) => {
      //     if ((marker.position.lat().toFixed(7) == mark.lat && marker.position.lng().toFixed(7) == mark.lng)) {
      //       bool = true;
      //     }
      //   });

      //     if (bool) {
      //       console.log('marker to delete');
      //       return [];
      //     } else {
      //       return [{lat: marker.position.lat().toFixed(7), lng: marker.position.lng().toFixed(7) }];
      //     }
      //   });
      //   console.log(newShownMarkers);
      //   map.addMarkers(newShownMarkers);

      // } else {
      //   console.log('ADD')
      //   map.addMarkers(markers);

      // };


// function isInclude(shownMarkers, markers) {
//   if (shownMarkers.length !== 0) {
//     let bool = false;
//     shownMarkers.forEach((marker) => {
//       console.log('MARKER => ' + (marker.position.lat().toFixed(7) == markers[0].lat && marker.position.lng().toFixed(7) == markers[0].lng));

//       if ((marker.position.lat().toFixed(7) == markers[0].lat && marker.position.lng().toFixed(7) == markers[0].lng)) {
//         bool = true;
//       }
//     });

//     return bool;
//   }
// }
