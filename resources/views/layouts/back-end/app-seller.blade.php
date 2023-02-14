<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="{{Session::get('direction')}}" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->

    <title>@yield('title')</title>
    <meta name="_token" content="{{csrf_token()}}">
    <!--to make http ajax request to https-->
    <!--    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">-->
    <!-- Favicon -->
    <link rel="shortcut icon" href="">
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;display=swap" rel="stylesheet">
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="{{asset('public/assets/back-end')}}/css/vendor.min.css">
    <link rel="stylesheet" href="{{asset('public/assets/back-end')}}/css/custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <link rel="stylesheet" href="{{asset('public/assets/back-end')}}/vendor/icon-set/style.css">
    <!-- CSS Front Template -->
    <link rel="stylesheet" href="{{asset('public/assets/back-end')}}/css/theme.minc619.css?v=1.0">
    @if(Session::get('direction') === "rtl")
        <link rel="stylesheet" href="{{asset('public/assets/back-end')}}/css/menurtl.css">
    @endif
    {{-- light box --}}
    <link rel="stylesheet" href="{{asset('public/css/lightbox.css')}}">
    @stack('css_or_js')
    <style>
        :root {
            --theameColor: #045cff;
        }
        
        .btn-primary{
            background: #645cb3;
            border:none;
        }
        .all-money{
            background: #645cb3;
            border:none;
        }

        .rtl {
            direction: {{ Session::get('direction') }};
        }
        .flex-start {
            display: flex;
            justify-content:flex-start;
        }
        .flex-end {
            display: flex;
            justify-content:flex-end;
        }
        .flex-between {
            display: flex;
            justify-content:space-between;
        }
        .row-reverse {
            display: flex;
            flex-direction: row-reverse;
        }
        .row-center {
            display: flex;
            justify-content:center;
        }

        .select2-results__options {
            text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};
        }

        .scroll-bar {
            max-height: calc(100vh - 100px);
            overflow-y: auto !important;
        }

        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 1px #cfcfcf;
            /*border-radius: 5px;*/
        }

        ::-webkit-scrollbar {
            width: 3px !important;
            height: 3px !important;
        }

        ::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            /*border-radius: 5px;*/
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #003638;
        }

        @media only screen and (max-width: 768px) {
            /* For mobile phones: */
            .map-warper {
                height: 250px;
                padding-bottom: 10px;
            }
        }

        .deco-none {
            color: inherit;
            text-decoration: inherit;
        }

        .qcont:first-letter {
            text-transform: capitalize
        }
    </style>
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 48px;
            height: 23px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 15px;
            width: 15px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #377dff;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #377dff;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }


        .employees_delete_form {

            display:inline
        }

    </style>
    <script src="{{asset('public/assets/back-end')}}/vendor/hs-navbar-vertical-aside/hs-navbar-vertical-aside-mini-cache.js"></script>
    <link rel="stylesheet" href="{{asset('public/assets/back-end')}}/css/toastr.css">
</head>

<body class="footer-offset">
<!-- Builder -->
@include('layouts.back-end.partials._front-settings')
<!-- End Builder -->
{{--loader--}}
<div class="row">
    <div class="col-12" style="margin-top:10rem;position: fixed;z-index: 9999;">
        <div id="loading" style="display: none;">
           <center>
            <img width="200"
                 src="{{asset('storage/app/public/company')}}/{{\App\CPU\Helpers::get_business_settings('loader_gif')}}"
                 onerror="this.src='{{asset('public/assets/front-end/img/loader.gif')}}'">
           </center>
        </div>
    </div>
</div>
{{--loader--}}
<!-- JS Preview mode only -->
@include('layouts.back-end.partials-seller._header')
@include('layouts.back-end.partials-seller._side-bar')

<!-- END ONLY DEV -->

<main id="content" role="main" class="main pointer-event" style="background-color: #F7F8FA">
    <!-- Content -->
@yield('content')
<!-- End Content -->

    <!-- Footer -->
@include('layouts.back-end.partials-seller._footer')
<!-- End Footer -->

    @include('layouts.back-end.partials-seller._modals')

</main>
<!-- ========== END MAIN CONTENT ========== -->

<!-- ========== END SECONDARY CONTENTS ========== -->
<script src="{{asset('public/assets/back-end')}}/js/custom.js"></script>
<!-- JS Implementing Plugins -->

@stack('script')


<!-- JS Front -->
<script src="{{asset('public/assets/back-end')}}/js/vendor.min.js"></script>
<script src="{{asset('public/assets/back-end')}}/js/theme.min.js"></script>
<script src="{{asset('public/assets/back-end')}}/js/sweet_alert.js"></script>
<script src="{{asset('public/assets/back-end')}}/js/toastr.js"></script>
<script src="{{ asset('public/js/main.js') }}"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
{!! Toastr::message() !!}

@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif
<!-- JS Plugins Init. -->
<script>
    $(document).on('ready', function () {
        // ONLY DEV
        // =======================================================
        if (window.localStorage.getItem('hs-builder-popover') === null) {
            $('#builderPopover').popover('show')
                .on('shown.bs.popover', function () {
                    $('.popover').last().addClass('popover-dark')
                });

            $(document).on('click', '#closeBuilderPopover', function () {
                window.localStorage.setItem('hs-builder-popover', true);
                $('#builderPopover').popover('dispose');
            });
        } else {
            $('#builderPopover').on('show.bs.popover', function () {
                return false
            });
        }
        // END ONLY DEV
        // =======================================================

        // BUILDER TOGGLE INVOKER
        // =======================================================
        $('.js-navbar-vertical-aside-toggle-invoker').click(function () {
            $('.js-navbar-vertical-aside-toggle-invoker i').tooltip('hide');
        });

        // INITIALIZATION OF MEGA MENU
        // =======================================================
        var megaMenu = new HSMegaMenu($('.js-mega-menu'), {
            desktop: {
                position: 'left'
            }
        }).init();


        // INITIALIZATION OF NAVBAR VERTICAL NAVIGATION
        // =======================================================
        var sidebar = $('.js-navbar-vertical-aside').hsSideNav();


        // INITIALIZATION OF TOOLTIP IN NAVBAR VERTICAL MENU
        // =======================================================
        $('.js-nav-tooltip-link').tooltip({boundary: 'window'})

        $(".js-nav-tooltip-link").on("show.bs.tooltip", function (e) {
            if (!$("body").hasClass("navbar-vertical-aside-mini-mode")) {
                return false;
            }
        });


        // INITIALIZATION OF UNFOLD
        // =======================================================
        $('.js-hs-unfold-invoker').each(function () {
            var unfold = new HSUnfold($(this)).init();
        });


        // INITIALIZATION OF FORM SEARCH
        // =======================================================
        $('.js-form-search').each(function () {
            new HSFormSearch($(this)).init()
        });


        // INITIALIZATION OF SELECT2
        // =======================================================
        $('.js-select2-custom').each(function () {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });


        // INITIALIZATION OF DATERANGEPICKER
        // =======================================================
        $('.js-daterangepicker').daterangepicker();

        $('.js-daterangepicker-times').daterangepicker({
            timePicker: true,
            startDate: moment().startOf('hour'),
            endDate: moment().startOf('hour').add(32, 'hour'),
            locale: {
                format: 'M/DD hh:mm A'
            }
        });

        var start = moment();
        var end = moment();

        function cb(start, end) {
            $('#js-daterangepicker-predefined .js-daterangepicker-predefined-preview').html(start.format('MMM D') + ' - ' + end.format('MMM D, YYYY'));
        }

        $('#js-daterangepicker-predefined').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end);


        // INITIALIZATION OF CLIPBOARD
        // =======================================================
        $('.js-clipboard').each(function () {
            var clipboard = $.HSCore.components.HSClipboard.init(this);
        });
    });
</script>

@stack('script_2')


<script src="{{asset('public/assets/back-end')}}/js/bootstrap.min.js"></script>
{{-- light box --}}
<script src="{{asset('public/js/lightbox.min.js')}}"></script>
<audio id="myAudio">
    <source src="{{asset('public/assets/back-end/sound/notification.mp3')}}" type="audio/mpeg">
</audio>
<script>
    var audio = document.getElementById("myAudio");

    function playAudio() {
        audio.play();
    }

    function pauseAudio() {
        audio.pause();
    }
</script>
<script>
    setInterval(function () {
        $.get({
            url: '{{route('seller.get-order-data')}}',
            dataType: 'json',
            success: function (response) {
                let data = response.data;
                if (data.new_order > 0) {
                    playAudio();
                    $('#popup-modal').appendTo("body").modal('show');
                }
            },
        });
    }, 10000);

    function check_order() {
        location.href = '{{route('seller.orders.list',['status'=>'all'])}}';
    }
</script>

<script>
    $("#search-bar-input").keyup(function () {
        $("#search-card").css("display", "block");
        let key = $("#search-bar-input").val();
        if (key.length > 0) {
            $.get({
                url: '{{url('/')}}/admin/search-function/',
                dataType: 'json',
                data: {
                    key: key
                },
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#search-result-box').empty().html(data.result)
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        } else {
            $('#search-result-box').empty();
        }
    });

    $(document).mouseup(function (e) {
        var container = $("#search-card");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
        }
    });

    function form_alert(id, message) {
        Swal.fire({
            title: 'Are you sure?',
            text: message,
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'No',
            confirmButtonText: 'Yes',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $('#' + id).submit()
            }
        })
    }
</script>

<script>
    function call_demo() {
        toastr.info('Update option is disabled for demo!', {
            CloseButton: true,
            ProgressBar: true
        });
    }
</script>

<!-- ck editor -->

{{--<script src="{{ asset('public/ckeditor/ckeditor.js')}}"></script>--}}
{{--<script>CKEDITOR.replace('editor');</script>--}}

<!-- ck editor -->

<script>

    $(document).ready(function(){

        $('#add_delivery').click(function(){

            // console.log('good');

            $('#myDelivery').fadeIn();

            $('#orderAccept').fadeIn();

            $('#add_delivery').css('display', 'none')

        });

        $('#myDelivery').on('change', function(){

            // console.log('good');

           let myId =  $('#deliveryId').val($('#myDelivery').val());

           console.log(myId);

        });

        $('#orderAccept').submit(function(e){

                e.preventDefault();
                let formData = new FormData(this);
                $('#image-input-error').text('');

                $.ajax({
                    type:'POST',
                    url: "{{ route('seller.order.accept') }}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            Swal.fire(
                                'تم تاكيد الطلب',
                                )
                                window.location.href = '/seller/orders/list/all'
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
                });

                // console.log('good');


        });


                    // $('#automaticOrders').change(function() {
                    //     // this will contain a reference to the checkbox   
                    //     var remember = document.getElementById('automaticOrders');
                    //     if (remember.checked){

                    //         $('#delivery_select').fadeIn();
                            
                    //         // alert("checked") ;
                    //     }else{
                    //         $('#delivery_select').fadeOut();
                    //     }


                    // });


                    $('.automaticOrdersDelete').change(function() {
                        // this will contain a reference to the checkbox   

                            let automaticOrdersDelete = $('.automaticOrdersDelete').attr('id');
                      
                            $.ajax({
                            url: "{{ route('seller.automatic.orders.delete') }}",
                            type: 'GET',
                            data:{'automaticOrdersDelete': automaticOrdersDelete},
                            success: (response) => {
                                if (response) {
                                   
                                    Swal.fire(
                                        'تم الغاء تفعيل الطلبات التلقائية',
                                        )
                                        location.reload();
                                }
                            },
                            error: function(response){
                                $('#image-input-error').text(response.responseJSON.message);
                            }
                        });



                    });


                    $('.automaticOrders').on('change',function(){

                        let automaticOrders = $('.automaticOrders').attr('id');
                        

                        $.ajax({
                            type:'POST',
                            url: "{{ route('seller.automatic.orders') }}",
                            data:{'automaticOrders': automaticOrders},
                            success: (response) => {
                                if (response) {
                                    Swal.fire(
                                        'تم تفعيل الطلبات التلقائية',
                                        )
                                        location.reload();
                                }
                            }
                        });
                        // console.log('good');

                    });



                    // Accept deferred sale

                    $('#deferred_sale_form').submit(function(e){

                        e.preventDefault();
                        let formData = new FormData(this);
                        $('#image-input-error').text('');

                        $.ajax({
                            type:'POST',
                            url: "{{ route('seller.product.deferred.store') }}",
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: (response) => {
                                if (response) {
                                    this.reset();
                                    Swal.fire(
                                        'تم تفعيل البيع الاجل للمنتج',
                                        )
                                        location.reload();
                                }
                            },
                            error: function(response){
                                $('#image-input-error').text(response.responseJSON.message);
                            }
                        });

                    });


                          // Delete deferred sale

                          $('#deferred_sale_form_deletes').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);
                                $('#image-input-error').text('');

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.product.deferred.delete') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم الغاء تفعيل البيع بالاجل',
                                                )
                                                location.reload()
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });


                                // console.log('good');


                            });

                   
        
                            $('#myForm').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.commissions.sale.pro.store') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تفعيل العمولة علي المبيعات',
                                                )
                                                window.location.href = '/seller/products/commissions'
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });



                            $('#commissions_sale_form_deletes').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.product.commissions.delete') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم الغاء العمولة علي مبيعات المنتج',
                                                )
                                                location.reload()
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });



                            
                            $('#delivery_commissions_stores').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.delivery.product.commissions.store') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تفعيل عمولات التوصيل',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });



                            $('#commissions_delivery_form_deletes').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.product.delivery.commissions.delete') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم الغاء عمولة التوصيل للمنتج',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });



                            $('#seller_branch_store').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.branches.store') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم اضافة الفرع بنجاح',
                                                )
                                               location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });



                            $('#seller_branch_update').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.branches.update') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تحديث بيانات الفرع بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });


                   
                            
                            // Work Time Branche 

                            $('#saturday').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('saturday');
                                if (remember.checked){

                                    $('#saturdayInput').val(6);
                                  
                                //    console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                    $('#saturdayInput').val(null);
                                   
                                    // console.log('unchecked')
                                }


                            });


                            $('#sunday').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('sunday');
                                if (remember.checked){

                                    $('#sundayInput').val(7);
                                //    console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                    $('#sundayInput').val(null);
                                    // console.log('unchecked')
                                }


                            });



                            $('#monday').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('monday');
                                if (remember.checked){

                                    $('#mondayInput').val(1);
                                //    console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                    $('#mondayInput').val(null);
                                    // console.log('unchecked')
                                }


                            });



                            $('#tuesday').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('tuesday');
                                if (remember.checked){

                                    $('#tuesdayInput').val(2);
                                //    console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                    $('#tuesdayInput').val(null);
                                    // console.log('unchecked')
                                }


                            });



                            $('#wednesday').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('wednesday');
                                if (remember.checked){

                                    $('#wednesdayInput').val(3);
                                //    console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                    $('#wednesdayInput').val(null);
                                    // console.log('unchecked')
                                }


                            });


                            $('#thursday').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('thursday');
                                if (remember.checked){

                                    $('#thursdayInput').val(4);
                                //    console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                    $('#thursdayInput').val(null);
                                    // console.log('unchecked')
                                }


                            });



                            $('#workTime_update').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.work.time.update') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تحديث اوقات العمل',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });

                            

                            $('#seller_add_employees').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.store.employees') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم اضافة الموظف بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                            });



                            $('#seller_edit_employees').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.update.employees') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تحديث الموظف بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                                });


                            $('.employees_delete_form').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.delete.employees') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم حذف بيانات الموظف بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                                });



                                $('#branch_id_notifications').on('change', function(){

                                    let branch_id = $('#branch_id_notifications').val();

                                    // console.log(branch_id);

                                    $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.branch.alert.select') }}",
                                    data:{branch_id:branch_id},
                                    success:function(response){

                                        $('#alert_card_body').empty().append();
                                        if(response) {

                                            $('#alert_card_body').append('<div>\
                                                <label class="switch">\
                                                    <input type="checkbox" class="status" id="sound">\
                                                    <span class="slider round"></span>\
                                                </label>\
                                                <span class="pr-3">تفعيل التنبيهات الصوتية</span>\
                                            </div>\
                                            <div>\
                                                <label class="switch">\
                                                    <input type="checkbox" class="status">\
                                                    <span class="slider round"></span>\
                                                </label>\
                                                <span class="pr-3">تلقي اشعارات واتس اب عند الطلبات</span>\
                                            </div>')

                                        }

                                    }


                                 
                                

                                });

                                });



                               
                                $('#sound').change(function() {
                                // this will contain a reference to the checkbox   
                                var remember = document.getElementById('sound');
                                if (remember.checked){

                                   
                                   console.log('checked')
                                    
                                    // alert("checked") ;
                                }else{

                                   
                                    console.log('unchecked')
                                }


                            });
                                


                            // $('#branch_id_opertional_details').on('change', function(){


                            //     let branch_id = $('#branch_id_opertional_details').val();

                            //         // console.log(branch_id);

                            //     $.ajax({
                            //     type:'POST',
                            //     url: "{{ route('seller.branch.automatic.orders.select') }}",
                            //     data:{branch_id:branch_id},
                            //     success:function(response){

                                       

                            //                 $('#seller_delivery_man').fadeIn();

                            //                 if(response.branch.default_delivery != null) {

                                                
                            //                     $('#delivery_select').fadeIn();
                            //                     // var remember = document.getElementById('automaticOrders');
                            //                     // console.log(response.branch.default_delivery); 

                            //                     $('#automaticOrders').attr('checked', true);

                            //                     $('#automaticOrders').on('change',function(){
                                                    
                            //                         $.ajax({
                            //                             type:'POST',
                            //                             url: "{{ route('seller.branch.automatic.orders.unactive') }}",
                            //                             data:{branch_id:branch_id},
                            //                             success:function(response){

                            //                                 $('#automaticOrders').attr('checked', false);
                            //                             }

                            //                         });
                                                    

                            //                     });


                            //                 } 
                                            
                            //                 if(response.branch.default_delivery == null) {

                            //                     $('#automaticOrders').attr('checked', false);
                            //                 }

                                     

                              

                            //         }

                            //     });
                            // });



                            $('#delivery_payment').submit(function(e) {


                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.delivery.payment') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تسوية المديونية بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

            


                            });




                            $('#update_delivery').submit(function(e){

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.delivery.update') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم تعديل الموصل بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });

                              


                            });


                            
                            $('#seller_delivery_delete').submit(function(e) {

                                e.preventDefault();
                                let formData = new FormData(this);

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.delivery.delete') }}",
                                    data: formData,
                                    contentType: false,
                                    processData: false,
                                    success: (response) => {
                                        if (response) {
                                            this.reset();
                                            Swal.fire(
                                                'تم حذف بيانات الموصل بنجاح',
                                                )
                                                location.reload();
                                        }
                                    },
                                    error: function(response){
                                        $('#image-input-error').text(response.responseJSON.message);
                                    }
                                });


                            });

                            

                            $('#deferred_products_branch_id').on('change', function(){

                                console.log('good');
                                
                            });


                           
                            $('#add_product_price').on('keyup', function(){

                                var price = $('#add_product_price').val();

                                $.ajax({
                                    type:'POST',
                                    url: "{{ route('seller.get.site.commissions') }}",
                                    data:{price:price},
                                    success:function(response){

                                    //    console.log(response.commission);

                                    $('#purchase_price').val(response.commission);

                                    }

                                });
                                                    

                            });
                            
                        
                            
        // alert('good');
    });
</script>


<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="{{asset('public/assets/back-end')}}/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
@stack('script')

{{--ck editor--}}
<script src="{{ asset('public/ckeditor/ckeditor.js')}}"></script>
<script>CKEDITOR.replace('editor');</script>
{{--ck editor--}}


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
