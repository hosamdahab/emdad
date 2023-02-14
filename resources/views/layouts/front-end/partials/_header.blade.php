<style>
    .card-body.search-result-box {
        overflow: scroll;
        height: 400px;
        overflow-x: hidden;
    }

    .active .seller {
        font-weight: 700;
    }

    pb-1:after {

        display: none
    }

    .for-count-value {
        position: absolute;

        right: 0.6875rem;
        ;
        width: 1.25rem;
        height: 1.25rem;
        border-radius: 50%;
        color: {{ $web_config['primary_color'] }};

        font-size: .75rem;
        font-weight: 500;
        text-align: center;
        line-height: 1.25rem;
    }

    .count-value {
        width: 1.25rem;
        height: 1.25rem;
        border-radius: 50%;
        color: {{ $web_config['primary_color'] }};

        font-size: .75rem;
        font-weight: 500;
        text-align: center;
        line-height: 1.25rem;
    }

    @media (min-width: 992px) {
        .navbar-sticky.navbar-stuck .navbar-stuck-menu.show {
            display: block;
            height: 55px !important;
        }
    }

    @media (min-width: 768px) {
        .navbar-stuck-menu {
            background-color: {{ $web_config['primary_color'] }};
            line-height: 15px;
            padding-bottom: 6px;
        }

    }

    @media (max-width: 767px) {
        .search_button {
            background-color: transparent !important;
        }

        .search_button .input-group-text i {
            color: {{ $web_config['primary_color'] }} !important;
        }

        .navbar-expand-md .dropdown-menu>.dropdown>.dropdown-toggle {
            position: relative;
            padding- {{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}: 1.95rem;
        }

        .mega-nav1 {
            background: white;
            color: {{ $web_config['primary_color'] }} !important;
            border-radius: 3px;
        }

        .mega-nav1 .nav-link {
            color: {{ $web_config['primary_color'] }} !important;
        }
    }

    @media (max-width: 768px) {
        .tab-logo {
            width: 10rem;
        }
    }

    @media (max-width: 360px) {
        .mobile-head {
            padding: 3px;
        }
    }

    @media (max-width: 471px) {
        .navbar-brand img {}

        .mega-nav1 {
            background: white;
            color: {{ $web_config['primary_color'] }} !important;
            border-radius: 3px;
        }

        .mega-nav1 .nav-link {
            color: {{ $web_config['primary_color'] }} !important;
        }
    }

    #anouncement {
        width: 100%;
        padding: 2px 0;
        text-align: center;
        color: white;
    }

    #can li {

        margin: 10px
    }


    #can li a {

        font-weight: 600;
        font-size: 17px;

    }

    #can li a i {

        margin: 0 5px
    }

    .active-li {
        background-color: #4d49b10d;
        border-radius: 72px;
    }
</style>

@php
$announcement = \App\CPU\Helpers::get_business_settings('announcement');
$customer = App\CPU\Helpers::get_customer();
@endphp
@if (isset($announcement) && $announcement['status'] == 1)
    <div class="d-flex justify-content-between align-items-center" id="anouncement"
        style="background-color: {{ $announcement['color'] }};color:{{ $announcement['text_color'] }}">
        <span></span>
        <span style="text-align:center; font-size: 15px;">{{ $announcement['announcement'] }} </span>
        <span class="ml-3 mr-3" style="font-size: 12px;cursor: pointer;color: darkred" onclick="myFunction()">X</span>
    </div>
@endif


<header class="box-shadow-sm rtl">

    <!-- Topbar-->
    <nav class="navbar shadow"
        style="background:#fff;position:fixed;width:100%;z-index:500000;box-shadow:37px 2px 9px -3px;padding:10px">
        <div class="container-fluid {{ Session::get('direction') === 'rtl' ? 'flex-row-reverse' : 'flex-row' }}" style="justify-content: space-around;">
            <a href="{{ route('home') }}" class=" text-decoration-none">
                <h1 class="logo-text">امداد</h1>
            </a>

            <div class="d-none d-sm-block">
                <div style="display: flex;align-items: center;justify-content: center;">
                    <div style="display: flex;
                    align-items: center;
                    padding: 10px;
                    color: #9c9c9c;">
                        <span style="font-family: 'Cairo';">التوصيل الى</span>
                    </div>
    
                    <div class="dropdown">
                        <a class="btn btn-light dropdown-toggle rounded-pill" href="{{ route('customer.locations') }}" >
                          {{$customer->city}}
                        </a>
                      </div>
                </div>
            </div>


            <div class="d-flex" style="flex-direction:row-reverse;margin:0 10px">

                <div class=" rounded-circle"
                    style="background:#f8f8f8;padding:3px;width:4rem;display:flex;justify-content:center;align-items:center">
                    @php($local = \App\CPU\Helpers::default_lang())
                    <div class="topbar-text dropdown disable-autohide text-capitalize">
                        <a class="topbar-link dropdown-toggle" style="text-decoration:none;font-weight:600"
                            href="#" data-toggle="dropdown">
                            @foreach (json_decode($language['value'], true) as $data)
                                @if ($data['code'] == $local)
                                    {{ $data['code'] }}
                                @endif
                            @endforeach
                        </a>
                        <ul class="dropdown-menu dropdown-menu-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}"
                            style="text-align: {{ Session::get('direction') === 'rtl' ? 'right' : 'left' }};">
                            @foreach (json_decode($language['value'], true) as $key => $data)
                                @if ($data['status'] == 1)
                                    <li>
                                        <a class="dropdown-item pb-1" href="{{ route('lang', [$data['code']]) }}">

                                            <span style="text-transform: capitalize">{{ $data['code'] }}</span>
                                        </a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </div>

                <div id="cart_items">
                    @include('layouts.front-end.partials.cart')
                </div>

                <div style="background:#f8f8f8;border-radius:50%;padding:3px;padding-top: 6px;">
                    <button class="navbar-toggler" style="border:none" type="button" style="border:none"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        <span class="navbar-toggler-icon" style="border:none"></span>
                    </button>

                </div>
            </div>


            <div class="offcanvas offcanvas-end" style="direction:rtl;width:20rem" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h1 class="logo-text">امداد</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div style="padding:0 10px;font-size:18px;font-weight:600;text-align:center">
                    <p>@php($user = App\CPU\Helpers::get_customer())
                        {{ App\CPU\translate('good_moning') }}👋 , {{ $user->f_name }} {{ $user->l_name }}
                    </p>
                </div>

                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3" id="can">
                        <li class="nav-item {{request()->routeIs('home') ? 'active-li' : ''}}">
                            <div class="d-flex" style="padding: 0.7rem">
                                <svg width="25px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M3.00999 11.22V15.71C3.00999 20.2 4.80999 22 9.29999 22H14.69C19.18 22 20.98 20.2 20.98 15.71V11.22" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 12C13.83 12 15.18 10.51 15 8.68L14.34 2H9.67L9 8.68C8.82 10.51 10.17 12 12 12Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M18.31 12C20.33 12 21.81 10.36 21.61 8.35L21.33 5.6C20.97 3 19.97 2 17.35 2H14.3L15 9.01C15.17 10.66 16.66 12 18.31 12Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M5.64 12C7.29 12 8.78 10.66 8.94 9.01L9.16 6.8L9.64001 2H6.59C3.97001 2 2.97 3 2.61 5.6L2.34 8.35C2.14 10.36 3.62 12 5.64 12Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M12 17C10.33 17 9.5 17.83 9.5 19.5V22H14.5V19.5C14.5 17.83 13.67 17 12 17Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                <a class="dropdown-item active" style="font-weight:600" aria-current="page"
                                    href="{{ route('home') }}">
                                    {{ App\CPU\translate('store') }}
                                </a>

                            </div>
                        </li>
                        <li class="nav-item {{request()->routeIs('account-oder') ? 'active-li' : ''}}">
                            <div class="d-flex" style="padding: 0.7rem">
                                <svg width="25px" height="24px" viewBox="0 0 1024 1024" fill="#000000" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M300 462.4h424.8v48H300v-48zM300 673.6H560v48H300v-48z" fill="" /><path d="M818.4 981.6H205.6c-12.8 0-24.8-2.4-36.8-7.2-11.2-4.8-21.6-11.2-29.6-20-8.8-8.8-15.2-18.4-20-29.6-4.8-12-7.2-24-7.2-36.8V250.4c0-12.8 2.4-24.8 7.2-36.8 4.8-11.2 11.2-21.6 20-29.6 8.8-8.8 18.4-15.2 29.6-20 12-4.8 24-7.2 36.8-7.2h92.8v47.2H205.6c-25.6 0-47.2 20.8-47.2 47.2v637.6c0 25.6 20.8 47.2 47.2 47.2h612c25.6 0 47.2-20.8 47.2-47.2V250.4c0-25.6-20.8-47.2-47.2-47.2H725.6v-47.2h92.8c12.8 0 24.8 2.4 36.8 7.2 11.2 4.8 21.6 11.2 29.6 20 8.8 8.8 15.2 18.4 20 29.6 4.8 12 7.2 24 7.2 36.8v637.6c0 12.8-2.4 24.8-7.2 36.8-4.8 11.2-11.2 21.6-20 29.6-8.8 8.8-18.4 15.2-29.6 20-12 5.6-24 8-36.8 8z" fill="" /><path d="M747.2 297.6H276.8V144c0-32.8 26.4-59.2 59.2-59.2h60.8c21.6-43.2 66.4-71.2 116-71.2 49.6 0 94.4 28 116 71.2h60.8c32.8 0 59.2 26.4 59.2 59.2l-1.6 153.6z m-423.2-47.2h376.8V144c0-6.4-5.6-12-12-12H595.2l-5.6-16c-11.2-32.8-42.4-55.2-77.6-55.2-35.2 0-66.4 22.4-77.6 55.2l-5.6 16H335.2c-6.4 0-12 5.6-12 12v106.4z" fill="" /></svg>
                                <a class="dropdown-item" href="{{ route('account-oder') }}" style="font-weight:600">
                                    {{ App\CPU\translate('Orders') }}
                                </a>
                            </div>
                        </li>

                        <li class="nav-item {{request()->routeIs('customer.wallet') ? 'active-li' : ''}}">
                            <div class="d-flex" style="padding: 0.7rem">
                                <svg width="25px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M20.5899 22C20.5899 18.13 16.7399 15 11.9999 15C7.25991 15 3.40991 18.13 3.40991 22" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                <a class="dropdown-item" href="{{ route('customer.wallet') }}" style="font-weight:600">
                                    {{ App\CPU\translate('my_page') }}
                                </a>
                            </div>
                        </li>
                        <hr>
                        <li class="nav-item">
                            <div class="d-flex">
                                <svg width="25px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#ff0000">
                                    <g id="SVGRepo_bgCarrier" stroke-width="0"/>
                                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>
                                    <g id="SVGRepo_iconCarrier"> <path d="M8.90002 7.55999C9.21002 3.95999 11.06 2.48999 15.11 2.48999H15.24C19.71 2.48999 21.5 4.27999 21.5 8.74999V15.27C21.5 19.74 19.71 21.53 15.24 21.53H15.11C11.09 21.53 9.24002 20.08 8.91002 16.54" stroke="#ff0000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/> <path d="M15 12H3.62" stroke="#ff0000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/> <path d="M5.85 8.6499L2.5 11.9999L5.85 15.3499" stroke="#ff0000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/> </g>
                                </svg>
                                <a class="dropdown-item pr-2" href="{{ route('customer.auth.logout') }}"
                                    style="font-weight:600">
                                    {{ \App\CPU\translate('Sign out') }}
                                </a>
                            </div>
                        </li>


                    </ul>

                </div>
            </div>
        </div>
    </nav>

</header>

<script>
    function myFunction() {
        $('#anouncement').addClass('d-none').removeClass('d-flex')
    }

    function get_cate() {

        $('.categoryUl').css('display', 'block');
        // console.log('good');

    }

    function hide_cate() {

        $('.categoryUl').css('display', 'none');
        // console.log('good');

    }
</script>
