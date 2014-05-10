// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require leaflet
//= require_tree .


// Leaflet map
var tiles = [
	'http://a.tiles.mapbox.com/v3/fernando.ho5761ak/{z}/{x}/{y}.png',
	'http://a.tiles.mapbox.com/v3/fernando.ho504jfb/{z}/{x}/{y}.png',
	'http://a.tiles.mapbox.com/v3/fernando.i0b5no8h/{z}/{x}/{y}.png'
	];
/*
var map = L.map('map', {
    scrollWheelZoom: false
}).setView([-34.57158, -58.43926], 15);
L.tileLayer('http://a.tiles.mapbox.com/v3/fernando.h0p1dck9/{z}/{x}/{y}.png', {
    maxZoom: 18
}).addTo(map);
var circle = L.circle([-34.57158, -58.43926], 200, {
    color: '#ED1C24',
    fillOpacity: 0.2
}).addTo(map);
*/

var artmap = L.map('artmap', {
    scrollWheelZoom: false
}).setView([-34.57158, -58.43926], 17);
L.tileLayer(tiles[Math.floor(Math.random() * tiles.length)], {
    maxZoom: 18
}).addTo(artmap);
