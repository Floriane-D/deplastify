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
  storeElement.style.backgroundImage = `url('https://img.icons8.com/dusk/100/000000/marker.png')`;
  storeElement.style.backgroundSize = 'contain';
  storeElement.style.width = '35px';
  storeElement.style.height = '35px';

  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  new mapboxgl.Marker(storeElement)
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('https://img.icons8.com/dusk/100/000000/turtle.png')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '35px';
  element.style.height = '35px';

  const userMarker = new mapboxgl.Marker(element)
    .setLngLat(coords)
    .addTo(map);
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      const coords = [data.coords.longitude, data.coords.latitude];
      const map = buildMap(coords);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers, coords);
      fitMapToMarkers(map, markers);
    });
  }
};

export { initMapbox };
