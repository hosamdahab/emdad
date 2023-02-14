@extends('layouts.front-end.app')

@section('title', \App\CPU\translate('Wallet'))

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
            margin-top: 6%;
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
        #privacy_police,
        #Wallet {

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
            <div class="row" style="text-align:right;padding:2rem 0">

                <h4>
                    👋 {{ App\CPU\translate('good_moning') }} {{ $user->f_name }} {{ $user->l_name }}
                </h4>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="wallet-right col-12" style="text-align:right;border:1px solid #E4E9F2;min-height:35rem">

                        <div id="location_details">
                            <form style="width:80%;margin:25px auto" action="{{ route('customer.location.updated') }}"
                                method="post" enctype="multipart/form-data" id="location_updated">
                                @csrf
                                <div class="mb-3">
                                    <label for="exampleInputEmail1"
                                        class="form-label">{{ App\CPU\translate('name') }}</label>
                                    <input type="text" name="name" class="form-control rounded-pill" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                    <input type="hidden" name="myId" value="{{ $location_check->id }}">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1"
                                        class="form-label">{{ App\CPU\translate('business_type') }}</label>
                                    <select name="building_type" id="" class="form-control rounded-pill">
                                        <option value="البقالات">{{ App\CPU\translate('markets') }}</option>
                                        <option value="المطاعم">{{ App\CPU\translate('resutrans') }}</option>
                                        <option value="المقاهي">{{ App\CPU\translate('coffe') }}</option>
                                        <option value="الفنادق">{{ App\CPU\translate('hotels') }}</option>
                                        <option value="القاعات">{{ App\CPU\translate('halls') }}</option>
                                        <option value="الكفتيريا">{{ App\CPU\translate('sub_coffe') }}</option>
                                        <option value="المدارس">{{ App\CPU\translate('schools') }}</option>
                                        <option value="المكاتب">{{ App\CPU\translate('libary') }}</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1"
                                        class="form-label">{{ App\CPU\translate('building_no') }}</label>
                                    <input type="text" name="building_no" class="form-control rounded-pill">
                                </div>

                                <div class="mb-3">floor
                                    <label for="exampleInputEmail1"
                                        class="form-label">{{ App\CPU\translate('building_no') }}</label>
                                    <select name="building_floor" id="" class="form-control rounded-pill">
                                        <option value="الدور الارضي">{{ App\CPU\translate('ground_floor') }}</option>
                                        <option value="الدور الاول">{{ App\CPU\translate('First_Floor') }}</option>
                                        <option value="الدور الثاني">{{ App\CPU\translate('Second_Floor') }}</option>
                                        <option value="الدور الثالث او اعلي">{{ App\CPU\translate('Third_Floor_or_More') }}
                                        </option>

                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1"
                                        class="form-label">{{ App\CPU\translate('address_details') }}</label>
                                    <input type="text" name="address_details" class="form-control rounded-pill">
                                </div>



                                <div class="mb-3">
                                    <label for="exampleInputEmail1"
                                        class="form-label">{{ App\CPU\translate('delivery_contact_no') }}</label>
                                    <input type="number" name="delivery_phone" class="form-control rounded-pill">
                                </div>

                                <div class="mb-3">
                                    <label for="formFile"
                                        class="form-label">{{ App\CPU\translate('building_img') }}</label>
                                    <input class="form-control rounded-pill" name="building_image" type="file" id="formFile">
                                </div>

                                <div class="mb-3">
                                    <label for="formFile"
                                        class="form-label">{{ App\CPU\translate('delivery_img') }}</label>
                                    <input class="form-control rounded-pill" name="delivery_image" type="file" id="formFile">
                                </div>

                                <button type="submit" class="btn primary rounded-pill text-white">{{ App\CPU\translate('save') }}</button>
                            </form>
                        </div>


                        <div id="Wallet">
                            <section
                                style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;direction:rtl;justify-content:space-between">
                                <h5>{{ App\CPU\translate('Wallet') }}</h5>
                                <h5>{{ $wallet->balance ?? 0 }} ريال</h5>
                            </section>

                            @empty($get_orders)
                                <section style="margin-top:8rem">

                                    <div><img src="{{ asset('images/empty-wallet.png') }}" alt=""
                                            style="display:block;margin:auto"></div>
                                    <div>
                                        <p style="text-align:center">لا توجد عمليات حاليا</p>
                                    </div>
                                </section>
                            @endempty


                            @isset($get_orders)

                                @foreach ($get_orders as $val)
                                    <section style="width:90%;margin:auto">

                                        <table class="table" style="direction:rtl;text-align:center">
                                            <thead>
                                                <tr>
                                                    <th scope="col">العملية</th>
                                                    <th scope="col">التاريخ</th>
                                                    <th scope="col">القيمة</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">
                                                        @if ($val->order_status == 'canceled')
                                                            <a
                                                                href="{{ route('customer.transactions.details', ['id' => $val->id]) }}">
                                                                مرتجع </a>
                                                        @endif

                                                        @if ($val->order_status == 'delivered')
                                                            <a
                                                                href="{{ route('customer.transactions.details', ['id' => $val->id]) }}">
                                                                مشتريات </a>
                                                        @endif
                                                    </th>

                                                    @php($myDate = date('d-m-Y', strtotime($val->created_at)))
                                                    <td>{{ $myDate }}</td>

                                                    <td>
                                                        @if ($val->order_status == 'canceled')
                                                            <span
                                                                class="badge bg-success">{{ number_format($val->order_amount, 2) }}
                                                            </span>
                                                        @endif

                                                        @if ($val->order_status == 'delivered')
                                                            <span
                                                                class="badge bg-danger">{{ number_format($val->order_amount, 2) }}
                                                            </span>
                                                        @endif

                                                    </td>

                                                </tr>
                                                <tr>

                                            </tbody>
                                        </table>


                                        <div>

                                        </div>

                                    </section>
                                @endforeach

                            @endisset


                        </div>

                        <div id="Account" class="tabcontent">

                            <section
                                style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;justify-content:space-between">
                                <button type="submit" form="customer_account"
                                    formaction="{{ route('customer.account.update') }}" id="account_submit"
                                    class="btn btn-primary" disabled>حفظ التغيرات</button>
                                <h5>حسابي</h5>
                            </section>

                            <section style="text-align:right;direction:rtl;width:90%;margin:30px auto 0 auto">
                                <form action="{{ route('customer.account.update') }}" method="post"
                                    id="customer_account">
                                    @csrf

                                    <input type="hidden" name="myId" value="{{ $get_user->id }}">
                                    <div class="row">
                                        <div class="col">
                                            <label for="">{{ App\CPU\translate('name') }}</label>
                                            <input type="text" id="name" name="name" class="form-control rounded-pill"
                                                value="{{ $get_user->name }}" id="" aria-label="First name">
                                        </div>
                                        <div class="col">
                                            <label for="">{{ App\CPU\translate('company_email') }}</label>
                                            @isset($get_user->email)
                                                <input type="email" id="email" name="email"
                                                    value="{{ $get_user->email }}" class="form-control rounded-pill"
                                                    aria-label="Last name">
                                            @endisset

                                            @empty($get_user->email)
                                                <input type="email" id="email" name="email" class="form-control rounded-pill"
                                                    aria-label="Last name">
                                            @endempty
                                        </div>
                                    </div>

                                    <br>

                                    <div class="row">
                                        <div class="col">
                                            <label for="">رقم هاتف الحساب</label>
                                            <input type="number" name="phone" class="form-control rounded-pill"
                                                value="{{ $get_user->phone }}" disabled aria-label="First name">
                                        </div>

                                        @isset($get_user->whats)
                                            <div class="col">
                                                <label for="">رقم التواصل عبر الواتس</label>
                                                <input type="number" id="whats" value="{{ $get_user->whats }}"
                                                    name="whats" class="form-control rounded-pill" aria-label="First name">
                                            </div>
                                        @endisset

                                        @empty($get_user->whats)
                                            <div class="col">
                                                <label for="">رقم التواصل عبر الواتس</label>
                                                <input type="number" id="whats" name="whats" class="form-control rounded-pill"
                                                    aria-label="First name">
                                            </div>
                                        @endempty

                                    </div>

                                    <br>

                                    <div class="row">
                                        <div class="col">
                                            <label for="">الوظيفة</label>
                                            <select name="position" id="position" class="form-control rounded-pill">
                                                <option value="صاحب منشاة">صاحب منشاة</option>
                                                <option value="مدير مبيعات">مدير مبيعات</option>
                                                <option value="مدير مشتريات">مدير مشتريات</option>
                                                <option value="مدير تشغيلي">مدير تشغيلي</option>
                                                <option value="اخري">اخري</option>
                                            </select>
                                        </div>
                                    </div>

                                </form>
                            </section>

                        </div>


                        <div id="locations" class="tabcontent">
                            <section
                                style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;justify-content:space-between">
                                <a href="{{ route('customer.add.new.location') }}" id="account_submit"
                                    class="btn btn-primary">اضافة مكان جديد</a>
                                <h5>المواقع</h5>
                            </section>
                            @foreach ($CustomerLocations as $val)
                                <div class="card" style="width: 18rem;">
                                    <img src="{{ asset('images/1.jpg') }}" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make up
                                            the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            @endforeach

                        </div>


                        <div id="building" class="tabcontent">
                            <form method="post" action="{{ route('customer.building.update') }}"
                                id="customer_buliding_update" style="width:90%;margin:20px auto;direction:rtl">
                                @csrf

                                <input type="hidden" name="myId" value="{{ $get_user->id }}">

                                @isset($get_user->building_name)
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">اسم المنشاة</label>
                                        <input type="text" name="building_name" value="{{ $get_user->building_name }}"
                                            class="form-control rounded-pill" id="exampleInputEmail1" aria-describedby="emailHelp">

                                    </div>building_name
                                @endisset

                                @empty($get_user->building_name)
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">اسم المنشاة</label>
                                        <input type="text" name="building_name" class="form-control rounded-pill"
                                            id="exampleInputEmail1" aria-describedby="emailHelp">

                                    </div>
                                @endempty

                                @isset($get_user->building_email)
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">البريد الالكتروني
                                            للمنشاة</label>
                                        <input type="email" value="{{ $get_user->building_email }}" name="building_email"
                                            class="form-control rounded-pill" id="exampleInputPassword1">
                                    </div>
                                @endisset

                                @empty($get_user->building_email)
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">البريد الالكتروني
                                            للمنشاة</label>
                                        <input type="email" name="building_email" class="form-control rounded-pill"
                                            id="exampleInputPassword1">
                                    </div>
                                @endempty

                                <div class="row">

                                    <div class="mb-3 col-6">
                                        <label for="exampleInputPassword1" class="form-label">نوع المنشاة</label>
                                        <select name="building_type" id="" class="form-control rounded-pill">
                                            <option value="البقالات">البقالات</option>
                                            <option value="المطاعم">المطاعم</option>
                                            <option value="المقاهي">المقاهي</option>
                                            <option value="الفنادق">الفنادق</option>
                                            <option value="القاعات">القاعات</option>
                                            <option value="الكفتيريا">الكفتيريا</option>
                                            <option value="المدارس">المدارس</option>
                                            <option value="المكاتب">المكاتب</option>
                                        </select>
                                    </div>

                                    <div class="mb-3 col-6">
                                        <label for="exampleInputPassword1" class="form-label">حجم المنشاة</label>
                                        <select name="building_size" id="" class="form-control rounded-pill">
                                            <option value="فرع واحد">فرع واحد</option>
                                            <option value="2 فرع">2 فرع</option>
                                            <option value=" 3 فروع فاكثر">3 فروع فاكثر</option>
                                        </select>
                                    </div>

                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">المشتريات الشهرية</label>
                                    <select name="month_purchasing" id="" class="form-control rounded-pill">
                                        <option value="اكثر من 150,000">اكثر من 150,000</option>
                                        <option value="من 50,000 الي 100,000">من 50,000 الي 100,000</option>
                                        <option value=" اقل من 50,000">اقل من 50,000</option>
                                    </select>
                                </div>

                                @isset($get_user->tax_no)
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">الرقم الضريبي</label>
                                        <input type="number" name="tax_no" value="{{ $get_user->tax_no }}"
                                            class="form-control rounded-pill" id="exampleInputPassword1">
                                    </div>
                                @endisset

                                @empty($get_user->tax_no)
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">الرقم الضريبي</label>
                                        <input type="number" name="tax_no" class="form-control rounded-pill"
                                            id="exampleInputPassword1">
                                    </div>
                                @endempty

                                @isset($get_user->commercial_no)
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">رقم السجل التجاري</label>
                                        <input type="number" value="{{ $get_user->commercial_no }}" name="commercial_no"
                                            class="form-control rounded-pill" id="exampleInputPassword1">
                                    </div>
                                @endisset

                                @empty($get_user->commercial_no)
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">رقم السجل التجاري</label>
                                        <input type="number" name="commercial_no" class="form-control rounded-pill"
                                            id="exampleInputPassword1">
                                    </div>
                                @endempty

                                <button type="submit" class="btn btn-primary">حفظ</button>
                            </form>
                        </div>


                        <div id="notifications" class="tabcontent">
                            <div class="row">

                                @foreach ($get_banner as $banner)
                                    <div class="card col-md-5"
                                        style="padding:0;justify-content:space-evenly;margin:20px auto">
                                        <img src="{{ asset('banner/' . $banner->photo) }}" class="card-img-top"
                                            alt="..." style="width:100%;height:200px">
                                        <div class="card-body">
                                            @php($myDate = date('d-m-Y', strtotime($banner->expire)))
                                            @php($current_date = date('d-m-Y'))
                                            <h6 style="margin:bottom:2rem;text-align:right">{{ $banner->title }}</h6>
                                            <section style="display:flex;justify-content:space-between;direction:rtl">
                                                <p>{{ $myDate }}</p>
                                                @if ($myDate > $current_date)
                                                    <a href="#" class="btn btn-danger">غير فعال</a>
                                                @else
                                                    <a href="#" class="btn btn-success">فعال</a>
                                            </section>
                                @endif
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>


                <div id="terms_conditions" style="direction:rtl;padding:20px 10px;text-align:justify">
                    {!! $terms_condition->value !!}
                </div>



                <div id="privacy_police" style="direction:rtl;padding:20px 10px;text-align:justify">
                    {!! $privacy_police->value !!}
                </div>

            </div>
        </div>

        <div class="col-md-4 wallet-left-side">

            @include('web-views.partials.customer_location_details_sidbar')
        </div>
    </div>
    </div>
    </div>


@endsection

@push('script')
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9NsykqPN9rg4y4MR4wad3DMkkJvRyGFI&callback=initMap&v=weekly"
        defer></script>
    <script>
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

    <script>
        $(document).ready(function() {

            $('#location_updated').submit(function(e) {

                e.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                    type: 'POST',
                    url: "{{ route('customer.location.updated') }}",
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


        });
    </script>
@endpush
