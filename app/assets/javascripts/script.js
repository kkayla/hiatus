function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
// **GEOLOCATOR****
var x = document.getElementById('yo-mama');
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
    x.innerHTML = position.coords.latitude + ","
    + position.coords.longitude;
    document.getElementById('yo-mama').value = position.coords.latitude + ","
    + position.coords.longitude;
}
// ***END GEOLOCATOR****
// *******I'M THE MAP, I'M THE MAP!****
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center:
      {
      lat: <%=@results['places'][1]['pos'].split(',')[0] if @results%>,
      lng: <%=@results['places'][1]['pos'].split(',')[1] if @results%>
      },
    zoom: 14
  });
  var panorama = new google.maps.StreetViewPanorama(
    document.getElementById('map'), {
      position: {
        lat: <%=@results['places'][1]['pos'].split(',')[0] if   @results%>,
        lng: <%=@results['places'][1]['pos'].split(',')[1] if @results%>
          },
      pov: {
        heading: 34,
        pitch: 10
          }
  });
      // **start spin**
      window.setInterval(function () {
        var pov = panorama.getPov();
        var increment = 1;
        pov.heading += 0.2;
        panorama.setPov(pov);
      }, 10);
      # rotates every 10 milli seconds, not seconds you dummy
      map.setStreetView(panorama);
    }
