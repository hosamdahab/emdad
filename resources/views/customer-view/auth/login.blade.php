@extends('layouts.front-end.app2')
@section('title', \App\CPU\translate('Login'))
@push('css_or_js')
    <style>
        .password-toggle-btn .custom-control-input:checked ~ .password-toggle-indicator {
            color: {{$web_config['primary_color']}};
        }

        .for-no-account {
            margin: auto;
            text-align: center;
        }

    </style>

    <style>
        .input-icons i {
            /* position: absolute; */
            cursor: pointer;
        }

        .input-icons {
            width: 100%;
            margin-bottom: 10px;
        }

        .icon {
            padding: 9% 0 0 0;
            min-width: 40px;
        }

        .input-field {
            width: 94%;
            padding: 10px 0 10px 10px;
            text-align: center;
            border-right-style: none;
        }
    </style>
@endpush
@section('content')
    <div class="container"
         style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <div class="row min-vh-100 justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card border-1 card-rounded">
                    <div class="card-body p-5">
                       {{-- <img style="height: 80px!important;width:auto;display:block;margin:auto" class="mobile-logo-img"
                         src="{{asset('images/logo.png')}}"
                         onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                         alt="emdadb2b"/> --}}
                         <h1 class="logo-text">امداد</h1>
                         <h4 class="your-phone">{{App\CPU\translate('yours_phone')}}</h4>
                         <p class="whats-verfiry">{{App\CPU\translate('whats_verfiry')}}</p>

                        {{-- <h3 class="font-size-base pt-4 pb-2">{{\App\CPU\translate('or_using_form_below')}}</h3> --}}
                        <form class="needs-validation mt-2" autocomplete="off" action="{{route('customer.auth.login')}}"
                              method="post" id="form-id">
                            @csrf


                            <div class="form-group ">
                                    <div class="row justify-content-center align-items-center ">

                                        <div class="col-4" style="margin-top:2.25rem">
                                            <select class="form-control rounded-pill" name="country_code"
                                                aria-label="Default select example">

                                                <option class="fs-5" selected
                                                    value="+967">{{ \App\CPU\translate('yemen') }} +967</option>


                                            </select>
                                        </div>
                                        <div class="col-8">

                                            <label for="reg-phone"
                                                style="">{{ \App\CPU\translate('phone_number') }}</label>
                                            <input class="form-control w-100 rounded-pill" type="number" value="{{ old('phone') }}"
                                                name="phone"
                                                style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};"
                                                required>
                                            <div class="invalid-feedback">
                                                {{ \App\CPU\translate('Please enter your phone number') }}!
                                            </div>

                                        </div>


                                    </div>
                                </div>



                            <button class="btn primary rounded-pill btn-block btn-shadow font-weight-bold font-size-lg"
                                    type="submit">{{\App\CPU\translate('Next')}}</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <!--    <script>
        $('#sign-in-form').submit(function (e) {
            e.preventDefault();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('customer.auth.login')}}',
                dataType: 'json',
                data: $('#sign-in-form').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success(data.message, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setInterval(function () {
                            location.href = data.url;
                        }, 2000);
                    }
                },
                complete: function () {
                    $('#loading').hide();
                },
                error: function () {
                    toastr.error('Credentials do not match or account has been suspended.', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>-->
    {{-- recaptcha scripts start --}}
    @if(isset($recaptcha) && $recaptcha['status'] == 1)
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('recaptcha_element', {
                    'sitekey': '{{ \App\CPU\Helpers::get_business_settings('recaptcha')['site_key'] }}'
                });
            };
        </script>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async
                defer></script>
        <script>
            $("#form-id").on('submit', function (e) {
                var response = grecaptcha.getResponse();

                if (response.length === 0) {
                    e.preventDefault();
                    toastr.error("{{\App\CPU\translate('Please check the recaptcha')}}");
                }
            });
        </script>
    @else
        <script type="text/javascript">
            function re_captcha() {
                $url = "{{ URL('/customer/auth/code/captcha') }}";
                $url = $url + "/" + Math.random();
                document.getElementById('default_recaptcha_id').src = $url;
                console.log('url: '+ $url);
            }
        </script>
    @endif
    {{-- recaptcha scripts end --}}
@endpush
