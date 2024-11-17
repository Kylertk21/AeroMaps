document.addEventListener("DOMContentLoaded", function () {
    const options = {
        key: 'k5CpqfKMSA1o6b3s18cmzWin6KDFX69G',
        lat: 50.4,
        lon: 14.3, 
        zoom: 5,
    };

    windyInit(options, windyAPI => {
        const { map } = windyAPI;
    });
});