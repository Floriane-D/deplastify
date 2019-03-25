import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = (coords) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
  });
};

const addMarkersToMap = (map, markers, coords) => {
  markers.forEach((marker) => {
  const storeElement = document.createElement('div');
  storeElement.className = 'marker';
  storeElement.style.backgroundImage = `url('https://img.icons8.com/dusk/100/000000/turtle.png')`;
  storeElement.style.backgroundSize = 'contain';
  storeElement.style.width = '35px';
  storeElement.style.height = '35px';

  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  new mapboxgl.Marker(storeElement)
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });
};

const addGeolocationControl = (map, markers) => {
  const geoControl = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true
    },
      trackUserLocation: true,
      fitBoundsOptions: { zoom: 14, duration: 2000 }
    }
  );
  map.addControl(geoControl)
  setTimeout(function() {
    $(".mapboxgl-ctrl-geolocate").click();
  },100);
}


const initMapbox = () => {
  if (mapElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      const coords = [data.coords.longitude, data.coords.latitude];
      const map = buildMap(coords);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers, coords);
      addGeolocationControl(map, markers);
    });
  }
};

export { initMapbox };
