@extends('seller-views.partials.app_for_seller')

@section('title', \App\CPU\translate('Seller Apply'))


@push('css_or_js')
    <link href="{{ asset('assets/back-end') }}/css/select2.min.css" rel="stylesheet" />
    <link href="{{ asset('assets/back-end/css/croppie.css') }}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
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
                        <strong class="fw-bolder fs-1" style="color:#800080;">إمــداد</strong>
                        <h1 class="fw-bolder">Seller Hub </h1>
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
        <div class="row">
            <div class="col-4">
                <div class="card o-hidden border-0 shadow-lg" style=" ; background:transparent ; border-radius: 20px ;">
                    <div class="card-body p-0 m-0  position-relative "
                        style="background:transparent ; border-radius: 20px ;">
                        <div
                            class="position-sticky w-100 h-50  d-flex justify-content-around align-items-center flex-column gap-1"style="height:80vh ;">

                            <h2 class="fs-2 fw-bolder " style="width:80%;">{{ \App\CPU\translate('register steps') }}</h2>

                            <div class="progress pross" style="width:80%">
                                <div class="progress-bar progress-bar-success" style="transition: .3s ; width:0% "
                                    role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>

                            <h2 class="fs-5" style="width:80%; "><span class="accom">0/3</span>
                                {{ \App\CPU\translate('complete') }} </h2>




                            <div id="carouselExampleSlidesOnly" class="carousel pro " data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">

                                        <div class="1st w-100">
                                            <span class="d-flex gap-2">
                                                <div class="lds-ring"
                                                    style="background: color:#800080; color:color:#800080">
                                                    <div></div>
                                                    <div></div>
                                                    <div></div>
                                                    <div></div>
                                                </div>
                                                <h2 class="fs-4 " style="color:#800080">
                                                    {{ \App\CPU\translate('trade info') }}
                                                </h2>
                                            </span>
                                        </div>

                                        <div class="2end w-100">
                                            <span class="d-flex gap-2">
                                                <div class="lds-ring text-secondary ">
                                                    <div class="stop"></div>
                                                </div>
                                                <h2 class="fs-4 text-secondary ">
                                                    {{ \App\CPU\translate('legal info') }}</h2>
                                            </span>
                                        </div>

                                        <div class="3rd w-100">
                                            <span class="d-flex gap-2">
                                                <div class="lds-ring text-secondary ">
                                                    <div class="stop"></div>
                                                </div>
                                                <h2 class="fs-4 text-secondary ">
                                                    {{ \App\CPU\translate('category and products') }}</h2>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="carousel-item ">


                                        <div class="1st w-100">
                                            <span class="d-flex gap-2">
                                                <i class="fa-solid fa-circle-check text-success" style="line-height:2"></i>
                                                <h2 class="fs-4  text-secondary">{{ \App\CPU\translate('trade info') }}
                                                </h2>
                                            </span>
                                        </div>

                                        <div class="2end w-100">
                                            <span class="d-flex gap-2">
                                                <div class="lds-ring"
                                                    style="background: color:#800080; color:color:#800080">
                                                    <div></div>
                                                    <div></div>
                                                    <div></div>
                                                    <div></div>
                                                </div>
                                                <h2 class="fs-4 " style="color:#800080">
                                                    {{ \App\CPU\translate('legal info') }}</h2>
                                            </span>
                                        </div>

                                        <div class="3rd w-100">
                                            <span class="d-flex gap-2">
                                                <div class="lds-ring text-secondary ">
                                                    <div class="stop"></div>
                                                </div>
                                                <h2 class="fs-4 text-secondary ">
                                                    {{ \App\CPU\translate('category and products') }}</h2>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="carousel-item ">


                                        <div class="1st w-100">
                                            <span class="d-flex gap-2">
                                                <i class="fa-solid fa-circle-check text-success" style="line-height:2"></i>
                                                <h2 class="fs-4  text-secondary">{{ \App\CPU\translate('trade info') }}
                                                </h2>
                                            </span>
                                        </div>

                                        <div class="2end w-100">
                                            <span class="d-flex gap-2">
                                                <i class="fa-solid fa-circle-check text-success"
                                                    style="line-height:2"></i>
                                                <h2 class="fs-4  text-secondary">
                                                    {{ \App\CPU\translate('legal info') }}</h2>
                                            </span>
                                        </div>

                                        <div class="3rd w-100">
                                            <span class="d-flex gap-2">
                                                <div class="lds-ring"
                                                    style="background: color:#800080; color:color:#800080">
                                                    <div></div>
                                                    <div></div>
                                                    <div></div>
                                                    <div></div>
                                                </div>
                                                <h2 class="fs-4  " style="color:#800080">
                                                    {{ \App\CPU\translate('category and products') }}</h2>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>





                        </div>
                    </div>
                </div>
            </div>
            {{-- ///// FORM   //////////// --}}

            <div class="col-8">
                <div class="card o-hidden border-0 shadow-lg" style=" ; background:transparent ; border-radius: 20px ;">
                    <div class="card-body p-0 m-0  overflow-hidden "
                        style="background:transparent ; border-radius: 20px ;">
                        <div class="" style="height:80vh ; overflow-y:scroll;  overflow-x: hidden;">
                            <div class="card-body p-0 " style=" margin:0 80px ;">

                                <div id="carouselExampleControls" class="carousel " data-interval="false"
                                    data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">

                                            <form class="needs-validation digit-group mt-4" data-group-name="digits"
                                                data-autosubmit="false" autocomplete="off" action="#" method="post"
                                                id="form-id"style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">
                                                @csrf


                                                <div class="row">
                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="exampleFormControlInput1">
                                                                {{ \App\CPU\translate('company_name') }} (عربيـ)</label>
                                                            <input type="text" name="company_name_en"
                                                                id="company_name_en" class="form-control"
                                                                value="{{ Session::get('company_name_en') }}"
                                                                placeholder="{{ \App\CPU\translate('company_name') }}"
                                                                required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="exampleFormControlInput1">{{ \App\CPU\translate('company_name') }}
                                                                (en) </label>
                                                            <input type="text" name="company_name_ar"
                                                                id="company_name_ar" class="form-control"
                                                                value="{{ old('company_name_ar') }}"
                                                                placeholder="{{ \App\CPU\translate('company_name') }}"
                                                                required>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">

                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label class="input-label fw-bolder "
                                                                style="font-size: 1.3rem"
                                                                for="exampleFormControlInput1">{{ \App\CPU\translate('company type') }}</label>
                                                            <select name="company_type" id="company_type"
                                                                class="form-control" value="{{ old('company_type') }}">
                                                                <option value="" selected disabled>---Select---
                                                                </option>
                                                                <option value="factory"
                                                                    {{ old('company_type') == 'factory' ? 'selected' : '' }}>
                                                                    {{ \App\CPU\translate('factory') }}</option>
                                                                <option
                                                                    value="supplier"{{ old('company_type') == 'supplier' ? 'selected' : '' }}>
                                                                    {{ \App\CPU\translate('supplier') }}</option>
                                                                <option
                                                                    value="trader"{{ old('company_type') == 'trader' ? 'selected' : '' }}>
                                                                    {{ \App\CPU\translate('trader') }}
                                                                </option>

                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label class="input-label fw-bolder "
                                                                style="font-size: 1.3rem"
                                                                for="exampleFormControlInput1">{{ \App\CPU\translate('country') }}</label>
                                                            <select name="country" id="country" class="form-control">
                                                                <option value="" selected disabled>---Select---
                                                                </option>
                                                                <option value="yemen"
                                                                    {{ old('country') == 'yemen' ? 'selected' : '' }}>
                                                                    {{ \App\CPU\translate('yemen') }}
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label class="input-label fw-bolder "
                                                                style="font-size: 1.3rem"
                                                                for="exampleFormControlInput1">{{ \App\CPU\translate('city') }}</label>
                                                            <select value="{{ old('city_id') }}"
                                                                class="js-example-basic-multiple form-control"
                                                                name="city_id" id="city_id"
                                                                onchange="getRequest('{{ url('/') }}/seller/auth/get-places?city_id='+this.value,'places','select')"
                                                                required>
                                                                <option value="{{ old('city_id') }}" selected disabled>
                                                                    ---Select---</option>
                                                                @foreach ($cat as $c)
                                                                    <option value="{{ $c['id'] }}"
                                                                        {{ old('city_id') == $c['id'] ? 'selected' : '' }}>
                                                                        {{ $c['name'] }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label class="input-label fw-bolder js-example-responsive"
                                                                style="font-size: 1.3rem"
                                                                for="places">{{ \App\CPU\translate('places') }}</label>
                                                            <select value="{{ old('places[]') }}"
                                                                class="js-example-basic-multiple js-states js-example-responsive form-control"
                                                                name="places[]" id="places" multiple="multiple">

                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>



                                                <div class="d-flex justify-content-around align-items-center  gap-2 mt-3 "
                                                    style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">

                                                    <button class="btn btn-shadow "type="button"
                                                        onclick="window.location='{{ URL::route('seller.auth.register') }}'"
                                                        style="font-size: 1.5rem ;background: rgb(172, 171, 171) ; color:white ;">
                                                        {{ \App\CPU\translate('previous') }}
                                                    </button>

                                                    <button class="btn btn-primary  btn-shadow px-3" type="button"
                                                        onclick="validation_1('{{ url('/') }}/seller/auth/seller-info-1')"
                                                        style="font-size: 1.5rem ;">{{ \App\CPU\translate('next') }}
                                                    </button>
                                                </div>
                                            </form>


                                        </div>
                                        <div class="carousel-item">

                                            <form class="needs-validation digit-group mt-4" data-group-name="digits"
                                                data-autosubmit="false" autocomplete="off"
                                                {{-- action="{{ route('seller.auth.seller_info_2') }}" --}}
                                                action="#"
                                                enctype="multipart/form-data" method="post"
                                                id="form-id"style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">
                                                @csrf

                                                <div class="row">
                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="regiseration_number">
                                                                {{ \App\CPU\translate('regiseration_number') }}</label>
                                                            <input type="number" name="regiseration_number"
                                                                class="form-control" id="regiseration_number"
                                                                placeholder="{{ \App\CPU\translate('regiseration_number') }}"
                                                                required>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">

                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="start_date">
                                                                {{ \App\CPU\translate('start_date') }}</label>
                                                            <input type="text" name="start_date" class="form-control"
                                                                placeholder="{{ \App\CPU\translate('start_date') }}"
                                                                id="start_date" required>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="end_date">
                                                                {{ \App\CPU\translate('end_date') }}</label>
                                                            <input type="text" name="end_date" class="form-control"
                                                                placeholder="{{ \App\CPU\translate('end_date') }}"
                                                                id="end_date" required>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="regist_image"></label>
                                                            <input type="file" name="regist_image"
                                                                class="form-control" id="regist_image" required>
                                                        </div>
                                                    </div>


                                                </div>


                                                <hr>


                                                <div class="row">

                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="certificate_number">
                                                                {{ \App\CPU\translate('certificate_number') }}</label>
                                                            <input type="number" name="certificate_number"
                                                                class="form-control"
                                                                placeholder="{{ \App\CPU\translate('certificate_number') }}"
                                                                id="certificate_number" required>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-12 col-12">
                                                        <div class="form-group p-0 m-0">
                                                            <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                                for="certificate_image"></label>
                                                            <input type="file" name="certificate_image"
                                                                class="form-control" id="certificate_image" required>
                                                        </div>
                                                    </div>



                                                </div>


                                                <div class="d-flex justify-content-around align-items-center  gap-2 mt-3 "
                                                    style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">

                                                    <button class="btn btn-shadow "type="button"
                                                        onclick="$('.carousel').carousel('prev')"
                                                        style="font-size: 1.5rem ;background: rgb(172, 171, 171) ; color:white ;">
                                                        {{ \App\CPU\translate('previous') }}
                                                    </button>

                                                    <div class="btn btn-primary  btn-shadow px-3" type="submit"
                                                        onclick="validation_2('{{ url('/') }}/seller/auth/seller-info-2')"
                                                        style="font-size: 1.5rem ;">{{ \App\CPU\translate('next') }}
                                                    </div>
                                                </div>
                                            </form>

                                        </div>


                                        <div class="carousel-item">

                                            <form class="needs-validation digit-group mt-4" data-group-name="digits"
                                                data-autosubmit="false" autocomplete="off" action="#" method="post"
                                                enctype="multipart/form-data"
                                                id="form-id"style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">
                                                @csrf

                                                <div class="row justify-content-center gap-3">
                                                    @foreach ($all_cats as $key => $val)
                                                        <div class="col col-5 rounded p-2" style="background: #eee">
                                                            <h3 class="">{{ $val->name }}</h3>
                                                            <div class=" me-2 row row-cols-3 ">
                                                                @foreach ($val->childes as $item)
                                                                    <span class="fom-check p-0 m-0 ">
                                                                        <input class="p-0 m-0  form-check-input"
                                                                            type="checkbox" name="categories[]"
                                                                            multiple="multiple"
                                                                            value="{{ $item->id }}"
                                                                            id="{{ $item->id }}">
                                                                        <label class="p-0 m-0  form-check-label me-4"
                                                                            for="{{ $item->id }}">
                                                                            {{ $item->name }}
                                                                        </label>
                                                                    </span>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>

                                                <hr>


                                                <div class="col-md-12 col-12">

                                                    <div class="form-group p-0 m-0">
                                                        <label style="font-size: 1.3rem" class="input-label fw-bolder"
                                                            for="products_file">قم بتحميل قائمة المنتجات الخاصة بك </label>
                                                        <input type="file" name="products_file"
                                                            class="form-control"id="products_file" required>
                                                    </div>

                                                </div>



                                                <div class="d-flex justify-content-around align-items-center  gap-2 mt-3 "
                                                    style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">

                                                    <button class="btn btn-shadow "type="submit"
                                                        style="font-size: 1.5rem ;background: rgb(172, 171, 171) ; color:white ;">
                                                        {{ \App\CPU\translate('previous') }}
                                                    </button>

                                                    <button class="btn btn-primary  btn-shadow px-3" type="submit"
                                                        style="font-size: 1.5rem ;">{{ \App\CPU\translate('next') }}
                                                    </button>
                                                </div>
                                            </form>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        @endsection


        {{--
<link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet" />
<script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>
 --}}



        <link rel="stylesheet" href="{{ asset('assets/front-end') }}/css/slimselect.min.css">
        <script src="{{ asset('assets/back-end') }}/js/slimselect.min.js"></script>

        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/css/datepicker.min.css">
        <script src="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/js/datepicker-full.min.js"></script>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />

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
                displaySelect = new SlimSelect({
                    select: '#places'
                })

                const elem = document.getElementById('start_date');
                const elem2 = document.getElementById('end_date');

                const datepicker = new Datepicker(elem, {
                    autohide: true,
                });
                const datepicker2 = new Datepicker(elem2, {
                    autohide: true,
                });


                $('.carousel').carousel("pause")
                $('.carousel').carousel("next")


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

                    $.get({
                        url: root,
                        method: 'get',
                        dataType: 'json',
                        success: function(data) {
                            if (data.errors.length > 0) {
                                get_errors(data.errors);
                            } else {
                                $('.carousel').carousel("next")
                            }
                        }
                    })
                }

                // SECOND FROM VALIDATION
                function validation_2(route) {

                    var regiseration_number = $('#regiseration_number').val();
                    var start_date = $('#start_date').val();
                    var end_date = $('#end_date').val();
                    var regist_image = $('#regist_image').val();
                    var certificate_number = $('#certificate_number').val();
                    var certificate_image = $('#certificate_image').val();


                    var query = `regiseration_number=${regiseration_number}&
                                start_date=${start_date}&
                                end_date=${end_date}&
                                regist_image=${regist_image}&
                                certificate_number=${certificate_number}&
                                certificate_image=${certificate_image}`

                    var root = route + "?" + query
                    console.log(query)

                    data = new FormData();
                    data.append('file', $('#certificate_image')[0].files[0]);

                    $.post({
                        // url: root,
                        url: route,
                        enctype: 'multipart/form-data',
                        data: data,
                        processData: false,
                        contentType: false ,
                        method: 'post',
                        // dataType: 'json',
                        success: function(data) {
                            if (data.errors.length > 0) {
                                get_errors(data.errors);
                            } else {
                                $('.carousel').carousel("next")
                            }
                        }
                    })
                }






                // LOOPING THROW ERRORS
                function get_errors(err) {
                    err.forEach(element => {
                        toastr.error(`${element}`, Error, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    })
                }
            </script>

        @endpush
