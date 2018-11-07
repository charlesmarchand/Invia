import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 46.227638, lng: 2.213749 });
  map.setZoom(5);


//JE METS UN LISTENER SUR MES BOUTONS
  const buttons = document.querySelectorAll('.show_schools');
  buttons.forEach((button, index) => {
    button.addEventListener('click', (event) => {

      map.removeMarkers();

//JE SELECTIONNES LES MARQUEURS DE MON BOUTON

      const markers = JSON.parse(event.currentTarget.dataset.markers);
      const mapMarkers = [];


    // JE SELECTIONNE TOUTES MES CARDS, POUR CHACUNE DENTRE ELLES
        document.querySelectorAll('.formation').forEach((card) => {
      // je check si elle CORRESPOND AU BOUTON SUR LEQUEL  JAI CLIQUE
          if (card === event.currentTarget.closest(".formation")) {
     // SI oui, je change l'état de open
            event.currentTarget.closest(".formation").classList.toggle('open');
         // POur le cas où j'ai ouvert ma carte (et que je ne l'ai pas fermée parce qu'elle était ouverte)
              if (Array.from(event.currentTarget.closest(".formation").classList).includes('open')) {
          // Pour chacun de mes markers, je génère un marker, je l'ajoute dans l'[] mapMarkersn puis sur la carte
                markers.forEach((marker) => {
                    const mapMarker = map.createMarker(marker);
                    mapMarkers.push(mapMarker);
                    map.addMarker(mapMarker);
                  });
                };
          // Sinon, je referme ma carte
              } else {
            card.classList.remove('open');
              }
          });

       //Je chope les schools de ma liste, leur ajoute un listeneur, et trigger le marqueur correspondant au clic
          const schools = document.querySelectorAll('.open .list-group-item');
          schools.forEach((school, index) => {
            school.addEventListener('mouseover', () => {
              //mapMarkers[index].setAnimation(google.maps.Animation.BOUNCE);
              google.maps.event.trigger(mapMarkers[index], 'click');
            });
          });

        if (markers.length === 0) {
          map.setZoom(3);
        } else if (markers.length === 1) {
          map.setCenter(markers[0].lat, markers[0].lng);
          map.setZoom(10);
        } else {
          map.fitLatLngBounds(markers);
        }
    });
  });


//JE GERE LES ZOOMS -------------------------------------
//----------------------------------------------------------


    //school.addEventListener('mouseover', (event) => {
      //const marker = JSON.parse(event.currentTarget.dataset.marker);
    //marker.setAnimation(google.maps.Animation.BOUNCE);
  //});



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

