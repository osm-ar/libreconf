# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

tiles = [
	'http://a.tiles.mapbox.com/v3/fernando.ho5761ak/{z}/{x}/{y}.png',
	'http://a.tiles.mapbox.com/v3/fernando.ho504jfb/{z}/{x}/{y}.png',
	'http://a.tiles.mapbox.com/v3/fernando.i0b5no8h/{z}/{x}/{y}.png'
	];

map = L.map('map', {
    scrollWheelZoom: false
}).setView([-34.59359, -58.38327], 15);
L.tileLayer('http://a.tiles.mapbox.com/v3/fernando.h0p1dck9/{z}/{x}/{y}.png', {
    maxZoom: 18
}).addTo(map);
marker = L.marker([-34.59359, -58.38327]).addTo(map);

artmap = L.map('artmap', {
    scrollWheelZoom: false
}).setView([-34.57158, -58.43926], 17);
L.tileLayer(tiles[Math.floor(Math.random() * tiles.length)], {
    maxZoom: 18
}).addTo(artmap);
