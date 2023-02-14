@extends('layouts.front-end.app2')

@section('title', 'المواقع')

@push('css_or_js')
    <style>
        .widget-categories .accordion-heading>a:hover {
            color: #FFD5A4 !important;
        }

        .widget-categories .accordion-heading>a {
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
            border- {{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}: 1px solid #f7f0f0;
            text-align: center;
        }

        .bodytr {
            text-align: center;
            vertical-align: middle !important;
        }

        .sidebar h3:hover+.divider-role {
            border-bottom: 3px solid {{ $web_config['primary_color'] }} !important;
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
                background: {{ $web_config['primary_color'] }};
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

            background: #fff;
        }


        .wallet-left-one {


            background-color: #f8f8f9;
            width: 100%
        }


        .wallet-left-one {

            display: flex;
            justify-content: space-around;
            border-radius: 10px;
            padding: 20px 0 10px 0;
        }


        .wallet-left-one>div {

            text-align: center
        }


        .wallet-left-one>div p {

            font-weight: 600;
            padding-top: 10px
        }

        .wallet-left-one button {

            border: 1px solid #ECEDEE;
            padding: 15px;
            background: #fff;
            border-radius: 10px
        }


        .wallet-left-two {

            background: #fff;
            border: 1px solid #E4E9F2;
            border-radius: 10px;
            margin-top: 30px;
            text-align: right;
            padding: 0 20px 0 20px;
        }

        .wallet-left-two>div {

            margin: 25px 0;
        }

        #Account,
        #Locations,
        #locations,
        #building,
        #notifications,
        #terms_conditions,
        #terms_conditions,
        #privacy_police {

            display: none
        }
    </style>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
@endpush

@section('content')

    @php($user = App\CPU\Helpers::get_customer())

    <div class="wallet">
        <div class="container">
            {{-- <div class="row" style="text-align:right;padding:2rem 0">

                <h4>
                    👋 {{ \App\CPU\translate('good_morning') }} {{ $user->f_name }} {{ $user->l_name }}
                </h4>
            </div> --}}
            <div class="row min-vh-100 justify-content-center align-items-center">
                <div class="col-lg-6 col-md-6 col-12 mt-5">

                    <div class="wallet-right col-12 rounded-4 shadow" style="text-align:right;border:1px solid #E4E9F2;min-height:35rem;font-family:'Cairo'">
                        <div id="location" class="tabcontent">
                            {{-- <section
                                style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;justify-content:space-between">
                                <a href="{{ route('customer.add.new.location') }}" id="account_submit"
                                    class="btn primary text-white">{{ \App\CPU\translate('add_locations') }}</a>
                            </section> --}}
                            <h5 class="p-4">{{ \App\CPU\translate('locations') }}</h5>
                            @if (count($CustomerLocations) > 0)
                                @foreach ($CustomerLocations as $val)
                                    <div class="card rtl card-rounded mx-5 my-3">
                                        <div class="card-body d-flex">
                                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Location_icon_from_Noun_Project.png/768px-Location_icon_from_Noun_Project.png" style="width: 100px"
                                                alt="...">
                                            <a href="#" style="position:absolute;top:1.5rem;left:1.5rem"
                                                id="{{ $val->id }}" class="delete_location">
                                                {{-- <img src="{{ asset('images/delete.png') }}" alt="" width="32"
                                                    height="32"> --}}
                                                <i class="fa fa-trash text-danger"></i>
                                            </a>
                                         <h5 class="card-title mt-5">
                                                <form action="{{route('customer.location.add.helpers')}}" method="post" class="form-location">
                                                    @csrf
                                                    <input type="hidden" name="location_city" value="{{$val->city}}">
                                                    <input type="hidden" name="location_country" value="{{$val->country}}">
                                                    <a href="#" class="btn-submit">{{ $val->name }}</a>
                                                </form>
                                            </h5>
                                        </div>
                                    </div>
                                @endforeach
                            @else
                            <div class="h-100">
                                <h3 class="text-center">لا توجد مواقع محفوظه</h3>
                            </div>
                            @endif

                            <a href="{{ route('customer.add.new.location') }}" id="account_submit">
                                <div class="card rtl card-rounded mx-5 my-3" style="border-style: dotted">
                                    <div class="card-body">
                                        <h3 class="whats-verfiry text-center">+ اضافة مكان جديد</h3>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>


@endsection

@push('script')
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCz0Y8y319Mr7bi-7oj4hr4haPaiNqjrLU&libraries=initMap&v=weekly"
        defer></script>
    <script>
        
        $('.btn-submit').click(function (e) {
            e.preventDefault();
            let form = $(this).closest('.form-location');
            form.submit();
        });
    
    
        function cancel_message() {
            toastr.info('{{ \App\CPU\translate('order_can_be_canceled_only_when_pending.') }}', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
    
    

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>

    <script>
        $(document).ready(function() {

            $('.delete_location').on('click', function() {

                let localId = $(this).attr('id');

                $.ajax({
                    type: 'GET',
                    url: "{{ url('customer/locations/delete') }}/"+localId,
                    success: (response) => {
                        if (response) {
                            Swal.fire(
                                'تم حذف الموقع بنجاح',
                            )
                            location.reload();
                        }
                    },

                });

            });


            $('#wallet_customer').click(function() {

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'block');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');


            })

            $('.account').click(function() {

                $('#Account').css('display', 'block');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');

            });


            $('.locations').click(function() {

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#building').css('display', 'none');
                $('#locations').css('display', 'block');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');

            });


            $('.building').click(function() {

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'block');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');


            });


            $('#customer_notifications').click(function() {

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'block');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');

            });


            $('#customer_terms_conditions').click(function() {

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'block');
                $('#privacy_police').css('display', 'none');

            });


            $('#customer_privacy_police').click(function() {

                $('#privacy_police').css('display', 'block');
                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');


            })



        });


        $('#name').on('keyup', function() {

            $('#account_submit').attr('disabled', null);

        });


        $('#email').on('keyup', function() {

            $('#account_submit').attr('disabled', null);

        })


        $('#whats').on('keyup', function() {

            $('#account_submit').attr('disabled', null);

        });


        $('#position').on('change', function() {

            $('#account_submit').attr('disabled', null);

        });



        $('#customer_account').submit(function(e) {

            e.preventDefault();
            let formData = new FormData(this);

            $.ajax({
                type: 'POST',
                url: "{{ route('customer.account.update') }}",
                data: formData,
                contentType: false,
                processData: false,
                success: (response) => {
                    if (response) {
                        this.reset();
                        Swal.fire(
                            'تم تعديل بيانات الحساب'
                        )
                        location.reload();
                    }
                },
                error: function(response) {
                    $('#image-input-error').text(response.responseJSON.message);
                }
            });

            // console.log('good');

        });




        $('#customer_buliding_update').submit(function(e) {

            e.preventDefault();
            let formData = new FormData(this);

            $.ajax({
                type: 'POST',
                url: "{{ route('customer.building.update') }}",
                data: formData,
                contentType: false,
                processData: false,
                success: (response) => {
                    if (response) {
                        this.reset();
                        Swal.fire(
                            'تم تعديل بيانات المنشاة'
                        )
                        location.reload();
                    }
                },
                error: function(response) {
                    $('#image-input-error').text(response.responseJSON.message);
                }
            });

            // console.log('good');

        });
    </script>
@endpush
