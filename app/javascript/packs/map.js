import GMaps from 'gmaps/gmaps.js';



const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 46.227638, lng: 2.213749, disableDefaultUI: true });
  map.setZoom(5);

const styles = [
    {
        "featureType": "landscape",
        "stylers": [
            {
                "hue": "#FFBB00"
            },
            {
                "saturation": 43.400000000000006
            },
            {
                "lightness": 37.599999999999994
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.highway",
        "stylers": [
            {
                "hue": "#FFC200"
            },
            {
                "saturation": -61.8
            },
            {
                "lightness": 45.599999999999994
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "stylers": [
            {
                "hue": "#FF0300"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 51.19999999999999
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.local",
        "stylers": [
            {
                "hue": "#FF0300"
            },
            {
                "saturation": -100
            },
            {
                "lightness": 52
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "hue": "#0078FF"
            },
            {
                "saturation": -13.200000000000003
            },
            {
                "lightness": 2.4000000000000057
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "poi",
        "stylers": [
            {
                "hue": "#00FF6A"
            },
            {
                "saturation": -1.0989010989011234
            },
            {
                "lightness": 11.200000000000017
            },
            {
                "gamma": 1
            }
        ]
    }
 ];

map.addStyle({
  styles: styles,
  mapTypeId: 'map_style'
});
map.setStyle('map_style');


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
                // if (mapMarkers[index].getAnimation() !== null) {
                //   mapMarkers[index].setAnimation(null);
                // } else {
                  mapMarkers[index].setAnimation(google.maps.Animation.BOUNCE, );
                  setTimeout(function(){ mapMarkers[index].setAnimation(null); }, 1500);
                // }
            school.addEventListener('click', () => {
              google.maps.event.trigger(mapMarkers[index], 'click');
            });
            });
          });

          if (markers.length === 0) {
            map.setZoom(2);
          } else if (markers.length === 1) {
            map.setCenter(markers[0].lat, markers[0].lng);
            map.setZoom(10);
          } else {
            map.fitLatLngBounds(markers);
          }



    });
  });

}

const maps = document.querySelectorAll(".map-dashboard");
maps.forEach((uneMap) => {
  const uneMapId = uneMap.attributes.id.value;

  if (uneMap) { // don't try to build a map if there's no div#map to inject in
    const newMap = new GMaps({ el: `#${uneMapId}`, lat: 46.227638, lng: 2.213749, disableDefaultUI: true });
    newMap.setZoom(5);



    const markers2 = JSON.parse(uneMap.dataset.markers);

    const mapMarkers = [];
    markers2.forEach((marker) => {
      const mapMarker = newMap.createMarker(marker);
      mapMarkers.push(mapMarker);
      newMap.addMarker(mapMarker);
    });
  };

});
