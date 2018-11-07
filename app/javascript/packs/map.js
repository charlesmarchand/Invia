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
      const mapMarkers = [];

        if (markers.length === 0) {
          map.setZoom(3);
        } else if (markers.length === 1) {
          map.setCenter(markers[0].lat, markers[0].lng);
          map.setZoom(10);
        } else {
          map.fitLatLngBounds(markers);
        }

        document.querySelectorAll('.formation').forEach((card) => {
          if (card === event.currentTarget.closest(".formation")) {
            event.currentTarget.closest(".formation").classList.toggle('open');
              if (Array.from(event.currentTarget.closest(".formation").classList).includes('open')) {
                markers.forEach((marker) => {
                    const mapMarker = map.createMarker(marker);
                    mapMarkers.push(mapMarker);
                    map.addMarker(mapMarker);
                  });
                map.addMarkers(markers);

  const schools = document.querySelectorAll('.list-group-item');
  schools.forEach((school, index) => {
    school.addEventListener('click', (event) => {
      console.log(school);
      const marker = JSON.parse(event.currentTarget.dataset.marker);
      console.log(marker);
      google.maps.event.trigger(mapMarkers[index], 'click');
    });
  });
              };
    const schools = document.querySelectorAll('.list-group-item');
    schools.forEach((school, index) => {
      school.addEventListener('click', (event) => {
        const marker = JSON.parse(event.currentTarget.dataset.marker);
        google.maps.event.trigger(mapMarkers[index], 'click');
        });
      });
          } else {
            card.classList.remove('open');
          }
        });

    //school.addEventListener('mouseover', (event) => {
      //const marker = JSON.parse(event.currentTarget.dataset.marker);
    //marker.setAnimation(google.maps.Animation.BOUNCE);
  //});


    });
  });
}



const maps = document.querySelectorAll(".map");
console.log(maps);
maps.forEach((uneMap) => {
  console.log(uneMap);
  const uneMapId = uneMap.attributes.id.value;
  console.log(uneMapId);

  if (uneMap) { // don't try to build a map if there's no div#map to inject in
    const newMap = new GMaps({ el: `#${uneMapId}`, lat: 46.227638, lng: 2.213749 });
    newMap.setZoom(5);


    const markers2 = JSON.parse(uneMap.dataset.markers);
    console.log(markers2);

   /* const map2Markers = [];
    markers2.forEach((marker) => {
      const mapMarker = newMap.createMarker(marker);
      map2Markers.push(map2Marker);
      newMap.addMarker(map2Marker);
    });*/
  };

});




