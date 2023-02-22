@extends('layouts.front-end.app')



@section('title', \App\CPU\translate('Welcome To') . ' ' . $web_config['name']->value)



@push('css_or_js')

    <meta property="og:image" content="{{ asset('storage/app/public/company') }}/{{ $web_config['web_logo']->value }}" />

    <meta property="og:title" content="Welcome To {{ $web_config['name']->value }} Home" />

    <meta property="og:url" content="{{ env('APP_URL') }}">

    <meta property="og:description" content="{!! substr($web_config['about']->value, 0, 100) !!}">



    <meta property="twitter:card" content="{{ asset('storage/app/public/company') }}/{{ $web_config['web_logo']->value }}" />

    <meta property="twitter:title" content="Welcome To {{ $web_config['name']->value }} Home" />

    <meta property="twitter:url" content="{{ env('APP_URL') }}">

    <meta property="twitter:description" content="{!! substr($web_config['about']->value, 0, 100) !!}">



    <link rel="stylesheet" href="{{ asset('public/assets/front-end') }}/css/home.css" />

    <style>

        body{

            font-family: 'Cairo', sans-serif !important;

        }

        .media {

            background: white;

        }



        .section-header {

            display: flex;

            justify-content: space-between;

        }



        .cz-countdown-days {

            color: white !important;

            background-color: #ffffff30;

            border: .5px solid{{ $web_config['primary_color'] }};

            padding: 0px 6px;

            border-radius: 3px;

            margin-right: 0px !important;

            display: flex;

            flex-direction: column;

            -ms-flex: .4;

            /* IE 10 */

            flex: 1;



        }



        .cz-countdown-hours {

            color: white !important;

            background-color: #ffffff30;

            border: .5px solid{{ $web_config['primary_color'] }};

            padding: 0px 6px;

            border-radius: 3px;

            margin-right: 0px !important;

            display: flex;

            flex-direction: column;

            -ms-flex: .4;

            /* IE 10 */

            flex: 1;

        }



        .cz-countdown-minutes {

            color: white !important;

            background-color: #ffffff30;

            border: .5px solid{{ $web_config['primary_color'] }};

            padding: 0px 6px;

            border-radius: 3px;

            margin-right: 0px !important;

            display: flex;

            flex-direction: column;

            -ms-flex: .4;

            /* IE 10 */

            flex: 1;

        }



        .cz-countdown-seconds {

            color: white !important;

            background-color: #ffffff30;

            border: .5px solid{{ $web_config['primary_color'] }};

            padding: 0px 6px;

            border-radius: 3px;

            display: flex;

            flex-direction: column;

            -ms-flex: .4;

            /* IE 10 */

            flex: 1;

        }



        .flash_deal_product_details .flash-product-price {

            font-weight: 700;

            font-size: 18px;

            color: {{ $web_config['primary_color'] }};

        }



        .featured_deal_left {

            height: 130px;

            background: {{ $web_config['primary_color'] }} 0% 0% no-repeat padding-box;

            padding: 10px 13px;

            text-align: center;

        }



        .category_div:hover {

            color: {{ $web_config['secondary_color'] }};

        }



        .deal_of_the_day {

            /* filter: grayscale(0.5); */

            /* opacity: .8; */

            background: {{ $web_config['secondary_color'] }};

            border-radius: 3px;

        }



        .deal-title {

            font-size: 12px;



        }



        .for-flash-deal-img img {

            max-width: none;

        }



        .best-selleing-image {

            background: {{ $web_config['primary_color'] }}10;

            width: 30%;

            display: flex;

            align-items: center;

            border-radius: 5px;

        }



        .best-selling-details {

            padding: 10px;

            width: 50%;

        }



        .top-rated-image {

            background: {{ $web_config['primary_color'] }}10;

            width: 30%;

            display: flex;

            align-items: center;

            border-radius: 5px;

        }



        .top-rated-details {

            padding: 10px;

            width: 70%;

        }



        @media (max-width: 375px) {

            .cz-countdown {

                display: flex !important;



            }



            .cz-countdown .cz-countdown-seconds {



                margin-top: -5px !important;

            }



            .for-feature-title {

                font-size: 20px !important;

            }

        }



        @media (max-width: 600px) {

            .flash_deal_title {

                /*font-weight: 600;*/

                /*font-size: 18px;*/

                /*text-transform: uppercase;*/



                font-weight: 700;

                font-size: 25px;

                text-transform: uppercase;

            }



            .cz-countdown .cz-countdown-value {

                /* font-family: "Roboto", sans-serif; */

                font-size: 11px !important;

                font-weight: 700 !important;



            }



            .featured_deal {

                opacity: 1 !important;

            }



            .cz-countdown {

                display: inline-block;

                flex-wrap: wrap;

                font-weight: normal;

                margin-top: 4px;

                font-size: smaller;

            }



            .view-btn-div-f {



                margin-top: 6px;

                float: right;

            }



            .view-btn-div {

                float: right;

            }



            .viw-btn-a {

                font-size: 10px;

                font-weight: 600;

            }





            .for-mobile {

                display: none;

            }



            .featured_for_mobile {

                max-width: 100%;

                margin-top: 20px;

                margin-bottom: 20px;

            }



            .best-selleing-image {

                width: 50%;

                border-radius: 5px;

            }



            .best-selling-details {

                width: 50%;

            }



            .top-rated-image {

                width: 50%;

            }



            .top-rated-details {

                width: 50%;

            }

        }





        @media (max-width: 360px) {

            .featured_for_mobile {

                max-width: 100%;

                margin-top: 10px;

                margin-bottom: 10px;

            }



            .featured_deal {

                opacity: 1 !important;

            }

        }



        @media (max-width: 375px) {

            .featured_for_mobile {

                max-width: 100%;

                margin-top: 10px;

                margin-bottom: 10px;

            }



            .featured_deal {

                opacity: 1 !important;

            }



        }



        @media (min-width: 768px) {

            .displayTab {

                display: block !important;

            }



        }



        @media (max-width: 800px) {



            .latest-product-margin {

                margin-left: 0px !important;

            }



            .for-tab-view-img {

                width: 40%;

            }



            .for-tab-view-img {

                width: 105px;

            }



            .widget-title {

                font-size: 19px !important;

            }



            .flash-deal-view-all-web {

                display: none !important;

            }



            .categories-view-all {

                {{ session('direction') === 'rtl' ? 'margin-left: 10px;' : 'margin-right: 6px;' }}

            }



            .categories-title {

                {{ Session::get('direction') === 'rtl' ? 'margin-right: 0px;' : 'margin-left: 6px;' }}

            }



            .seller-list-title {

                {{ Session::get('direction') === 'rtl' ? 'margin-right: 0px;' : 'margin-left: 10px;' }}

            }



            .seller-list-view-all {

                {{ Session::get('direction') === 'rtl' ? 'margin-left: 20px;' : 'margin-right: 10px;' }}

            }



            .seller-card {

                padding-left: 0px !important;

            }



            .category-product-view-title {

                {{ Session::get('direction') === 'rtl' ? 'margin-right: 16px;' : 'margin-left: -8px;' }}

            }



            .category-product-view-all {

                {{ Session::get('direction') === 'rtl' ? 'margin-left: -7px;' : 'margin-right: 5px;' }}

            }



            .recomanded-product-card {

                background: #F8FBFD;

                margin: 20px;

                height: 535px;

                border-radius: 5px;

            }



            .recomanded-buy-button {

                text-align: center;

                margin-top: 30px;

            }

        }



        @media(min-width:801px) {

            .flash-deal-view-all-mobile {

                display: none !important;

            }



            .categories-view-all {

                {{ session('direction') === 'rtl' ? 'margin-left: 30px;' : 'margin-right: 27px;' }}

            }



            .categories-title {

                {{ Session::get('direction') === 'rtl' ? 'margin-right: 25px;' : 'margin-left: 25px;' }}

            }



            .seller-list-title {

                {{ Session::get('direction') === 'rtl' ? 'margin-right: 6px;' : 'margin-left: 10px;' }}

            }



            .seller-list-view-all {

                {{ Session::get('direction') === 'rtl' ? 'margin-left: 12px;' : 'margin-right: 10px;' }}

            }



            .seller-card {

                {{ Session::get('direction') === 'rtl' ? 'padding-left:0px !important;' : 'padding-right:0px !important;' }}

            }



            .category-product-view-title {

                {{ Session::get('direction') === 'rtl' ? 'margin-right: 10px;' : 'margin-left: -12px;' }}

            }



            .category-product-view-all {

                {{ Session::get('direction') === 'rtl' ? 'margin-left: -20px;' : 'margin-right: 0px;' }}

            }



            .recomanded-product-card {

                background: #F8FBFD;

                margin: 20px;

                height: 475px;

                border-radius: 5px;

            }



            .recomanded-buy-button {

                text-align: center;

                margin-top: 63px;

            }



        }



        .featured_deal_carosel .carousel-inner {

            width: 100% !important;

        }



        .badge-style2 {

            color: black !important;

            background: transparent !important;

            font-size: 11px;

        }



        .countdown-card {

            background: {{ $web_config['primary_color'] }}10;

            height: 150px !important;

            border-radius: 5px;



        }



        .flash-deal-text {

            color: {{ $web_config['primary_color'] }};

            text-transform: uppercase;

            text-align: center;

            font-weight: 700;

            font-size: 20px;

            border-radius: 5px;

            margin-top: 25px;

        }



        .countdown-background {

            background: {{ $web_config['primary_color'] }};

            padding: 5px 5px;

            border-radius: 5px;

            margin-top: 15px;

        }



        .carousel-wrap {

            position: relative;

        }



        .owl-nav {

            top: 40%;

            position: absolute;

            display: flex;

            justify-content: space-between;

            width: 100%;

        }

        }



        .owl-prev {

            float: left;



        }



        .owl-next {

            float: right;

        }



        .czi-arrow-left {

            color: {{ $web_config['primary_color'] }};

            background: {{ $web_config['primary_color'] }}10;

            padding: 5px;

            border-radius: 50%;

            margin-left: -12px;

            font-weight: bold;

            font-size: 12px;

        }



        .czi-arrow-right {

            color: {{ $web_config['primary_color'] }};

            background: {{ $web_config['primary_color'] }}10;

            padding: 5px;

            border-radius: 50%;

            margin-right: -15px;

            font-weight: bold;

            font-size: 12px;

        }



        .owl-carousel .nav-btn .czi-arrow-left {

            height: 47px;

            position: absolute;

            width: 26px;

            cursor: pointer;

            top: 100px !important;

        }



        .flash-deals-background-image {

            background: {{ $web_config['primary_color'] }}10;

            border-radius: 5px;

            width: 125px;

            height: 125px;

        }



        .view-all-text {

            color: {{ $web_config['secondary_color'] }} !important;

            font-size: 14px;

        }



        .feature-product-title {

            text-align: center;

            font-size: 22px;

            margin-top: 15px;

            font-style: normal;

            font-weight: 700;

        }



        .feature-product .czi-arrow-left {

            color: {{ $web_config['primary_color'] }};

            background: {{ $web_config['primary_color'] }}10;

            padding: 5px;

            border-radius: 50%;

            margin-left: -80px;

            font-weight: bold;

            font-size: 12px;

        }



        .feature-product .owl-nav {

            top: 40%;

            position: absolute;

            display: flex;

            justify-content: space-between;

            /* width: 100%; */

        }



        .feature-product .czi-arrow-right {

            color: {{ $web_config['primary_color'] }};

            background: {{ $web_config['primary_color'] }}10;

            padding: 5px;

            border-radius: 50%;

            margin-right: -80px;

            font-weight: bold;

            font-size: 12px;

        }



        .shipping-policy-web {

            background: #ffffff;

            width: 100%;

            border-radius: 5px;

        }



        .shipping-method-system {

            height: 130px;

            width: 70%;

            margin-top: 15px;

        }



        .flex-between {

            display: flex;

            justify-content: space-between;

        }

    </style>

    <style>

        .search-list {

            position: absolute;

            width: 100%;

            z-index: 8;

            background: #ffffff;

            border: 1px solid #ebebeb;

            box-shadow: 0 0 40px #00000014;

            border-radius: 23px;

            top: 55px;

            right: 0;

            max-height: 300px;

            overflow-y: scroll;

            padding: 12px 18px;

            display: none;

        }



        .search-list ul li {

            display: flex;

            justify-content: space-between;

            margin: 14px 0;

            cursor: pointer;

        }

    </style>



    <link rel="stylesheet" href="{{ asset('public/assets/front-end') }}/css/owl.carousel.min.css" />

    <link rel="stylesheet" href="{{ asset('public/assets/front-end') }}/css/owl.theme.default.min.css" />

@endpush



@section('content')



    <section class="container rtl" style="margin-top: 8%;position: relative;">

        <input type="text" class="form-control rounded-pill pr-3" autocomplete="false"

            onfocus="search_result_show()" onblur="search_result_hide()" id="search-input" placeholder="{{App\CPU\translate('Search')}}">

        <div class="search-list" id="searchresult" style="position: absolute;">



        </div>

    </section>



    <!-- Hero (Banners + Slider)-->

    <section style="margin-top:1rem" class="bg-transparent mb-3">

        <div class="container">

            <div class="row ">

                <div class="col-12">

                    @include('web-views.partials._home-top-slider')

                </div>

            </div>

        </div>

    </section>





    {{-- {{dd(App\CPU\Helpers::get_customer())}} --}}



    <div class="container">

        <div class="row" style="margin-top:2rem">

            <section class="col-md-3" style="text-align:center">



                @if (auth('customer')->check())

                    <a href="{{ route('customer.wishlist') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{asset('public/images/wishlist.png')}}" alt="" width="24" height="24">

                        {{-- <i class="fa fa-heart-o"></i> --}}

                    </a>

                @else

                    <a href="{{ route('customer.auth.login') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{ asset('images/wishlist.png') }}" alt="" width="24" height="24">

                    </a>

                @endif

                <p style="margin-top:1rem;font-weight:700">{{ __('messages.WISHLIST') }}</p>

            </section>



            <section class="col-md-3" style="text-align:center">



                @if (auth('customer')->check())

                    <a href="{{ route('hot.sales.pro') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{asset('public/images/hotsales.png')}}" alt="" width="24" height="24">

                        {{-- <i class="fa fa-fire"></i> --}}

                    </a>

                @else

                    <a href="{{ route('customer.auth.login') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{ asset('images/hotsales.png') }}" alt="" width="24" height="24">

                    </a>

                @endif



                <p style="margin-top:1rem;font-weight:700">{{ __('messages.rate_purchasing') }}</p>

            </section>





            <section class="col-md-3" style="text-align:center">



                @if (auth('customer')->check())

                    <a href="{{ route('hot-offers') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{asset('public/images/offers.png')}}" alt="" width="24" height="24">

                        {{-- <i class="fa fa-percent"></i> --}}

                    </a>

                @else

                    <a href="{{ route('customer.auth.login') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{ asset('images/offers.png') }}" alt="" width="24" height="24">

                    </a>

                @endif

                <p style="margin-top:1rem;font-weight:700">{{ __('messages.hot_offers') }}</p>

            </section>





            <section class="col-md-3" style="text-align:center">



                @if (auth('customer')->check())

                    <a href="{{ route('my.last.orders') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{asset('public/images/last_orders.png')}}" alt="" width="24" height="24">

                        {{-- <i class="fa fa-undo"></i> --}}

                    </a>

                @else

                    <a href="{{ route('customer.auth.login') }}" class="col-6"

                        style="box-shadow:0 5px 5px #00000014;border-radius:50%;padding:12px">

                        <img src="{{ asset('images/last_orders.png') }}" alt="" width="24" height="24">

                    </a>

                @endif

                <p style="margin-top:1rem;font-weight:700">{{ __('messages.latest_orders') }}</p>

            </section>

        </div>

    </div>





    {{-- brands --}}

    <section class="container rtl mt-3">

        <!-- Heading-->

        <div class="section-header">

            <div style="color: black;font-weight: 700;

            font-size: 22px;">

                <span> {{ \App\CPU\translate('brands') }}</span>

            </div>

            <div style="margin-right:2px;">

                <a class="text-capitalize view-all-text" href="{{ route('brands') }}"  style="color: #645cb3 !important;">

                    {{ \App\CPU\translate('view_all') }}

                    <i

                        class="czi-arrow-{{ Session::get('direction') === 'rtl' ? 'left-circle mr-1 ml-n1 mt-1 float-left' : 'right-circle ml-1 mr-n1' }}"></i>

                </a>

            </div>

        </div>

        {{-- <hr class="view_border"> --}}

        <!-- Grid-->



        <div class="mt-3 mb-3 brand-slider">

            <div class="owl-carousel owl-theme p-2" id="brands-slider">

                @foreach (\App\Model\Brand::latest()->get() as $brand)

                    <div class="text-center">

                        <a href="{{ route('brand.products', ['id' => $brand]) }}">

                            <div class="d-flex align-items-center justify-content-center" style="height:100px;margin:5px;">

                                <img style="border-radius: 45%;"

                                    onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"

                                    src="{{ asset('public/brand/' . $brand->image) }}" draggable="false"

                                    alt="{{ $brand->name }}">

                            </div>

                        </a>

                    </div>

                @endforeach

            </div>

        </div>

    </section>



    <!-- Products grid (featured products)-->





    {{-- featured deal --}}



    {{-- @php(

        $featured_deals = \App\Model\FlashDeal::with([

            'products' => function ($query_one) {

                $query_one->with('product.reviews')->whereHas('product', function ($query_two) {

                    $query_two->where('status', 1);

                });

            },

        ])->where(['status' => 1])->where(['deal_type' => 'feature_deal'])->first()

    ) --}}



    {{-- @if (isset($featured_deals))

        <section class="container featured_deal rtl mb-2">

            <div class="row"

                style="background: {{ $web_config['primary_color'] }};padding:5px;padding-bottom: 25px; border-radius:5px;">

                <div class="col-12 pb-2">

                    <a class="text-capitalize mt-2 mt-md-0 {{ Session::get('direction') === 'rtl' ? 'float-left' : 'float-right' }}"

                        href="{{ route('products', ['data_from' => 'featured_deal']) }}"

                        style="color: white !important;{{ Session::get('direction') === 'rtl' ? 'margin-left: 21px;' : 'margin-right: 21px;' }}">

                        {{ \App\CPU\translate('view_all') }}

                        <i

                            class="czi-arrow-{{ Session::get('direction') === 'rtl' ? 'left-circle mr-1 ml-n1 mt-1 float-left' : 'right-circle ml-1 mr-n1' }}"></i>

                    </a>

                </div>

                <div class="col-xl-3 col-md-4 d-flex align-items-center justify-content-center right">

                    <div class="m-4">

                        <span class="featured_deal_title"

                            style="padding-top: 12px">{{ \App\CPU\translate('featured_deal') }}</span>

                        <br>



                        <span

                            style="color: white;text-align: left !important;">{{ \App\CPU\translate('See the latest deals and exciting new offers ') }}!</span>



                    </div>



                </div>



                <div

                    class="col-xl-9 col-md-8 d-flex align-items-center justify-content-center {{ Session::get('direction') === 'rtl' ? 'pl-4' : 'pr-4' }}">

                    <div class="owl-carousel owl-theme" id="web-feature-deal-slider">

                        @foreach ($featured_deals->products as $key => $product)

                            @include('web-views.partials._feature-deal-product', [

                                'product' => $product->product,

                            ])

                        @endforeach

                    </div>

                </div>

            </div>

        </section>

    @endif --}}







    @php(

        $main_section_banner = \App\Model\Banner::where('banner_type', 'Main Section Banner')->where('published', 1)->orderBy('id', 'desc')->latest()->first()

    )

    @if (isset($main_section_banner))

        <div class="container rtl mb-3">

            <div class="row">

                <div class="col-12 pl-0 pr-0">

                    <a href="{{ $main_section_banner->url }}" style="cursor: pointer;">

                        <img class="d-block footer_banner_img"

                            style="width: 100%;border-radius: 5px;height: auto !important;"

                            onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"

                            src="{{ asset('storage/app/public/banner') }}/{{ $main_section_banner['photo'] }}">

                    </a>

                </div>

            </div>

        </div>

    @endif



    {{-- Banner  --}}



    <div class="container rtl mt-3 mb-3">

        <div class="row">

            @foreach (\App\Model\Banner::where('banner_type', 'Footer Banner')->where('published', 1)->orderBy('id', 'desc')->take(2)->get() as $banner)

                <div class="col-md-6 mt-2 mt-md-0">

                    <a href="{{ $banner->url }}" style="cursor: pointer;">

                        <img class="" style="width: 100%; border-radius:5px;height:auto;"

                            onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"

                            src="{{ asset('storage/app/public/banner') }}/{{ $banner['photo'] }}">

                    </a>

                </div>

            @endforeach

        </div>

    </div>





    {{-- Categorized product --}}

    @php($getCate = App\Model\Category::withCount('hasProducts')->where('home_status',0)->get())



    @include('web-views.partials.categorized_product',['getCate' => $getCate])

    <?php

        $category_1 = App\Model\Category::withCount('hasProducts')->where('home_status',1)->where('priority',1)->first();

        if($category_1 != null){

            $sub_category_1 = DB::table('subs_categories')->where('parent_id',$category_1->id)->get();

        }



        $category_2 = App\Model\Category::withCount('hasProducts')->where('home_status',1)->where('priority',2)->first();

        if($category_2 != null){

            $sub_category_2 = DB::table('subs_categories')->where('parent_id',$category_2->id)->get();

        }



        $category_3 = App\Model\Category::withCount('hasProducts')->where('home_status',1)->where('priority',3)->first();

        if($category_3 != null){

            $sub_category_3 = DB::table('subs_categories')->where('parent_id',$category_3->id)->get();

        }

        $category_4 = App\Model\Category::withCount('hasProducts')->where('home_status',1)->where('priority',4)->first();

        if($category_4 != null){

            $sub_category_4 = DB::table('subs_categories')->where('parent_id',$category_4->id)->get();

        }

    ?>





    @if ($category_1)

        @include('web-views.partials.category_sub_category',['sub_category' => $sub_category_1,'category' => $category_1])

        @include('web-views.partials.oneCategory_products',['category' => $category_1])

    @endif



    @if ($category_2)

        @include('web-views.partials.category_sub_category',['sub_category' => $sub_category_2,'category' => $category_2])

        @include('web-views.partials.oneCategory_products',['category' => $category_2])

    @endif



    @if ($category_3)

        @include('web-views.partials.category_sub_category',['sub_category' => $sub_category_3,'category' => $category_3])

        @include('web-views.partials.oneCategory_products',['category' => $category_3])

    @endif



    @if ($category_4)

        @include('web-views.partials.category_sub_category',['sub_category' => $sub_category_4,'category' => $category_4])

        @include('web-views.partials.oneCategory_products',['category' => $category_4])

    @endif



    {{-- <div class="container rtl mt-3 mb-3">



        <div class="category-product-view-title">

            <span class="for-feature-title float-right" style="font-weight: 700;font-size: 20px;text-transform: uppercase;text-align:right;">

                {{ $category->name }}

            </span>

        </div>

        <div class="row">

            @foreach ($sub_category as $sub)

                <div class="col-lg-1 col-md-2 col-6">

                    <div class="card">

                        <div class="card-body">

                            <div>

                                <img src="{{$sub->icon}}" alt="{{$sub->name}}">

                            </div>

                            <div>

                                <h5>{{$sub->name}}</h5>

                            </div>

                        </div>

                    </div>

                </div>

            @endforeach

        </div>

    </div> --}}





@endsection



@push('script')

    {{-- Owl Carousel --}}

    <script src="{{ asset('public/assets/front-end') }}/js/owl.carousel.min.js"></script>



    <script>



        function search_result_show(){

            $('#searchresult').slideDown();

        }

        function search_result_hide(){

            $('#searchresult').slideUp();

        }

        $("#search-input").on('keyup',function(){

            let name = $(this).val();

            console.log(name.length);

            if(name.length > 0){

                $.ajax({

                        url: "{{ route('customer.search.products') }}",

                        data: {

                            name:name

                        },

                        method: 'get',

                        beforSend: function(request){

                            return request.setReuestHeader('X-CSRF-Token',("meta[name='csrf_token']"))

                        },

                        success: function(result){

                            console.log(result);

                            $('#searchresult').html(result)

                        }

                    });

            }

            if(name.length < 1){

                $('#searchresult').html('')

            }

        });



        $(document).ready(function(){

        });



        $('.addWhishlist').click(function (e) {

            e.preventDefault();

            let product_id = $(this).data('product_id');



            $.ajaxSetup({

                headers: {

                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')

                }

            });



            $.post(

                "{{ route('customers.wishlists.store') }}",

                {

                    product_id: product_id

                }

            ).done(function(res){

                // console.log(res);

                // $('#wishlist'+product_id).html(`<button href="#" class="btn for-hover-bg removeWhishlist"

                //                                     data-product_id="${product_id}"

                //                                     data-wishlist_id="${res.id}" >

                //                                     <i class="fa fa-heart " style="color:#645cb3;font-size: 18px;" aria-hidden="true"></i>

                //                                 </button>`);

                window.top.location = window.top.location



            }).fail(function(res){

                $('#image-input-error').text(res.responseJSON.message);

            });



        });



        $('.removeWhishlist').click(function (e) {

            e.preventDefault();

            let product_id = $(this).data('product_id');

            let wishlist_id = $(this).data('wishlist_id');



            $.ajaxSetup({

                headers: {

                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')

                }

            });



            $.post(

                "{{ route('customers.wishlists.delete') }}",

                {

                    wishlist_id: wishlist_id

                }

            ).done(function(res){

                // $('#wishlist'+product_id).html(`<button href="#" class="btn for-hover-bg addWhishlist"

                //                                     data-product_id="${product_id}">

                //                                     <i class="fa fa-heart-o " style="color:#645cb3;font-size: 18px;" aria-hidden="true"></i>

                //                                 </button>`);

                window.top.location = window.top.location







            }).fail(function(res){

                $('#image-input-error').text(res.responseJSON.message);

            });



        });



        $('#flash-deal-slider').owlCarousel({

            loop: false,

            autoplay: false,

            margin: 5,

            nav: true,

            navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],

            dots: false,

            autoplayHoverPause: true,

            '{{ session('direction') }}': false,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 1

                },

                360: {

                    items: 1

                },

                375: {

                    items: 1

                },

                540: {

                    items: 2

                },

                //Small

                576: {

                    items: 2

                },

                //Medium

                768: {

                    items: 2

                },

                //Large

                992: {

                    items: 2

                },

                //Extra large

                1200: {

                    items: 2

                },

                //Extra extra large

                1400: {

                    items: 3

                }

            }

        })



        $('#web-feature-deal-slider').owlCarousel({

            loop: false,

            autoplay: true,

            margin: 5,

            nav: false,

            //navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],

            dots: false,

            autoplayHoverPause: true,

            '{{ session('direction') }}': true,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 1

                },

                360: {

                    items: 1

                },

                375: {

                    items: 1

                },

                540: {

                    items: 2

                },

                //Small

                576: {

                    items: 2

                },

                //Medium

                768: {

                    items: 2

                },

                //Large

                992: {

                    items: 2

                },

                //Extra large

                1200: {

                    items: 2

                },

                //Extra extra large

                1400: {

                    items: 2

                }

            }

        })



        $('#new-arrivals-product').owlCarousel({

            loop: true,

            autoplay: false,

            margin: 5,

            nav: true,

            navText: ["<i class='czi-arrow-{{ Session::get('direction') === 'rtl' ? 'right' : 'left' }}'></i>",

                "<i class='czi-arrow-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}'></i>"

            ],

            dots: false,

            autoplayHoverPause: true,

            '{{ session('direction') }}': true,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 1

                },

                360: {

                    items: 1

                },

                375: {

                    items: 1

                },

                540: {

                    items: 2

                },

                //Small

                576: {

                    items: 2

                },

                //Medium

                768: {

                    items: 2

                },

                //Large

                992: {

                    items: 2

                },

                //Extra large

                1200: {

                    items: 4

                },

                //Extra extra large

                1400: {

                    items: 4

                }

            }

        })

    </script>

    <script>

        $(".products-carousel").owlCarousel();

        $('#featured_products_list').owlCarousel({

            loop: true,

            autoplay: false,

            margin: 5,

            nav: true,

            navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],

            dots: false,

            autoplayHoverPause: true,

            '{{ session('direction') }}': false,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 1

                },

                360: {

                    items: 1

                },

                375: {

                    items: 1

                },

                540: {

                    items: 2

                },

                //Small

                576: {

                    items: 2

                },

                //Medium

                768: {

                    items: 3

                },

                //Large

                992: {

                    items: 4

                },

                //Extra large

                1200: {

                    items: 5

                },

                //Extra extra large

                1400: {

                    items: 5

                }

            }

        });

    </script>

    <script>

        $('#brands-slider').owlCarousel({

            loop: false,

            autoplay: false,

            margin: 10,

            nav: false,

            '{{ session('direction') }}': true,

            //navText: ["<i class='czi-arrow-left'></i>","<i class='czi-arrow-right'></i>"],

            dots: true,

            autoplayHoverPause: true,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 2

                },

                360: {

                    items: 3

                },

                375: {

                    items: 3

                },

                540: {

                    items: 4

                },

                //Small

                576: {

                    items: 5

                },

                //Medium

                768: {

                    items: 7

                },

                //Large

                992: {

                    items: 9

                },

                //Extra large

                1200: {

                    items: 11

                },

                //Extra extra large

                1400: {

                    items: 12

                }

            }

        })

        $('.products_list').owlCarousel({

            loop: false,

            autoplay: false,

            margin: 10,

            nav: false,

            '{{ session('direction') }}': true,

            //navText: ["<i class='czi-arrow-left'></i>","<i class='czi-arrow-right'></i>"],

            dots: true,

            autoplayHoverPause: true,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 1

                },

                360: {

                    items: 1

                },

                375: {

                    items: 1

                },

                540: {

                    items: 2

                },

                //Small

                576: {

                    items: 2

                },

                //Medium

                768: {

                    items: 2

                },

                //Large

                992: {

                    items: 3

                },

                //Extra large

                1200: {

                    items: 4

                },

                //Extra extra large

                1400: {

                    items: 4

                }

            }

        })

    </script>



    <script>

        $('#category-slider, #top-seller-slider').owlCarousel({

            loop: false,

            autoplay: false,

            margin: 5,

            nav: false,

            // navText: ["<i class='czi-arrow-left'></i>","<i class='czi-arrow-right'></i>"],

            dots: true,

            autoplayHoverPause: true,

            '{{ session('direction') }}': true,

            // center: true,

            responsive: {

                //X-Small

                0: {

                    items: 2

                },

                360: {

                    items: 3

                },

                375: {

                    items: 3

                },

                540: {

                    items: 4

                },

                //Small

                576: {

                    items: 5

                },

                //Medium

                768: {

                    items: 6

                },

                //Large

                992: {

                    items: 8

                },

                //Extra large

                1200: {

                    items: 10

                },

                //Extra extra large

                1400: {

                    items: 11

                }

            }

        })

    </script>





    <script>

        $(document).ready(function() {



            $('.banner_get').click(function() {



                // alert('good');



                $('#modal').addClass("show");

                $('#modal').css("display", "block");

            });



            $('.check_banner').submit(function(e) {



                e.preventDefault();

                let formData = new FormData(this);





                $.ajax({

                    type: 'POST',

                    url: "{{ route('check.banner') }}",

                    data: formData,

                    contentType: false,

                    processData: false,

                    success: (response) => {

                        if (response.valid) {

                            this.reset();

                            Swal.fire(

                                'تم تفعيل الكود بنجاح',

                            )



                        } else if (response.lower_purchasing) {



                            this.reset();

                            Swal.fire(

                                'لم تبلغ حد الشراء الادني لتفعيل الكود',

                            )



                        } else {



                            this.reset();

                            Swal.fire(

                                'الكوبون منتهي الصلاحية',

                            )



                        }

                    },

                    error: function(response) {

                        $('#image-input-error').text(response.responseJSON.message);

                    }

                });

                console.log('good');



            });



        })

    </script>

    <script>
        $('.category_pro_add_cart').on('click',function(e){
            e.preventDefault();
            var form= $(this).closest('form');
            var data= form.serialize();
            var url= form.attr('action');
            $.ajax({
                url:url,
                type:'post',
                data:data,
                success:function(response){ 
                    Swal.fire(

                               'تم الاضافة الي السله بنجاح',

                            )
                }
            });
            
        });
    </script>

@endpush

