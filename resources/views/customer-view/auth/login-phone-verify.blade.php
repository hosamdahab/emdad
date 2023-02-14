@extends('layouts.front-end.app2')

@section('title', \App\CPU\translate('verification_code'))


@push('css_or_js')
    <link href="{{ asset('assets/back-end') }}/css/select2.min.css" rel="stylesheet" />
    <link href="{{ asset('assets/back-end/css/croppie.css') }}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush


@section('content')
    {{--
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid rtl "style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">

            @php($logo = \App\Model\BusinessSetting::where(['type' => 'company_web_logo'])->first()->value)

            <div class="container d-flex justify-content-between">


                <a class="navbar-brand rounded-circle p-2 overflow-hidden d-flex justify-content-center align-items-center "
                    href="#">
                    <span class="d-flex justify-content-center align-items-center gap-2"
                        style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">
                        <strong class="logo-text">{{__('messages.imdad')}}</strong>

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
    </nav> --}}

    <div class="container main-card rtl " style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}">

        <div class="row min-vh-100 justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card border-1 card-rounded">
                    <!-- Nested Row within Card Body -->
                    {{-- //// FORM /////  --}}
                    <div class="card-body p-5 ">
                        <h1 class="logo-text">امداد</h1>
                        <span class="d-flex justify-content-center align-items-center your-phone"
                            style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row' : 'row-reverse' }};">
                            <strong>{{ __('messages.whats_verfication') }}</strong>
                        </span>

                        <form class="needs-validation digit-group mt-4" data-group-name="digits" data-autosubmit="false"
                            autocomplete="off" action="{{ route('customer.login.phone.verify') }}" method="post"
                            id="form-id"style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">
                            @csrf

                            <div class="row ">
                                <div class="col-12 d-flex justify-content-center align-items-center gap-2 "
                                    style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">

                                    <input type="text" id="digit_1" name="digit_1" data-next="digit_2" class="rounded-pill" />
                                    <input type="text" id="digit_2" name="digit_2" data-next="digit_3" class="rounded-pill"
                                        data-previous="digit_1" />
                                    <input type="text" id="digit_3" name="digit_3" data-next="digit_4" class="rounded-pill"
                                        data-previous="digit_2" />
                                    <input type="text" id="digit_4" name="digit_4" data-next="digit_5" class="rounded-pill"
                                        data-previous="digit_3" />

                                </div>
                            </div>



                            <div class="row">
                                <div class="col-12 mt-3">
                                    <div class="d-flex justify-content-center align-items-center gap-2 ">
                                        <p class="p-0 m-0"style="font-size:1rem  ; font-weight:800 ">
                                            {{ \App\CPU\translate('the code ends') }} </p>
                                        <i id="demo"></i>
                                    </div>
                                    <button class="btn primary btn-block btn-shadow mt-3 rounded-pill font-weight-bold font-size-lg"
                                        type="submit">{{ __('messages.sign_in') }}
                                    </button>

                                    </a>

                                </div>
                            </div>



                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

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



    <style>
        .digit-group {

            margin: 10px 0;

        }

        .digit-group input {
            width: 7rem;
            background-color: #f8f8f8;
            border: 1px solid #645cb3;
            line-height: 50px;
            padding: 5px;
            border-radius: 10px;
            text-align: center;
            font-size: 24px;
            font-family: 'Raleway', sans-serif;
            font-weight: 200;
            color: black;
            margin: 0 2px;

        }
    </style>



    {{-- /// TIMER //// --}}


    <script>
        // Set the date we're counting down to
        var countDownDate = new Date().getTime() + 180000;

        // Update the count down every 1 second
        var x = setInterval(function() {

            // Get today's date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Display the result in the element with id="demo"
            document.getElementById("demo").innerHTML = "00:0" + minutes + ":" + seconds;

            // If the count down is finished, write some text
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("demo").innerHTML = "EXPIRED";
            }
        }, 1000);
    </script>


    <script>
        $('.digit-group').find('input').each(function() {
            $(this).attr('maxlength', 1);
            $(this).on('keyup', function(e) {
                var parent = $($(this).parent());

                if (e.keyCode === 8 || e.keyCode === 37) {
                    var prev = parent.find('input#' + $(this).data('previous'));

                    if (prev.length) {
                        $(prev).select();
                    }
                } else if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (
                        e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
                    var next = parent.find('input#' + $(this).data('next'));

                    if (next.length) {
                        $(next).select();
                    } else {
                        if (parent.data('autosubmit')) {
                            parent.submit();
                        }
                    }
                }
            });
        });
        $('#inputCheckd').change(function() {
            // console.log('jell');
            if ($(this).is(':checked')) {
                $('#apply').removeAttr('disabled');
            } else {
                $('#apply').attr('disabled', 'disabled');
            }

        });

        $('#exampleInputPassword ,#exampleRepeatPassword').on('keyup', function() {
            var pass = $("#exampleInputPassword").val();
            var passRepeat = $("#exampleRepeatPassword").val();
            if (pass == passRepeat) {
                $('.pass').hide();
            } else {
                $('.pass').show();
            }
        });
        $('#apply').on('click', function() {

            var image = $("#image-set").val();
            if (image == "") {
                $('.image').show();
                return false;
            }
            var pass = $("#exampleInputPassword").val();
            var passRepeat = $("#exampleRepeatPassword").val();
            if (pass != passRepeat) {
                $('.pass').show();
                return false;
            }


        });

        function Validate(file) {
            var x;
            var le = file.length;
            var poin = file.lastIndexOf(".");
            var accu1 = file.substring(poin, le);
            var accu = accu1.toLowerCase();
            if ((accu != '.png') && (accu != '.jpg') && (accu != '.jpeg')) {
                x = 1;
                return x;
            } else {
                x = 0;
                return x;
            }
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload").change(function() {
            readURL(this);
        });

        function readlogoURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewerLogo').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        function readBannerURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewerBanner').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#LogoUpload").change(function() {
            readlogoURL(this);
        });
        $("#BannerUpload").change(function() {
            readBannerURL(this);
        });



        @if ($errors->any())
            <
            script >
                @foreach ($errors->all() as $error)
                    toastr.error('{{ $error }}', Error, {
                        CloseButton: true,
                        ProgressBar: true
                    });
                @endforeach
    </script>
    @endif


    </script>
@endpush
