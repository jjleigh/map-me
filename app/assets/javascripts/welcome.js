$(document).ready(function() {
  var map;
  var followers = gon.followers
  var minZoomLevel = 2;

  function initialize() {
    var mapOptions = {
      zoom: minZoomLevel,
      center: new google.maps.LatLng(35.642, -3.387),
      panControl: false,
      zoomControl: false,
      scaleControl: false,
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    google.maps.event.addListener(map, "zoom_changed", function(){
      if (map.getZoom() < minZoomLevel){
        map.setZoom(minZoomLevel);
      }
    });

    addMarkers();
  }
  function addMarkers() {
    for (var i = 0; i <= followers.length; i++) {
      marker = new google.maps.Marker ({
        position: new google.maps.LatLng(followers[i]['latitude'], followers[i]['longitude']),
        map: map,
        icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
      });
    }
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});