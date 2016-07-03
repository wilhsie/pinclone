function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie, errorGeoCookie, {maximumAge: 60000});
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}

function errorGeoCookie(err){
  if(err.code == 1){
    // user said no
    alert("We can't show you cool stuff if location services is off :[");
  }
} 
