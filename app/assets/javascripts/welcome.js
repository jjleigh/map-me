// var Map = {};
// Map.nearby_marker_img = 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png'

// Map.latitude = 43.6425662;
// Map.longitude = -79.3870568;
// function intializeMap() {
// 	Map.options = {
// 		zoom: 14,
// 		center: new google.maps.LatLng(Map.longitude, Map.latitude),
// 		mapTypeId: google.maps.MapTypeId.ROADMAP
// 	};

// 	Map.canvas = new google.maps.Map($('#map-canvas')[0], Map.options);
// 	if (Map.showMarkers) {
// 		var myMarker = new google.maps.Marker ({
// 			position: new google.maps.LatLng(Map.longitude, Map.latitude),
// 			map: Map.canvas
// 		});
// 	}
// }

// function addMarkers(coords) {
// 	coords.forEach(function (coord) {
// 		var myMarker = new google.maps.Marker ({
// 			position: new google.maps.LatLng(coord.longitude, coord.latitude),
// 			map: Map.canvas,
// 			icon: Map.nearby_marker_img
// 		});
// 	});

// }

// $(document).on('ready page:load', function() {

// 	if ($("#map-canvas").length) {
// 		intializeMap();
// 		if (Map.coords.length > 0) addMarkers(Map.coords);
// 	}

// });

// // function geolocationSuccess(position){
// // 	var latitude = position.coords.latitude;
// // 	var longitude = position.coords.longitude;
// // }
// // function geolocationError(){
// // 	console.log("there was an error");
// // }

function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
      'callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;

