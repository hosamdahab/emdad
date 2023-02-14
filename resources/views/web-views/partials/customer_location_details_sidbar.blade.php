<style>
    .widget-categories .accordion-heading > a:hover {
        color: #FFD5A4 !important;
    }

    .widget-categories .accordion-heading > a {
        color: #FFD5A4;
    }

    body {
        font-family: 'Titillium Web', sans-serif;
    }

    .card {
        border: none
    }

    .totals tr td {
        font-size: 13px
    }

    .product-qty span {
        font-size: 14px;
        color: #6A6A6A;
    }

    .spandHeadO {
        color: #FFFFFF !important;
        font-weight: 600 !important;
        font-size: 14px;

    }

    .tdBorder {
        border- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 1px solid #f7f0f0;
        text-align: center;
    }

    .bodytr {
        text-align: center;
        vertical-align: middle !important;
    }

    .sidebar h3:hover + .divider-role {
        border-bottom: 3px solid {{$web_config['primary_color']}}                                   !important;
        transition: .2s ease-in-out;
    }

    tr td {
        padding: 10px 8px !important;
    }

    td button {
        padding: 3px 13px !important;
    }

    @media (max-width: 600px) {
        .sidebar_heading {
            background: {{$web_config['primary_color']}};
        }

        .orderDate {
            display: none;
        }

        .sidebar_heading h1 {
            text-align: center;
            color: aliceblue;
            padding-bottom: 17px;
            font-size: 19px;
        }
    }


    .wallet {

        background:#fff;
        font-family: 'Cairo' !important;
        margin-top:6%;
    }


    .wallet-left-one {


        background-color:#f8f8f9;
        width:100%

    }


    .wallet-left-one {

        display:flex;
        justify-content:space-around;
        border-radius:10px;
        padding:20px 0 10px 0;
    }


    .wallet-left-one > div {

        text-align:center
    }


    .wallet-left-one > div p {

        font-weight:600;
        padding-top:10px
    }

    .wallet-left-one button {

        border:1px solid #ECEDEE;
        padding:15px;
        background:#fff;
        border-radius:10px
    }


    .wallet-left-two {

        background:#fff;
        border:1px solid #E4E9F2;
        border-radius:10px;
        margin-top:30px;
        text-align:right;
        padding:0 20px 0 20px;
    }

    .wallet-left-two > div {

        margin:25px 0;
    }

    #Account , #Locations , #locations, #building , #notifications , #terms_conditions , #terms_conditions, #privacy_police{

        display:none
    }

    .active-top {
        background: #645cb3 !important;
    }

    .active-top svg path{
        stroke: #fff !important;
    }
    .active-text{
        color: #645cb3;
    }

    .active-sidbar{
        background: #5044b8;
        border-radius: 16px;
        padding: 24px;
    }

    .active-sidbar strong a{
        color: #fff !important;
    }

    .active-sidbar svg > path{
        stroke: #fff;
    }
    .active-sidbar svg > rect{
        stroke: #fff;
    }
    .active-sidbar svg > g path{
        fill: #fff;
    }

    .font-style{
        font-weight: 600;
        font-size: 16px;
        margin: 0 12px;
        color: #404040;
    }




</style>

<section class="wallet-left-one">

    <div>
        <button class="account">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path _ngcontent-uop-c154="" d="M15.9997 15.9998C19.6816 15.9998 22.6663 13.0151 22.6663 9.33317C22.6663 5.65127 19.6816 2.6665 15.9997 2.6665C12.3178 2.6665 9.33301 5.65127 9.33301 9.33317C9.33301 13.0151 12.3178 15.9998 15.9997 15.9998Z" stroke="#6E7579" stroke-width="1.875" stroke-linecap="round" stroke-linejoin="round"></path><path _ngcontent-uop-c154="" d="M27.4535 29.3333C27.4535 24.1733 22.3202 20 16.0002 20C9.6802 20 4.54687 24.1733 4.54687 29.3333" stroke="#6E7579" stroke-width="1.875" stroke-linecap="round" stroke-linejoin="round"></path></svg>
        </button>
        <p class="account-p">{{App\CPU\translate('my_account')}}</p>
    </div>

    <div>
        <button class="locations">
            <svg width="33" height="32" viewBox="0 0 33 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path _ngcontent-uop-c154="" d="M16.4998 17.9064C18.7973 17.9064 20.6598 16.0439 20.6598 13.7464C20.6598 11.4489 18.7973 9.58643 16.4998 9.58643C14.2023 9.58643 12.3398 11.4489 12.3398 13.7464C12.3398 16.0439 14.2023 17.9064 16.4998 17.9064Z" stroke="#6E7579" stroke-width="1.875"></path><path _ngcontent-uop-c154="" d="M5.3266 11.3198C7.95327 -0.226826 25.0599 -0.213493 27.6733 11.3332C29.2066 18.1065 24.9933 23.8398 21.2999 27.3865C18.6199 29.9732 14.3799 29.9732 11.6866 27.3865C8.0066 23.8398 3.79327 18.0932 5.3266 11.3198Z" stroke="#6E7579" stroke-width="1.875"></path></svg>
        </button>
        <p class="locations-p">{{App\CPU\translate('Location')}}</p>
    </div>

    <div>
        <button class="building"><svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.667 29.3336L5.44029 29.3336C3.89362 29.3336 2.62695 28.0936 2.62695 26.5736L2.62695 6.78697C2.62695 3.29364 5.22695 1.70697 8.41362 3.26697L14.3336 6.17364C15.6136 6.8003 16.667 8.46697 16.667 9.8803L16.667 29.3336Z" stroke="#6E7579" stroke-width="1.875" stroke-linecap="round" stroke-linejoin="round"></path><path _ngcontent-uop-c154="" d="M29.2937 20.0802L29.2937 25.1202C29.2937 28.0002 27.9603 29.3336 25.0803 29.3336L16.667 29.3336L16.667 13.8936L17.2937 14.0269L23.2937 15.3736L26.0003 15.9736C27.7603 16.3602 29.2003 17.2669 29.2803 19.8269C29.2937 19.9069 29.2937 19.9869 29.2937 20.0802Z" stroke="#6E7579" stroke-width="1.875" stroke-linecap="round" stroke-linejoin="round"></path><path _ngcontent-uop-c154="" d="M7.33301 12L11.9597 12" stroke="#6E7579" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path _ngcontent-uop-c154="" d="M7.33301 17.3335L11.9597 17.3335" stroke="#6E7579" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path _ngcontent-uop-c154="" d="M23.293 15.3735L23.293 19.6669C23.293 21.3202 21.9463 22.6669 20.293 22.6669C18.6396 22.6669 17.293 21.3202 17.293 19.6669L17.293 14.0269L23.293 15.3735Z" stroke="#6E7579" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path _ngcontent-uop-c154="" d="M29.2796 19.8269C29.1996 21.4002 27.893 22.6669 26.293 22.6669C24.6396 22.6669 23.293 21.3202 23.293 19.6669L23.293 15.3735L25.9996 15.9735C27.7596 16.3602 29.1996 17.2669 29.2796 19.8269Z" stroke="#6E7579" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg></button>
        <p class="building-p">{{App\CPU\translate('building')}}</p>
    </div>

</section>


<section class="wallet-left-two">

    <div class="wallet_customer" style="padding: 12px 16px">
        <strong class="font-style">
            <a href="#" id="wallet_customer" class="text-decoration-none">{{App\CPU\translate('Wallet')}}</a>
        </strong>
        {{-- <img src="{{asset('images/notifications.svg')}}" alt="" style="background:#f0f4fc;padding:12px;border-radius:45%"> --}}
        <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M13 9H7" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M22 10.9699V13.03C22 13.58 21.56 14.0299 21 14.0499H19.0399C17.9599 14.0499 16.97 13.2599 16.88 12.1799C16.82 11.5499 17.0599 10.9599 17.4799 10.5499C17.8499 10.1699 18.36 9.94995 18.92 9.94995H21C21.56 9.96995 22 10.4199 22 10.9699Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M17.48 10.55C17.06 10.96 16.82 11.55 16.88 12.18C16.97 13.26 17.96 14.05 19.04 14.05H21V15.5C21 18.5 19 20.5 16 20.5H7C4 20.5 2 18.5 2 15.5V8.5C2 5.78 3.64 3.88 6.19 3.56C6.45 3.52 6.72 3.5 7 3.5H16C16.26 3.5 16.51 3.50999 16.75 3.54999C19.33 3.84999 21 5.76 21 8.5V9.95001H18.92C18.36 9.95001 17.85 10.17 17.48 10.55Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </div>

    <div class="customer_notifications" style="padding: 12px 16px">
        <strong class="font-style">
            <a href="#" id="customer_notifications" class="text-decoration-none">{{App\CPU\translate('Notifications')}}</a>
        </strong>
        {{-- <img src="{{asset('images/notifications.svg')}}" alt="" style="background:#f0f4fc;padding:12px;border-radius:45%"> --}}
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="30px" width="30px" version="1.1" id="Capa_1" viewBox="0 0 195.803 195.803" xml:space="preserve">
            <g>
                <g>
                    <g>
                        <path style="fill:#010002;" d="M195.803,104.175l-15.958-18.141l9.688-19.612l-19.494-9.616l1.525-23.685l-24.182-1.557     l-7.315-21.616l-20.915,7.086L104.173,0.002L86.504,15.541L65.146,4.991L54.939,25.648l-21.82-1.396L31.68,46.67L8.668,54.461     l7.716,22.769L0,91.628l14.315,16.277l-10.604,21.48l21.978,10.851l-1.442,22.457l21.552,1.385l7.383,21.777l22.887-7.748     l15.561,17.694l16.745-14.731l19.727,9.742l10.275-20.815l24.322,1.568l1.492-23.313l20.389-6.907l-7.125-21.033L195.803,104.175     z M158.303,143.743l-1.364,21.273l-22.268-1.424l-9.369,18.975l-17.898-8.84l-15.21,13.378l-14.208-16.162l-20.947,7.097     l-6.735-19.852l-19.512-1.249l1.306-20.414l-20.135-9.942l9.706-19.644L8.7,92.197l14.838-13.048l-7.054-20.829l21.083-7.143     l1.303-20.392l19.784,1.267l9.284-18.814l19.541,9.656l16.141-14.197l13.618,15.489l18.975-6.428l6.671,19.687l22.139,1.417     l-1.385,21.638l17.654,8.722L172.504,87l14.609,16.617L170.3,118.401l6.471,19.082L158.303,143.743z"/>
                    </g>
                    <g>
                        <path style="fill:#010002;" d="M120.707,90.797c-9.18,0-16.763,7.791-16.763,21.784c0.1,13.879,7.58,20.818,16.23,20.818     c8.868,0,16.552-7.258,16.552-21.895C136.73,98.27,130.431,90.797,120.707,90.797z M120.389,127.742     c-5.766,0-9.183-6.725-9.076-15.582c0-8.761,3.203-15.7,9.076-15.7c6.51,0,8.965,7.047,8.965,15.489     C129.354,121.121,126.584,127.742,120.389,127.742z"/>
                    </g>
                    <g>
                        <path style="fill:#010002;" d="M91.558,82.791c0-13.238-6.406-20.722-16.123-20.722c-9.183,0-16.763,7.802-16.763,21.681     c0.107,13.983,7.58,20.922,16.23,20.922C83.87,104.676,91.558,97.415,91.558,82.791z M66.144,83.432     c0-8.761,3.103-15.7,8.969-15.7c6.514,0,8.969,7.047,8.969,15.489c0,9.176-2.777,15.797-8.969,15.797     C69.247,99.014,65.93,92.29,66.144,83.432z"/>
                    </g>
                    <g>
                        <polygon style="fill:#010002;" points="115.049,62.07 74.258,133.829 80.234,133.829 121.03,62.07    "/>
                    </g>
                </g>
            </g>
        </svg>
    </div>

    <div class="customer_privacy_police" style="padding: 12px 16px">
        <strong class="font-style">
            <a href="#" id="customer_privacy_police" class="text-decoration-none">{{App\CPU\translate('privacy_policy')}}</a>
        </strong>
        {{-- <img src="{{asset('images/shield.svg')}}" alt="" style="background:#f0f4fc;padding:12px;border-radius:45%"> --}}
        <svg xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" viewBox="0 0 24 24" fill="none">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.7056 1.29136L12.7045 1.29032L12.7023 1.28812L12.6989 1.28483C12.6972 1.28313 12.6966 1.28263 12.6966 1.28263L12.6978 1.28374C12.7004 1.28627 12.703 1.28881 12.7056 1.29136ZM11.3022 1.28374C11.3002 1.28552 11.2961 1.28933 11.2896 1.29508C11.2719 1.31064 11.237 1.34044 11.1829 1.38252C11.0748 1.46665 10.8893 1.60023 10.6105 1.76751C10.0531 2.10195 9.12034 2.57246 7.68377 3.05132C6.21419 3.54118 5.25494 3.77921 4.67888 3.89442C4.39127 3.95194 4.20126 3.97843 4.09269 3.99049C4.0385 3.99651 4.00499 3.9989 3.99011 3.99977C3.98708 3.99995 3.98335 4.00014 3.98335 4.00014C3.43875 4.00903 3 4.45328 3 5V12C3 15.4464 5.28175 18.2003 7.3415 20.0026C8.39238 20.9221 9.43854 21.6408 10.22 22.1292C10.7159 22.4392 11.2047 22.7454 11.7564 22.9286C11.9145 22.9811 12.0855 22.9811 12.2436 22.9286C12.7953 22.7454 13.2841 22.4392 13.78 22.1292C14.5615 21.6408 15.6076 20.9221 16.6585 20.0026C18.7183 18.2003 21 15.4464 21 12V5C21 4.45327 20.5613 4.00902 20.0166 4.00014C20.0166 4.00014 20.0129 3.99995 20.0099 3.99977C19.995 3.9989 19.9615 3.99651 19.9073 3.99049C19.7987 3.97843 19.6087 3.95194 19.3211 3.89442C18.7451 3.77921 17.7858 3.54118 16.3162 3.05132C14.8797 2.57246 13.9469 2.10195 13.3895 1.76751C13.1107 1.60023 12.9252 1.46665 12.8171 1.38252C12.763 1.34044 12.7281 1.31064 12.7105 1.29508C12.7039 1.28933 12.6998 1.28552 12.6978 1.28374C12.3097 0.905419 11.6903 0.905419 11.3022 1.28374ZM12 3.25517C11.8933 3.32603 11.7735 3.40211 11.6395 3.48249C10.9469 3.89805 9.87966 4.42754 8.31623 4.94868C6.78581 5.45882 5.74506 5.72079 5.07112 5.85558C5.04695 5.86041 5.02325 5.86509 5 5.8696V12C5 14.5536 6.71825 16.7997 8.6585 18.4974C9.60762 19.3279 10.5615 19.9842 11.28 20.4333C11.5633 20.6103 11.8084 20.7541 12 20.8628C12.1916 20.7541 12.4367 20.6103 12.72 20.4333C13.4385 19.9842 14.3924 19.3279 15.3415 18.4974C17.2817 16.7997 19 14.5536 19 12V5.8696C18.9768 5.86509 18.953 5.86041 18.9289 5.85558C18.2549 5.72079 17.2142 5.45882 15.6838 4.94868C14.1203 4.42754 13.0531 3.89805 12.3605 3.48249C12.2265 3.40211 12.1067 3.32603 12 3.25517Z" fill="#000000"/>
        </svg>
    </div>


    <div class="customer_terms_conditions" style="padding: 12px 16px">
        <strong class="font-style">
            <a href="#" id="customer_terms_conditions" class="text-decoration-none">{{App\CPU\translate('terms_and_condition')}}</a>
        </strong>
        {{-- <img src="{{asset('images/info.svg')}}" alt="" style="background:#f0f4fc;padding:12px;border-radius:45%"> --}}
        <svg xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" viewBox="0 0 24 24" fill="none">
            <rect x="5" y="4" width="14" height="17" rx="2" stroke="#222222"/>
            <path d="M9 9H15" stroke="#222222" stroke-linecap="round"/>
            <path d="M9 13H15" stroke="#222222" stroke-linecap="round"/>
            <path d="M9 17H13" stroke="#222222" stroke-linecap="round"/>
        </svg>
    </div>


    <div style="padding: 12px 16px">
        <strong class="font-style">
            <a target="_blank" href="https://play.google.com/store/apps/details?id=com.emdad.yemenb2b" class="text-decoration-none">{{App\CPU\translate('download_app')}}</a>
        </strong>
        {{-- <img src="{{asset('images/arrow-down.svg')}}" alt="" style="background:#f0f4fc;padding:12px;border-radius:45%"> --}}
        <svg xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" viewBox="0 0 24 24" fill="none">
            <path d="M12.5 4V17M12.5 17L7 12.2105M12.5 17L18 12.2105" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M6 21H19" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </div>

</section>
