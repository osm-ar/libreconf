# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

tiles = [
    'http://a.tiles.mapbox.com/v3/fernando.ikdi0ih7/{z}/{x}/{y}.png'
    ];

latlng = [-34.59359, -58.38327];
map = L.map('map', {
    scrollWheelZoom: false
}).setView(latlng, 15);

mapxs = L.map('map-xs', {
    scrollWheelZoom: false
}).setView(latlng, 15);

L.tileLayer('http://{s}.tiles.mapbox.com/v3/fernando.h0p1dck9/{z}/{x}/{y}.png', {
    maxZoom: 18
}).addTo(map);
L.tileLayer('http://{s}.tiles.mapbox.com/v3/fernando.h0p1dck9/{z}/{x}/{y}.png', {
    maxZoom: 18
}).addTo(mapxs);
marker = L.marker(latlng).addTo(map);
marker.bindPopup(venueAddress).openPopup();

marker = L.marker(latlng).addTo(mapxs);
marker.bindPopup(venueAddress).openPopup();

artmap = L.map('artmap', {
    scrollWheelZoom: false
}).setView([-34.57158, -58.43926], 12);
L.tileLayer(tiles[Math.floor(Math.random() * tiles.length)], {
    maxZoom: 12
}).addTo(artmap);
