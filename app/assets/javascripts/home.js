$('document').ready(function() {
  // $("#datepicker").datepicker();
  $('.top-of-site li ul').hide().removeClass('fallback');
  $('.top-of-site li').hover(
    function () {
      $('ul', this).stop().slideDown(100);
    },
    function () {
      $('ul', this).stop().slideUp(100);
    }
  );
});
function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(21.030686,105.852403),
    zoom: 15
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(21.030686,105.852403)
  });
  infowindow = new google.maps.InfoWindow({content:"<b>Hồ Gươm</b><br/>Hồ Con Rùa<br/> Hà Nội" });
  google.maps.event.addListener(marker, "click", function(){
    infowindow.open(map,marker);
  });
  infowindow.open(map,marker);
}

var initAdthis;
initAdthis = function(){
    // Remove all global properties set by addthis, otherwise it won't reinitialize
    for (var i in window) {
        if (/^addthis/.test(i) || /^_at/.test(i)) {
            delete window[i];
        }
    }
    window.addthis_share = null;
 
    // Finally, load addthis
    // $.getScript("s7.addthis.com/js/300/addthis_widget.js#pubid=ra-553614e2730d2725");
}
 
// Trigger the function on both jquery's ready event and turbolinks page:change event
$(document).on('page:change', function(){
	initialize();
  initAdthis();
})


