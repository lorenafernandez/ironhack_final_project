function geoLocate() {
  if (window.navigator && window.navigator.geolocation) {
    window.navigator.geolocation.getCurrentPosition(function(position){
      getAddress(position.coords);
    });
  }
}

function getAddress(coords) {
  var geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(coords.latitude, coords.longitude);
  geocoder.geocode({ 'latLng': latlng }, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      var location;
      var types = ['street_address','locality', 'administrative_area_level_3', 'administrative_area_level_2', 'administrative_area_level_1'];


      types.some(function (type) {
        location = results.filter(function(address) { return address.types[0] === type; })[0];
        if (typeof location !== 'undefined') {
          return true;
        }
      });
      if (typeof location === 'undefined' ) {
        location = results[0];
      }
      if (typeof location !== 'undefined' ) {
        $('#city').val(location.formatted_address);
        $('#map').html('<img src="//maps.googleapis.com/maps/api/staticmap?center=' + coords.latitude + ',' + coords.longitude + '&zoom=13&size=360x200&markers=color:red%7Clabel:S%7C'+coords.latitude + ',' + coords.longitude + '&maptype=roadmap&sensor=false%22">');
      }
    }
  });  
}
