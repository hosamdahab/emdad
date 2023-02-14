<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>اضافة موقع جديد</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<!-- Search input -->
<input id="searchInput" class="form-control" type="text" placeholder="ابحث عن المكان" style="width:80%;margin:20px auto 0 auto;direction:rtl">

<!-- Google map -->
<div id="map" style="width:100%;height:100vh"></div>

<!-- Display geolocation data -->
<form action="{{route('customer.location.details.store')}}" method="POST" id="customer_loaction_details">
    @csrf
    <input type="hidden" name="address_details" id="location">
    <input type="hidden" name="country" id="country">
    <input type="hidden" name="city" id="city">
    <input type="hidden" name="address_latitude" id="lat">
    <input type="hidden" name="address_longitude" id="lon">
    <label for="" id="get_location" style="position:absolute;bottom:8rem;left:43.5%;background-color:#3fd8a3;padding:10px 15px;color:#fff;font-weight:600;border-radius:15px;visibility: hidden"></label>
    <button type="submit" class="btn btn-primary" style="position:absolute;bottom:3rem;width:50%;left:26rem;padding:10px 0">التالي</button>
    <button type="submit" class="btn btn-primary" style="display:none">حفظ التعديلات</button>
</form>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=Your_API_Key"></script> -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyD_5kBg8jyP93u8GfmauM7yrVSKaZ_jEUM&callback=initMap" async defer></script> -->
<script async
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZ1iVO7trjsVRjoKvEFQNHvuEsyDxlYlA&libraries=places&callback=initMap">
</script>

<script>
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 15.369445, lng: 44.191006},
      zoom: 13
    });
    var input = document.getElementById('searchInput');
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);

    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });



    autocomplete.addListener('place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            window.alert("Autocomplete's returned place contains no geometry");
            return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
        }
        marker.setIcon(({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
        }));
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);

        // Location details
        for (var i = 0; i < place.address_components.length; i++) {
            if(place.address_components[i].types[0] == 'postal_code'){
                document.getElementById('postal_code').innerHTML = place.address_components[i].long_name;
            }
            if(place.address_components[i].types[0] == 'country'){
                document.getElementById('country').value = place.address_components[i].long_name;
            }
        }
        document.getElementById('location').value = place.formatted_address;
        document.getElementById('city').value = place.address_components[0].long_name;
        document.getElementById('lat').value = place.geometry.location.lat();
        document.getElementById('lon').value = place.geometry.location.lng();

        // console.log(place.address_components[0].long_name + ' , ' + place.address_components[3].long_name);

        var paragraph = document.getElementById("get_location");
        paragraph.style.visibility = 'visible';
        var text = document.createTextNode(place.address_components[0].long_name + ' , ' + place.address_components[3].long_name);
        paragraph.appendChild(text);




    });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infoWindow.setContent(infoWindowContent[i][0]);
                    infoWindow.open(map, marker);
                    latit = marker.getPosition().lat();
                    longit = marker.getPosition().lng();
                    // console.log("lat: " + latit);
                    // console.log("lng: " + longit);
                }
            })(marker, i));

        navigator.geolocation.getCurrentPosition(function(position) {
    // Center on user's current location if geolocation prompt allowed
    var initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    gMap.setCenter(initialLocation);
    gMap.setZoom(13);
  }, function(positionError) {
    // User denied geolocation prompt - default to Chicago
    gMap.setCenter(new google.maps.LatLng(15.369445, 44.191006));
    gMap.setZoom(5);
  });
}



    $(document).ready(function(){

        $('#customer_loaction_details').submit(function(e){

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            e.preventDefault();
            let formData = new FormData(this);

                $.ajax({
                        type:'POST',
                        url: "{{ route('customer.location.details.store') }}",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: (response) => {
                            if (response) {
                                this.reset();
                                Swal.fire(
                                'تم اضافة الموقع بنجاح',
                                );

                                window.location.href = "{{route('customer.location.details')}}"
                            }
                        },

                });
            console.log('good');
        });


    });
</script>
</body>
</html>
