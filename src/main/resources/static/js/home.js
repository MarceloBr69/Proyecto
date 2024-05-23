function iniciarMapa(){
	var coord = {lat: -36.791978 ,lng: -73.0992137};
    var map = new google.maps.Map(document.getElementById('map'),{
      zoom: 10,
      center: coord
    });
    var marker = new google.maps.Marker({
      position: coord,
      map: map
    });
}

document.getElementById("nameLogo").addEventListener("click", function() {
  window.location.href = "/home";
});