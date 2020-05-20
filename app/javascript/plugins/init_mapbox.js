import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { 
    navigator.geolocation.getCurrentPosition((data) => {
      mapboxgl.accessToken = 'pk.eyJ1IjoibG91aXNtYXUiLCJhIjoiY2s5bzMzMGxhMDd3aTNubzh6amNqd3lsbCJ9.xuiUg1SNmZwvfFy-WRnYNQ';
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        // center: [data.coords.latitude, data.coords.longitude],
       // zoom: 12
      });
      // map.setCenter([data.coords.latitude, data.coords.longitude])
      const markers = JSON.parse(mapElement.dataset.markers);
      fitMapToMarkers(map, markers);
      addMarkersToMap(map, markers);
    });
  }
};

export { initMapbox };
