@extends('layouts.back-end.app-seller')

@section('title', 'اعدادات المواقع')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
@endpush

@section('content')
    <!-- Content -->
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-end">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{__('messages.location_details')}}</h1>
                </div>

                <div class="col-sm-auto">
                    <a class="btn btn-primary" href="{{ route('seller.dashboard.index') }}">
                        <i class="tio-home mr-1"></i> {{ \App\CPU\translate('Dashboard') }}
                    </a>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->

        <div class="row">
            <div class="col-lg-3">
                <!-- Navbar -->
                <div class="navbar-vertical navbar-expand-lg mb-3 mb-lg-5">
                    <!-- Navbar Toggle -->
                    <button type="button" class="navbar-toggler btn btn-block btn-white mb-3"
                        aria-label="Toggle navigation" aria-expanded="false" aria-controls="navbarVerticalNavMenu"
                        data-toggle="collapse" data-target="#navbarVerticalNavMenu">
                        <span class="d-flex justify-content-between align-items-center">
                            <span class="h5 mb-0">{{ \App\CPU\translate('Nav menu') }}</span>

                            <span class="navbar-toggle-default">
                                <i class="tio-menu-hamburger"></i>
                            </span>

                            <span class="navbar-toggle-toggled">
                                <i class="tio-clear"></i>
                            </span>
                        </span>
                    </button>
                    <!-- End Navbar Toggle -->
                </div>
                <!-- End Navbar -->
            </div>

            <div class="col-12">

                
                <div class="row">

                    <div class="col-md-10 col-md m-auto col-12">
                        <form action="{{ route('seller.branche.location.updated') }}" method="post"
                            enctype="multipart/form-data" id="seller-location-updated">
                            @csrf

                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <div class="card-header">
                                    <h2 class="card-title h4">{{__('messages.location_details')}}</h2>
                                </div>

                                
                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form -->
                                    <!-- Form Group -->
                                    <div class="row form-group">
                                    
                                
                                        <label for="address_address">{{__('messages.location_details')}}</label>
                                        <input type="text" id="address-input" placeholder="{{__('messages.enter_location')}}" name="address_address" class="form-control map-input">
                                        <input type="hidden" name="address_latitude" id="address-latitude" value="0" />
                                        <input type="hidden" name="address_longitude" id="address-longitude" value="0" />
                                    </div>

                                    <div class="row form-group">
                                       

                                    <div id="address-map-container" style="width:100%;height:400px; ">
                                        <label for="">{{__('messages.location_details')}}</label>
                                        <div style="width: 100%; height: 100%" id="address-map"></div>

                                    </div>
                                   
                                   </div>
                                   <!-- End Form Group -->

                                    <br><br>

                                    <div class="row form-group">

                                            <div class="col-sm-6">
                                                    <label for="name">
                                                    {{ __('messages.business_type') }}</label>
                                                    <select name="business_type" id="" class="form-control">
                                                    <option value="البقالات">{{__('messages.markets')}}</option>
                                                    <option value="المطاعم">{{__('messages.resutrans')}}</option>
                                                    <option value="المقاهي">{{__('messages.coffe')}}</option>
                                                    <option value="الفنادق">{{__('messages.hotels')}}</option>
                                                    <option value="القاعات">{{__('messages.halls')}}</option>
                                                    <option value="الكفتيريا">{{__('messages.sub_coffe')}}</option>
                                                    <option value="المدارس">{{__('messages.schools')}}</option>
                                                    <option value="المكاتب">{{__('messages.libary')}}</option>
                                                </select>
                                            </div>


                                            <section class="col-6">
                                        <label for="newEmailLabel"
                                            class="col-sm-3 col-form-label input-label">{{__('messages.building_no')}}</label>

                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name="building_no" id="newEmailLabel"
                                                
                                                placeholder="{{__('messages.building_no')}}"
                                                aria-label="Enter new email address">
                                        </div>

                                    </section>

                                        </div>
                                    
                                    <div class="row form-group">

                                    <section class="col-6">
                                        <label for="newEmailLabel"
                                            class="col-sm-3 col-form-label input-label">{{__('messages.floor')}}</label>

                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name="floor_no" id="newEmailLabel"
                                                
                                                placeholder="{{__('messages.floor')}}"
                                                aria-label="Enter new email address">
                                        </div>

                                    </section>
                                        
                                      
                                        <section class="col-6">
                                        <label for="newEmailLabel"
                                            class="col-sm-3 col-form-label input-label">{{__('messages.address_details')}}</label>

                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name="address_details" id="newEmailLabel"
                                                
                                                placeholder="{{__('messages.address_details')}}"
                                                aria-label="Enter new email address">
                                        </div>
                                    </section>

                                    </div>


                                
                                    <h5>{{__('messages.work_time')}}</h5>
                                    
                                    <div class="row form-group">

                                   

                                            <div class="col-sm-6">
                                                    <label for="name">
                                                    {{ __('messages.start_time') }}</label>
                                                    <select name="start_time" id="" class="form-control">
                                                   
                                                    <option value="1">1 {{__('messages.morning')}}</option>
                                                    <option value="2">2 {{__('messages.morning')}}</option>
                                                    <option value="3">3 {{__('messages.morning')}}</option>
                                                    <option value="4">4 {{__('messages.morning')}}</option>
                                                    <option value="5">5 {{__('messages.morning')}}</option>
                                                    <option value="6">6 {{__('messages.morning')}}</option>
                                                    <option value="7">7 {{__('messages.morning')}}</option>
                                                    <option value="8">8 {{__('messages.morning')}}</option>
                                                    <option value="9">9 {{__('messages.morning')}}</option>
                                                    <option value="10">10 {{__('messages.morning')}}</option>
                                                    <option value="11">11 {{__('messages.morning')}}</option>
                                                    <option value="12">12 {{__('messages.morning')}}</option>
                                                </select>
                                            </div>


                                            <div class="col-sm-6">
                                                    <label for="name">
                                                    {{ __('messages.end_time') }}</label>
                                                    <select name="end_time" id="" class="form-control">
                                                    <option value="1">1 {{__('messages.evening')}}</option>
                                                    <option value="2">2 {{__('messages.evening')}}</option>
                                                    <option value="3">3 {{__('messages.evening')}}</option>
                                                    <option value="4">4 {{__('messages.evening')}}</option>
                                                    <option value="5">5 {{__('messages.evening')}}</option>
                                                    <option value="6">6 {{__('messages.evening')}}</option>
                                                    <option value="7">7 {{__('messages.evening')}}</option>
                                                    <option value="8">8 {{__('messages.evening')}}</option>
                                                    <option value="9">9 {{__('messages.evening')}}</option>
                                                    <option value="10">10 {{__('messages.evening')}}</option>
                                                    <option value="11">11 {{__('messages.evening')}}</option>
                                                    <option value="12">12 {{__('messages.evening')}}</option>
                                                </select>
                                            </div>

                                           

                                    </div>

                                    <div class="row form-group second_shift">

                                    </div>

                                    <br><br>

                                    <h5>{{__('messages.delivery_details')}}</h5>
                                    <div class="row form-group">

                                        <div class="col-sm-12">
                                        <label for="newEmailLabel"
                                            class="col-sm-3 col-form-label input-label">{{__('messages.delivery_contact_no')}}</label>
                                            <input type="text" class="form-control" name="phone_mobile" id="newEmailLabel"
                                                
                                                placeholder="{{__('messages.delivery_contact_no')}}"
                                                aria-label="Enter new email address">
                                        </div>



                                    </div>


                                  


                                    <h5>{{__('messages.business_img')}}</h5>
                                    <div class="row form-group">

                
                                            <div class="col-md-12">
                                              
                                                <div class="custom-file" style="text-align: left">
                                                    <input type="file" name="image"
                                                        class="custom-file-input"
                                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*"
                                                        >
                                                    <label class="custom-file-label"
                                                        for="customFileEg1">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                                </div>
                                            </div>



                                    </div>

                                    <div id="image-input-error"></div>
                                    
                                 
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Save changes') }}
                                        </button>
                                    </div>

                                    <!-- End Form -->
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </form>
                    </div>

               
                </div>
               
            </div>
            <!-- Sticky Block End Point -->
            <div id="stickyBlockEndPoint"></div>
        </div>
    </div>
    <!-- End Row -->
    </div>
    <!-- End Content -->
@endsection

@push('script')
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script
        src="{{ asset('public/assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY') }}&libraries=places&callback=initialize" async defer></script>
   
    <script>
        $(document).ready(function(){

            $('#addShift').unbind().click(function(){

        $('.second_shift').one().append('<div class="col-sm-6">\
                <label for="name">\
                {{ __("messages.start_time") }}</label>\
                <select name="start_time[]" id="" class="form-control">\
                    <option value="1">1 {{__("messages.morning")}}</option>\
                    <option value="2">2 {{__("messages.morning")}}</option>\
                    <option value="3">3 {{__("messages.morning")}}</option>\
                    <option value="4">4 {{__("messages.morning")}}</option>\
                    <option value="5">5 {{__("messages.morning")}}</option>\
                    <option value="6">6 {{__("messages.morning")}}</option>\
                    <option value="7">7 {{__("messages.morning")}}</option>\
                    <option value="8">8 {{__("messages.morning")}}</option>\
                    <option value="9">9 {{__("messages.morning")}}</option>\
                    <option value="10">10 {{__("messages.morning")}}</option>\
                    <option value="11">11 {{__("messages.morning")}}</option>\
                    <option value="12">12 {{__("messages.morning")}}</option>\
                </select>\
            </div>\
            <div class="col-sm-6">\
                <label for="name">\
                {{ __("messages.end_time") }}</label>\
                <select name="end_time[]" id="" class="form-control">\
                    <option value="1">1 {{__("messages.evening")}}</option>\
                    <option value="2">2 {{__("messages.evening")}}</option>\
                    <option value="3">3 {{__("messages.evening")}}</option>\
                    <option value="4">4 {{__("messages.evening")}}</option>\
                    <option value="5">5 {{__("messages.evening")}}</option>\
                    <option value="6">6 {{__("messages.evening")}}</option>\
                    <option value="7">7 {{__("messages.evening")}}</option>\
                    <option value="8">8 {{__("messages.evening")}}</option>\
                    <option value="9">9 {{__("messages.evening")}}</option>\
                    <option value="10">10 {{__("messages.evening")}}</option>\
                    <option value="11">11 {{__("messages.evening")}}</option>\
                    <option value="12">12 {{__("messages.evening")}}</option>\
                </select>\
                </div>\
            \
            </div>');


        });

        });
    </script>
<script>
   
   function initialize() {

$('form').on('keyup keypress', function(e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
        e.preventDefault();
        return false;
    }
});
const locationInputs = document.getElementsByClassName("map-input");

const autocompletes = [];
const geocoder = new google.maps.Geocoder;
for (let i = 0; i < locationInputs.length; i++) {

    const input = locationInputs[i];
    const fieldKey = input.id.replace("-input", "");
    const isEdit = document.getElementById(fieldKey + "-latitude").value != '' && document.getElementById(fieldKey + "-longitude").value != '';

    const latitude = parseFloat(document.getElementById(fieldKey + "-latitude").value) || -33.8688;
    const longitude = parseFloat(document.getElementById(fieldKey + "-longitude").value) || 151.2195;

    const map = new google.maps.Map(document.getElementById(fieldKey + '-map'), {
        center: {lat: latitude, lng: longitude},
        zoom: 13
    });
    const marker = new google.maps.Marker({
        map: map,
        position: {lat: latitude, lng: longitude},
    });

    marker.setVisible(isEdit);

    const autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.key = fieldKey;
    autocompletes.push({input: input, map: map, marker: marker, autocomplete: autocomplete});
}

for (let i = 0; i < autocompletes.length; i++) {
    const input = autocompletes[i].input;
    const autocomplete = autocompletes[i].autocomplete;
    const map = autocompletes[i].map;
    const marker = autocompletes[i].marker;

    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        marker.setVisible(false);
        const place = autocomplete.getPlace();

        geocoder.geocode({'placeId': place.place_id}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                const lat = results[0].geometry.location.lat();
                const lng = results[0].geometry.location.lng();
                setLocationCoordinates(autocomplete.key, lat, lng);
            }
        });

        if (!place.geometry) {
            window.alert("No details available for input: '" + place.name + "'");
            input.value = "";
            return;
        }

        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
        }
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

    });
}
}



    function setLocationCoordinates(key, lat, lng) {

        const latitudeField = document.getElementById(key + "-" + "latitude");
        const longitudeField = document.getElementById(key + "-" + "longitude");
        latitudeField.value = lat;
        longitudeField.value = lng;

    }

    $('#seller-location-updated').submit(function(e) {

        e.preventDefault();
        let formData = new FormData(this);
    
        $.ajax({
            type:'POST',
            url: "{{ route('seller.branche.location.updated') }}",
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    this.reset();
                    Swal.fire(
                        'تم تعديل الموقع بنجاح',
                        )
                }
            },
            error: function(response){
                $('#image-input-error').text(response.responseJSON.message);
            }
       });


    });




   
      
</script>
@endpush
@push('script_2')
   


   

    
   

  
@endpush

@push('script')
@endpush
