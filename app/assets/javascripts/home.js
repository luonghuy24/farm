$('document').ready(function() {
  $("#datepicker").datepicker();
});
function initialize() {
  var mapCanvas = document.getElementById('map-canvas');
  var mapOptions = {
    center: new google.maps.LatLng(40.861396, -73.765823),
    zoom: 11,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(mapCanvas, mapOptions)
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
    $.getScript("s7.addthis.com/js/300/addthis_widget.js#pubid=ra-553614e2730d2725");
}
 
// Trigger the function on both jquery's ready event and turbolinks page:change event
$(document).on('page:change', function(){
	initialize();
  initAdthis();
})
