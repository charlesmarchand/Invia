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

        if (markers.length === 0) {
          map.setZoom(2);
        } else if (markers.length === 1) {
          map.setCenter(markers[0].lat, markers[0].lng);
          map.setZoom(13);
        } else {
          map.fitLatLngBounds(markers);
        }
        console.dir(event.currentTarget.closest(".formation").classList)
        document.querySelectorAll('.formation').forEach((card) => {
          if (card === event.currentTarget.closest(".formation")) {
            event.currentTarget.closest(".formation").classList.toggle('open');
              if (Array.from(event.currentTarget.closest(".formation").classList).includes('open')) {
                  map.addMarkers(markers);
              };
          } else {
            card.classList.remove('open');
          }
        });


    google.maps.event.trigger(markers[index], 'click');

    });
  });



  const schools = document.querySelectorAll('.list-group-item');
  schools.forEach((school, index) => {
    school.addEventListener('click', (event) => {
      console.log(school);
      const marker = JSON.parse(event.currentTarget.dataset.marker);
      console.log(marker);
    });
  });

}


// map dashboard
const mapElement2 = document.getElementById('map2');
if (mapElement2) { // don't try to build a map if there's no div#map to inject in
  const map2 = new GMaps({ el: '#map2', lat: 46.227638, lng: 2.213749 });
  map2.setZoom(5);


const markers2 = JSON.parse(mapElement2.dataset.markers);

const map2Markers = [];
  markers2.forEach((marker) => {
    const mapMarker = map2.createMarker(marker);
    map2Markers.push(map2Marker);
    map2.addMarker(map2Marker);
  });
};
