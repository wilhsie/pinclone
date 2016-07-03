function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie, errorGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}

function errorGeoCookie(){
  navigator.geolocation.getCurrentPosition(setGeoCookie, secondError);
}

function secondError(){
  alert("Please allow location services to view this site's content");
}
