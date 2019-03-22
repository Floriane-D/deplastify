import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = (coords) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: coords,
    zoom: 13
  });
};

const addMarkersToMap = (map, markers, coords) => {
  markers.forEach((marker) => {
  const storeElement = document.createElement('div');
  storeElement.className = 'marker';
  storeElement.style.backgroundImage = `url('https://img.icons8.com/ultraviolet/100/000000/marker.png')`;
  storeElement.style.backgroundSize = 'contain';
  storeElement.style.width = '42px';
  storeElement.style.height = '42px';

  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

  new mapboxgl.Marker(storeElement)
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup)
    .addTo(map);
  });

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('https://img.icons8.com/office/100/000000/marker.png')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '42px';
  element.style.height = '42px';

  const userMarker = new mapboxgl.Marker(element)
    .setLngLat(coords)
    .addTo(map);
};


const initMapbox = () => {
  if (mapElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      const coords = [data.coords.longitude, data.coords.latitude];
      const map = buildMap(coords);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers, coords);
    });
  }
};

export { initMapbox };
