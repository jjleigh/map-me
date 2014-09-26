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

$(document).ready(function() {

var map;
function initialize() {
  var mapOptions = {
    zoom: 3,
    // center: new google.maps.LatLng(43.642, -79.387),
    center: new google.maps.LatLng(43.642, -79.387),
    panControl: false,
    zoomControl: false,
    scaleControl: true
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

    // never mix ruby with javascript unless it is in the views folder...use data attributes instead and get data from DOM
    // the marker method in the follower model does way too much - it should only return data
    // var locations = <%= raw @markers %>;
    var followers = $('.follower');
    var markers = [];

    for (var i = 0; i < followers.length; i++) {
      markers.push ({
        'infowindow' : "<span class='friend-info'><strong>@" + followers[i].getAttribute("data-user-name") + "</strong><br>" + followers[i].getAttribute("data-name") + "<br>" + followers[i].getAttribute("data-location") + "<span>",
        'lat': followers[i].getAttribute("data-latitude"),
        'lng': followers[i].getAttribute("data-longitude"),
        'pic': {
          'url': followers[i].getAttribute("data-avatar"),
          'width': 36,
          'height': 36
        }
      });
    }

    handler = Gmaps.build('Google');
    handler.buildMap({internal: {id: 'map'}, provider: {styles: mapStyle}}, function(){
      followerMarkers = handler.addMarkers(markers);
      handler.bounds.extendWith(friendMarkers);
      handler.fitMaptoBounds();
    })

  google.maps.event.addDomListener(window, 'load', initialize);




})

