@extends('seller-views.partials.app_for_seller')

@section('title', \App\CPU\translate('Seller Apply'))


@push('css_or_js')
    <link href="{{ asset('assets/back-end') }}/css/select2.min.css" rel="stylesheet" />
    <link href="{{ asset('assets/back-end/css/croppie.css') }}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>

.select2-container--default .select2-selection--multiple .select2-selection__choice {

    color:#000
}
    </style>
   
    @endpush


@section('content')

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid rtl "style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">

            @php($logo = \App\Model\BusinessSetting::where(['type' => 'company_web_logo'])->first()->value)

            <div class="container d-flex justify-content-between">


                <a class="navbar-brand rounded-circle p-2 overflow-hidden d-flex justify-content-center align-items-center "
                    href="#">

                    {{--
                    <img class="z-index-2" src="{{ asset('storage/public/company/' . $logo) }}" alt="Logo"
                    onerror="this.src='{{ asset('assets/back-end/img/400x400/img2.jpg') }}'" style="width: 5rem">
                    --}}

                    <span class="d-flex justify-content-center align-items-center gap-2"
                        style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">
                        <strong class="fw-bolder fs-1" style="color:#800080;">{{__('messages.imdad')}}</strong>
                        <h1 class="fw-bolder">{{__('messages.seller_support')}}</h1>
                    </span>
                </a>

                <div>
                    @php($local = \App\CPU\Helpers::default_lang())
                    <div class="topbar-text dropdown disable-autohide  text-capitalize">
                        <a class="topbar-link dropdown-toggle" href="#" data-toggle="dropdown">
                            @foreach (json_decode($language['value'], true) as $data)
                                @if ($data['code'] == $local)
                                    <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}" width="20"
                                        src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                        alt="Eng">
                                    {{ $data['name'] }}
                                @endif
                            @endforeach
                        </a>
                        <ul class="dropdown-menu dropdown-menu-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}"
                            style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
                            @foreach (json_decode($language['value'], true) as $key => $data)
                                @if ($data['status'] == 1)
                                    <li>
                                        <a class="dropdown-item pb-1" href="{{ route('lang', [$data['code']]) }}">
                                            <img class="{{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                width="20"
                                                src="{{ asset('assets/front-end') }}/img/flags/{{ $data['code'] }}.png"
                                                alt="{{ $data['name'] }}" />
                                            <span style="text-transform: capitalize">{{ $data['name'] }}</span>
                                        </a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </nav>

    <div class="container main-card rtl"
        style="height:50vh  margin:0 10% text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">
        <div class="row " style="row-gap: 15px">
            <div class="col-12 col-md-4">
                <div class="card o-hidden border-0 shadow-lg" style=" ; background:transparent ; border-radius: 20px ;">
                    <div class="card-body p-0 m-0  position-relative "
                        style="background:transparent ; border-radius: 20px ;">
                        <div class="position-sticky w-100 h-50  d-flex justify-content-around align-items-center flex-column gap-1"
                            style="height:80vh ;">
                            <h2 class="fs-2 fw-bolder " style="width:80%;">{{ \App\CPU\translate('register steps') }}</h2>

                            <div class="progress" style="width:80%">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                    aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                </div>
                            </div>

                            <h2 class="fs-5" style="width:80%; ">0/3 {{ \App\CPU\translate('complete') }} </h2>

                            <div class="" style="width:80%">
                                <span class="d-flex gap-2">
                                    <div class="lds-ring" style="background: color:#800080; color:color:#800080">
                                        <div></div>
                                        <div></div>
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <h2 class="fs-4" style="color:#800080">{{ \App\CPU\translate('trade info') }}</h2>
                                </span>
                            </div>
                            <div class="" style="width:80%">
                                <span class="d-flex gap-2">
                                    <div class="lds-ring text-secondary ">
                                        <div class="stop"></div>
                                    </div>
                                    <h2 class="fs-4 text-secondary ">{{ \App\CPU\translate('legal info') }}</h2>
                                </span>
                            </div>
                            <div class="" style="width:80%">
                                <span class="d-flex gap-2">
                                    <div class="lds-ring text-secondary ">
                                        <div class="stop"></div>
                                    </div>
                                    <h2 class="fs-4 text-secondary ">{{ \App\CPU\translate('category and products') }}</h2>
                                </span>
                            </div>



                        </div>
                    </div>
                </div>
            </div>

            {{-- ///// FORM //////////// --}}

            <div class="col-12 col-md-8">
                <div class="card o-hidden border-0 shadow-lg" style=" ; background:transparent ; border-radius: 20px ;">
                    <div class="card-body p-0 m-0  overflow-hidden " style="background:transparent ; border-radius: 20px ;">
                        <div class="" style="height:80vh ; overflow-y:scroll;  overflow-x: hidden;">
                            <div class="card-body p-0 " style=" margin:0 80px ;">
                                <h2 class="fs-2 fw-bolder m-0 mt-2  ">{{ \App\CPU\translate('trade info') }}</h2>
                                {{-- <hr class="mt-2"> --}}

                                <form class="needs-validation digit-group mt-4" data-group-name="digits"
                                    data-autosubmit="false" autocomplete="off"
                                    action="{{ route('seller.auth.seller-info-1') }}" method="post"
                                    id="form-id"style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">
                                    @csrf


                                    <div class="row">
                                        <div class="col-md-6 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                    for="exampleFormControlInput1">
                                                    {{ \App\CPU\translate('company_name') }} (عربيـ)</label>
                                                <input type="text" name="company_name_ar" id="company_name_ar"
                                                    class="form-control" value="{{ Session::get('company_name_ar')}}"
                                                    placeholder="{{ \App\CPU\translate('company_name') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                    for="exampleFormControlInput1">{{ \App\CPU\translate('company_name') }}
                                                    (en) </label>
                                                <input type="text" name="company_name_en" id="company_name_en"
                                                    class="form-control" value="{{  Session::get('company_name_en')}}"
                                                    placeholder="{{ \App\CPU\translate('company_name') }}" required>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">

                                        <div class="col-md-12 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label class="input-label fw-bolder " style="font-size: 1.3rem"
                                                    for="exampleFormControlInput1">{{ \App\CPU\translate('company type') }}</label>
                                                <select name="company_type" id="company_type" class="form-control"
                                                    value="{{ Session::get('company_type') }}">
                                                    <option value="" selected disabled>---Select---</option>
                                                    <option value="factory">{{ \App\CPU\translate('factory') }}</option>
                                                    <option value="supplier">{{ \App\CPU\translate('supplier') }}</option>
                                                    <option value="trader">{{ \App\CPU\translate('trader') }}</option>

                                                </select>
                                            </div>
                                        </div>


                                        <div class="col-md-12 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label class="input-label fw-bolder " style="font-size: 1.3rem"
                                                    for="exampleFormControlInput1">{{ \App\CPU\translate('company_email') }}</label>
                                                    <input type="email" name="email" value="{{old('certificate_number')}}" class="form-control" placeholder="{{\App\CPU\translate('email')}}" id="email" required>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label class="input-label fw-bolder " style="font-size: 1.3rem"
                                                    for="exampleFormControlInput1">{{ \App\CPU\translate('Country') }}</label>
                                                <select name="country" id="country" class="form-control"
                                                    value="{{ Session::get('country') }}">
                                                    <option value="" selected disabled>---Select---</option>
                                                    <option value="yemen">{{ \App\CPU\translate('yemen') }}</option>
                                                </select>
                                            </div>
                                        </div>

                                        <?php
                                       $getState =  \App\Model\States::all();
                                       ?>

                                        <div class="col-md-12 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label class="input-label fw-bolder " style="font-size: 1.3rem"
                                                    for="exampleFormControlInput1">{{ \App\CPU\translate('City_State') }}</label>
                                                <select value="{{ Session::get('city_id') }}"
                                                    class="js-example-basic-multiple form-control" name="city_id"
                                                    id="city_id"
                                                    onchange="getRequest('{{ url('/') }}/seller/auth/get-places?city_id='+this.value,'places','select')"
                                                    required>
                                                    <option value="{{ old('city_id') }}" selected disabled>---Select---
                                                    </option>
                                                  
                                                    @foreach ($getState as $c)
                                                        <option value="{{ $c['id'] }}"
                                                            {{ old('name') == $c['id'] ? 'selected' : '' }}>
                                                            {{ $c['name'] }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <?php
                                       $getCity =  \App\Model\City::all();
                                       ?>

                                        <div class="col-md-12 col-12">
                                            <div class="form-group p-0 m-0">
                                                <label class="input-label fw-bolder js-example-responsive"
                                                    style="font-size: 1.3rem"
                                                    for="places">{{ __('messages.States') }}</label>
                                                <select class="form-control places" name="places[]" id="places" multiple="multiple">
                                                @foreach($getCity as $val)
                                                <option value="{{$val->id}}">{{$val->name}}</option>
                                                @endforeach
                                                </select>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="d-flex justify-content-around align-items-center  gap-2 mt-3 "
                                        style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">

                                        <button class="btn btn-shadow "type="button"
                                            onclick="window.location='{{ URL::route('seller.auth.register') }}'"
                                            style="font-size: 1.5rem ;background: rgb(172, 171, 171) ; color:white ;">
                                            {{ \App\CPU\translate('Previous') }}
                                        </button>

                                        <div class="btn btn-primary  btn-shadow px-3" type="button"
                                            onclick="validation_1('{{ url('/') }}/seller/auth/seller-info-submit')"
                                            style="font-size: 1.5rem ;">{{ \App\CPU\translate('Next') }}
                                        </div>

                                    </div>
                                </form>



                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

<link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/slimselect.min.css">
<script src="{{ asset('assets/back-end') }}/js/slimselect.min.js"></script>


<style>
    .lds-ring {
        display: inline-block;
        position: relative;
        width: 20px;
        height: 20px;
    }

    .lds-ring .stop {
        box-sizing: border-box;
        display: block;
        position: absolute;
        width: 16px;
        height: 16px;
        margin: 3px;
        border: 3px solid grey;
        border-radius: 50%;
    }

    .lds-ring div {
        box-sizing: border-box;
        display: block;
        position: absolute;
        width: 16px;
        height: 16px;
        margin: 3px;
        border: 3px solid grey;
        border-radius: 50%;
        animation: lds-ring 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
        border-color: grey transparent transparent transparent;
    }

    .lds-ring div:nth-child(1) {
        animation-delay: -0.45s;
    }

    .lds-ring div:nth-child(2) {
        animation-delay: -0.3s;
    }

    .lds-ring div:nth-child(3) {
        animation-delay: -0.15s;
    }

    @keyframes lds-ring {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }
</style>




@push('script')

    @if ($errors->any())
        <script>
            @foreach ($errors->all() as $error)
                toastr.error('{{ $error }}', Error, {
                    CloseButton: true,
                    ProgressBar: true
                });
            @endforeach
        </script>
    @endif

    <script>
        new SlimSelect({
            select: '#places'
        })

        function getRequest(route, id, type) {
            $.get({
                url: route,
                dataType: 'json',
                success: function(data) {
                    if (type == 'select') {
                        $('#' + id).empty().append(data.select_tag);
                    }
                },
            });
        }


        $(document).ready(function() { // Wait until document is fully parsed and stop FORMS from submitimg
            $("form").each((y, x) => {
                $(x).on('submit', function(e) {
                    e.preventDefault();

                });
            })
        })


        // FIRST FROM VALIDATION
        function validation_1(route) {

            var company_name_en = $('#company_name_en').val();
            var company_name_ar = $('#company_name_ar').val();
            var company_type = $('#company_type').val();
            var country = $('#country').val();
            var city_id = $('#city_id').val();
            var arrPlaces = $('#places').val() ?? [];

            places = ''
            arrPlaces.map((x) => {
                places += `places[]=${x}&`
            })

            var query = `company_name_en=${company_name_en}&
                                company_name_ar=${company_name_ar}&
                                company_type=${company_type}&
                                country=${country}&
                                city_id=${city_id}&
                                ${places}`

            var root = route + "?" + query
            console.log(root)
            $.get({
                url: root,
                method: 'get',
                dataType: 'json',
                success: function(data) {
                    if (data.errors.length > 0) {
                        get_errors(data.errors);
                    } else {
                        window.location = '{{ URL::route('seller.auth.seller-info-2') }}'
                    }
                }
            })
        }


        function get_errors(err) {
            err.forEach(element => {
                toastr.error(`${element}`, Error, {
                    CloseButton: true,
                    ProgressBar: true
                });
            })
        }
    </script>

    <script>

        $(document).ready(function(){

            $('.places').select2({

                placeholder: 'Select',
                allowClear: true

            });

            $('.places').change(function(){

                console.log('good');

            });
        })
    </script>
@endpush
