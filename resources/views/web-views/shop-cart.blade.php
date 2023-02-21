@extends('layouts.front-end.app')



@section('title',\App\CPU\translate('My Shopping Cart'))



@push('css_or_js')

    <meta property="og:image" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}"/>

    <meta property="og:title" content="{{$web_config['name']->value}} "/>

    <meta property="og:url" content="{{env('APP_URL')}}">

    <meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">



    <meta property="twitter:card" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}"/>

    <meta property="twitter:title" content="{{$web_config['name']->value}}"/>

    <meta property="twitter:url" content="{{env('APP_URL')}}">

    <meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <link rel="stylesheet" href="{{asset('public/assets/front-end')}}/css/shop-cart.css"/>



    <style>

        .text_header{

            font-family: 'Cairo' !important;

            font-size: 28px;

            color: #404040;

            font-weight: 500;

        }

        .pro-details{

            flex-direction: column;

            clear: both;

            text-align: start;

        }

        .input_cart{

            text-align: center;

            background-color: transparent;

            font-family: 'Cairo';

            width: 50% !important;

            padding: 0;

            position: absolute;

            left: 26px;

            height: 95%;

            border: none !important;

        }

        .qty_number{

            position: relative;

            display: flex;

            flex-direction: row;

            justify-content: space-between;

            background-color: #fafafa;

            border: 1px solid #e7e7e7;

            border-radius: 31px;

            height: 38px;

            width: 7rem !important;

        }

    </style>





@endpush



@section('content')

    <div class="container mb-5 rtl" style="margin-top: 8%;text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};" id="cart-summary">

        @include('layouts.front-end.partials.cart_details')

    </div>

@endsection



@push('script')

    <script>

        cartQuantityInitialize();

    </script>

@endpush

