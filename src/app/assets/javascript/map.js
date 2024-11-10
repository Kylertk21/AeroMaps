document.addEventListener("DOMContentLoaded", function() {
    
    // Retrieve METAR data from show.html
    var mapContainer = document.getElementById("map");
    if (!mapContainer) {
        console.error("Map container not found");
        return;
    }

    var metarDataElement = document.getElementById("metar");
    if (!metarDataElement){
        console.error("METAR data element not found");
        return;
    }

    var metarData;

    try {
        metarData = JSON.parse(metarDataElement.getAttribute("metar-data"));
        console.log("METAR data:", metarData);
    } catch (e) {
        console.error("Failed to parse METAR data:", e);
        metarData = "No data available";
    }

    var lat = 38.8017 
    var lng = -104.7026
    console.log("Coordinates:", lat, lng)

    // map initialization
    var map = L.map('map').setView([lat, lng], 13); // Initial coordinates

    // Set up OpenStreetMap
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    // Add maker with METAR data
    var marker = L.marker([lat, lng]).addTo(map);
    var popupContent = `<b>Colorado Springs Airport 
                        (KCOS)</b><br>METAR: 
                        ${metarData ? JSON.stringify(metarData, null, 2) 
                            : 'No data available' } `;
    
    marker.bindPopup(popupContent).openPopup();

    setTimeout(function() {
        map.invalidateSize();
    }, 100);
});