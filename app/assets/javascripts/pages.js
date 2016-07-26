function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie, {maximumAge: 60000});
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}
