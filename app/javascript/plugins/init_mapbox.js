import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = (coords) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: coords,
    zoom: 13 // starting zoom
  });
};

const addMarkersToMap = (map, markers, coords) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });

  const userMarker = new mapboxgl.Marker()
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
