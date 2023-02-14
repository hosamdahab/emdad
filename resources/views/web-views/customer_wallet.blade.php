@extends('layouts.front-end.app')

@section('title',\App\CPU\translate('Wallet'))

@push('css_or_js')
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

        .active {
            background: #645cb3 !important;
        }

        .active svg path{
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
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
@endpush

@section('content')

@php($user = App\CPU\Helpers::get_customer())

<div class="wallet">
    <div class="container">
        <div class="row" style="text-align:right;padding:2rem 0">

            <h4>
            👋 {{App\CPU\translate('good_moning')}} {{$user->f_name}} {{$user->l_name}}
            </h4>
        </div>
        <div class="row">
            <div class="col-md-8">

                <div class="wallet-right col-12" style="text-align:right;border:1px solid #E4E9F2;min-height:35rem;border-radius: 16px">

                    <div id="Wallet">
                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;direction:rtl;justify-content:space-between">
                            <h5>{{App\CPU\translate('Wallet')}}</h5>
                            <h5>{{$wallet->balance}} ريال</h5>
                        </section>

                        @empty($get_orders)
                            <section style="margin-top:8rem">
                                <div>
                                    <img src="{{asset('images/empty-wallet.png')}}" alt="" style="display:block;margin:auto">
                                </div>
                                <div>
                                    <p style="text-align:center">لا توجد عمليات حاليا</p>
                                </div>
                            </section>
                        @endempty


                        @isset($get_orders)

                            @foreach($get_orders as $val)
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
                                                @if($val->order_status == 'canceled')
                                                <a href="{{route('customer.transactions.details', ['id' => $val->id])}}"> مرتجع </a>
                                                @endif

                                                @if($val->order_status == 'delivered')
                                                    <a href="{{route('customer.transactions.details', ['id' => $val->id])}}"> مشتريات </a>
                                                @endif
                                            </th>

                                                @php($myDate = date('d-m-Y', strtotime($val->created_at)))
                                            <td>{{$myDate}}</td>

                                            <td>
                                            @if($val->order_status == 'canceled')
                                            <span class="badge bg-success">{{number_format($val->order_amount,2)}} </span>
                                            @endif

                                            @if($val->order_status == 'delivered')
                                            <span class="badge bg-danger">{{number_format($val->order_amount,2)}} </span>
                                            @endif

                                            </td>

                                            </tr>
                                            <tr>

                                        </tbody>
                                    </table>
                                </section>
                            @endforeach

                        @endisset


                    </div>

                    <div id="Account" class="tabcontent">

                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;justify-content:space-between">
                            <button type="submit" form="customer_account" formaction="{{route('customer.account.update')}}" id="account_submit" class="btn primary text-white rounded-pill" disabled>{{App\CPU\translate('save')}}</button>
                            <h5>{{App\CPU\translate('my_account')}}</h5>
                        </section>

                        <section style="text-align:right;direction:rtl;width:90%;margin:30px auto 0 auto">
                           <form action="{{route('customer.account.update')}}" method="post" id="customer_account">
                                @csrf

                                <input type="hidden" name="myId" class="rounded-pill" value="{{$get_user->id}}">
                                <div class="row">
                                    <div class="col">
                                        <label for="">{{App\CPU\translate('name')}}</label>
                                        <input type="text" id="name" name="name" class="form-control rounded-pill rounded-pill" value="{{$get_user->name}}" id="" aria-label="First name">
                                    </div>
                                    <div class="col">
                                        <label for="">{{App\CPU\translate('email')}}</label>
                                        @isset($get_user->email)
                                            <input type="email" id="email" name="email" value="{{$get_user->email}}" class="form-control rounded-pill"  aria-label="Last name">
                                        @endisset

                                        @empty($get_user->email)
                                            <input type="email" id="email" name="email" class="form-control rounded-pill"  aria-label="Last name">
                                        @endempty
                                    </div>
                                </div>

                            <br>

                            <div class="row">
                                <div class="col">
                                    <label for="">{{App\CPU\translate('account_phone_number')}}</label>
                                    <input type="number" name="phone" class="form-control rounded-pill" value="{{$get_user->phone}}" disabled aria-label="First name">
                                </div>

                                @isset($get_user->whats)
                                <div class="col">
                                    <label for="">{{App\CPU\translate('whats_app_no')}}</label>
                                    <input type="number" id="whats" value="{{$get_user->whats}}" name="whats" class="form-control rounded-pill" aria-label="First name">
                                </div>
                                @endisset

                                @empty($get_user->whats)
                                <div class="col">
                                    <label for="">{{App\CPU\translate('whats_app_no')}}</label>
                                    <input type="number" id="whats" name="whats" class="form-control rounded-pill" aria-label="First name">
                                </div>
                                @endempty

                            </div>

                            <br>

                            <div class="row">
                            <div class="col">
                                    <label for="">{{App\CPU\translate('job')}}</label>
                                    <select name="position" id="position" class="form-control rounded-pill">
                                        <option value="صاحب منشاة">{{App\CPU\translate('owner')}}</option>
                                        <option value="مدير مبيعات">{{App\CPU\translate('sales_manager')}}</option>
                                        <option value="مدير مشتريات">{{App\CPU\translate('purchasing_manager')}}</option>
                                        <option value="مدير تشغيلي">{{App\CPU\translate('production_manager')}}</option>
                                        <option value="اخري">{{App\CPU\translate('other')}}</option>
                                    </select>
                                </div>
                            </div>

                           </form>
                        </section>

                    </div>


                    <div id="locations" class="tabcontent">
                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;justify-content:space-between">
                            <a href="{{route('customer.add.new.location')}}" id="account_submit" class="btn btn-light rounded-pill">اضافة مكان جديد</a>
                            <h5>{{App\CPU\translate('Location')}}</h5>
                        </section>

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
                                        @php($number)
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

                    </div>


                    <div id="building" class="tabcontent">
                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;direction:rtl;justify-content:space-between">
                            <h5>{{App\CPU\translate('building')}}</h5>
                        </section>
                        <form method="post" action="{{route('customer.building.update')}}" id="customer_buliding_update" style="width:90%;margin:20px auto;direction:rtl">
                            @csrf

                            <input type="hidden" name="myId" value="{{$get_user->id}}">

                            @isset($get_user->building_name)
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">{{App\CPU\translate('building_name')}}</label>
                                    <input type="text" name="building_name" value="{{$get_user->building_name}}" class="form-control rounded-pill" id="exampleInputEmail1" aria-describedby="emailHelp">

                                </div>
                            @endisset

                            @empty($get_user->building_name)
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">{{App\CPU\translate('building_name')}}</label>
                                    <input type="text" name="building_name" class="form-control rounded-pill" id="exampleInputEmail1" aria-describedby="emailHelp">

                                </div>
                            @endempty

                            @isset($get_user->building_email)
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('company_email')}}</label>
                                <input type="email" value="{{$get_user->building_email}}" name="building_email" class="form-control rounded-pill" id="exampleInputPassword1">
                            </div>
                            @endisset

                            @empty($get_user->building_email)
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('company_email')}}</label>
                                <input type="email" name="building_email" class="form-control rounded-pill" id="exampleInputPassword1">
                            </div>
                            @endempty

                            <div class="row">

                                <div class="mb-3 col-6">
                                    <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('business_type')}}</label>
                                        <select name="building_type" id="" class="form-control rounded-pill">
                                            <option value="البقالات">{{App\CPU\translate('markets')}}</option>
                                            <option value="المطاعم">{{App\CPU\translate('resutrans')}}</option>
                                            <option value="المقاهي">{{App\CPU\translate('coffe')}}</option>
                                            <option value="الفنادق">{{App\CPU\translate('hotels')}}</option>
                                            <option value="القاعات">{{App\CPU\translate('halls')}}</option>
                                            <option value="الكفتيريا">{{App\CPU\translate('sub_coffe')}}</option>
                                            <option value="المدارس">{{App\CPU\translate('schools')}}</option>
                                            <option value="المكاتب">{{App\CPU\translate('libary')}}</option>
                                        </select>
                                </div>

                                <div class="mb-3 col-6">
                                    <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('business_size')}}</label>
                                        <select name="building_size" id="" class="form-control rounded-pill">
                                            <option value="فرع واحد">{{App\CPU\translate('one_branche')}}</option>
                                            <option value="2 فرع">{{App\CPU\translate('two_branch')}}</option>
                                            <option value=" 3 فروع فاكثر">{{App\CPU\translate('three_branch')}}</option>
                                        </select>
                                </div>

                            </div>


                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('month_purchasing')}}</label>
                                        <select name="month_purchasing" id="" class="form-control rounded-pill">
                                            <option value="اكثر من 150,000">{{App\CPU\translate('more_than_150000')}}</option>
                                            <option value="من 50,000 الي 100,000">{{App\CPU\translate('between_two_no')}}</option>
                                            <option value=" اقل من 50,000">{{App\CPU\translate('less_than_50000')}}</option>
                                        </select>
                            </div>

                            @isset($get_user->tax_no)
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('tax_no')}}</label>
                                <input type="number" name="tax_no" value="{{$get_user->tax_no}}" class="form-control rounded-pill" id="exampleInputPassword1">
                            </div>
                            @endisset

                            @empty($get_user->tax_no)
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('tax_no')}}</label>
                                <input type="number" name="tax_no" class="form-control rounded-pill" id="exampleInputPassword1">
                            </div>
                            @endempty

                            @isset($get_user->commercial_no)
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('tax_no_res')}}</label>
                                <input type="number" value="{{$get_user->commercial_no}}" name="commercial_no" class="form-control rounded-pill" id="exampleInputPassword1">
                            </div>
                            @endisset

                            @empty($get_user->commercial_no)
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">{{App\CPU\translate('tax_no_res')}}</label>
                                <input type="number" name="commercial_no" class="form-control rounded-pill" id="exampleInputPassword1">
                            </div>
                            @endempty

                            <button type="submit" class="btn primary rounded-pill text-white">{{App\CPU\translate('save')}}</button>
                        </form>
                    </div>


                    <div id="notifications" class="tabcontent">
                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;direction:rtl;justify-content:space-between">
                            <h5>{{App\CPU\translate('Notifications')}}</h5>
                        </section>
                        <div class="row">

                            @foreach($get_banner as $banner)
                                <div class="card col-md-6 rtl m-3" style="max-width: 25rem;border-radius: 18px;padding: 0;">
                                    <img src="{{asset('public/banner/'.$banner->photo)}}" class="card-img-top" alt="..." style="width:100%;height:200px;    border-top-left-radius: 18px;border-top-right-radius: 18px;">
                                    <div class="card-body">
                                        @php($myDate = date('d-m-Y', strtotime($banner->expire)))
                                        @php($current_date = date("d-m-Y"))
                                        <h6 style="margin:bottom:2rem;text-align:right">{{$banner->title}}</h6>
                                        <section style="display:flex;justify-content:space-between;direction:rtl">
                                            <p>{{$myDate}}</p>
                                            @if($myDate > $current_date)
                                                <a href="#" class="btn btn-danger">{{App\CPU\translate('Inactive')}}</a>
                                            @else
                                                <a href="#" class="btn btn-success">{{App\CPU\translate('active')}}</a>
                                            @endif
                                        </section>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>


                    <div id="terms_conditions" style="direction:rtl;text-align:justify">
                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;direction:rtl;justify-content:space-between;margin-bottom:10px">
                            <h5>{{App\CPU\translate('terms_and_condition')}}</h5>
                        </section>
                        {!! $terms_condition->value !!}
                    </div>



                    <div id="privacy_police" style="direction:rtl;text-align:justify">
                        <section style="padding:20px;border-bottom:1px solid #E4E9F2;display:flex;direction:rtl;justify-content:space-between;margin-bottom:10px">
                            <h5>{{App\CPU\translate('privacy_policy')}}</h5>
                        </section>
                        {!! $privacy_police->value !!}
                    </div>

                </div>
            </div>

            <div class="col-md-4 wallet-left-side" style="max-width: 24rem;">
                @include('web-views.partials.customer_location_details_sidbar')
            </div>
        </div>
    </div>
</div>


@endsection

@push('script')
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9NsykqPN9rg4y4MR4wad3DMkkJvRyGFI&callback=initMap&v=weekly"
      defer
    ></script>
    <script>
        function cancel_message() {
            toastr.info('{{\App\CPU\translate('order_can_be_canceled_only_when_pending.')}}', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>

 <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
        $('.btn-submit').click(function (e) {
            e.preventDefault();
            let form = $(this).closest('.form-location');
            form.submit();
        });

        $('.delete_location').on('click', function() {

            let myId = $(this).attr('id');

            $.ajax({
                type: 'GET',
                url: "{{route('customer.locations.delete',"+myId+")}}",
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

        $(document).ready(function() {






            $('.account').click(function(){

                $('#Account').css('display', 'block');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');

                $('.building').removeClass('active-top');
                $('.building-p').removeClass('active-text');
                $('.locations').removeClass('active-top');
                $('.locations-p').removeClass('active-text');

                $(this).addClass('active-top');
                $('.account-p').addClass('active-text');


                $('.customer_notifications').removeClass('active-sidbar');
                $('.customer_privacy_police').removeClass('active-sidbar');
                $('.wallet_customer').removeClass('active-sidbar');
                $('.customer_terms_conditions').removeClass('active-sidbar');
            });


            $('.locations').click(function(){

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#building').css('display', 'none');
                $('#locations').css('display', 'block');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');

                $('.account').removeClass('active-top');
                $('.account-p').removeClass('active-text');
                $('.building').removeClass('active-top');
                $('.building-p').removeClass('active-text');

                $(this).addClass('active-top');
                $('.locations-p').addClass('active-text');

                $('.customer_notifications').removeClass('active-sidbar');
                $('.customer_privacy_police').removeClass('active-sidbar');
                $('.wallet_customer').removeClass('active-sidbar');
                $('.customer_terms_conditions').removeClass('active-sidbar');
            });


            $('.building').click(function(){

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'block');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');

                $('.locations').removeClass('active-top');
                $('.locations-p').removeClass('active-text');
                $('.account').removeClass('active-top');
                $('.account-p').removeClass('active-text');

                $(this).addClass('active-top');
                $('.building-p').addClass('active-text');

                $('.customer_notifications').removeClass('active-sidbar');
                $('.customer_privacy_police').removeClass('active-sidbar');
                $('.wallet_customer').removeClass('active-sidbar');
                $('.customer_terms_conditions').removeClass('active-sidbar');
            });

            $('#wallet_customer').click(function(){

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'block');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');


                $('.building').removeClass('active-top');
                $('.building-p').removeClass('active-text');
                $('.locations').removeClass('active-top');
                $('.locations-p').removeClass('active-text');
                $('.account').removeClass('active-top');
                $('.account-p').removeClass('active-text');

                $('.customer_notifications').removeClass('active-sidbar');
                $('.customer_terms_conditions').removeClass('active-sidbar');
                $('.customer_privacy_police').removeClass('active-sidbar');

                $('.wallet_customer').addClass('active-sidbar');


            });


            $('#customer_notifications').click(function(){

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'block');
                $('#terms_conditions').css('display', 'none');
                $('#privacy_police').css('display', 'none');


                $('.building').removeClass('active-top');
                $('.building-p').removeClass('active-text');
                $('.locations').removeClass('active-top');
                $('.locations-p').removeClass('active-text');
                $('.account').removeClass('active-top');
                $('.account-p').removeClass('active-text');

                $('.customer_terms_conditions').removeClass('active-sidbar');
                $('.customer_privacy_police').removeClass('active-sidbar');
                $('.wallet_customer').removeClass('active-sidbar');

                $('.customer_notifications').addClass('active-sidbar');


            });


            $('#customer_terms_conditions').click(function(){

                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'block');
                $('#privacy_police').css('display', 'none');


                $('.building').removeClass('active-top');
                $('.building-p').removeClass('active-text');
                $('.locations').removeClass('active-top');
                $('.locations-p').removeClass('active-text');
                $('.account').removeClass('active-top');
                $('.account-p').removeClass('active-text');

                $('.customer_notifications').removeClass('active-sidbar');
                $('.customer_privacy_police').removeClass('active-sidbar');
                $('.wallet_customer').removeClass('active-sidbar');

                $('.customer_terms_conditions').addClass('active-sidbar');

            });


            $('#customer_privacy_police').click(function(){

                $('#privacy_police').css('display', 'block');
                $('#Account').css('display', 'none');
                $('#Wallet').css('display', 'none');
                $('#locations').css('display', 'none');
                $('#building').css('display', 'none');
                $('#notifications').css('display', 'none');
                $('#terms_conditions').css('display', 'none');


                $('.building').removeClass('active-top');
                $('.building-p').removeClass('active-text');
                $('.locations').removeClass('active-top');
                $('.locations-p').removeClass('active-text');
                $('.account').removeClass('active-top');
                $('.account-p').removeClass('active-text');

                $('.customer_notifications').removeClass('active-sidbar');
                $('.wallet_customer').removeClass('active-sidbar');
                $('.customer_terms_conditions').removeClass('active-sidbar');

                $('.customer_privacy_police').addClass('active-sidbar');

            })



        });


        $('#name').on('keyup',function(){

            $('#account_submit').attr('disabled', null);

        });


        $('#email').on('keyup', function(){

            $('#account_submit').attr('disabled', null);

        })


        $('#whats').on('keyup', function(){

        $('#account_submit').attr('disabled', null);

        });


        $('#position').on('change', function(){

        $('#account_submit').attr('disabled', null);

        });



        $('#customer_account').submit(function(e){

            e.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                    type:'POST',
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
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
                });

                // console.log('good');

        });




        $('#customer_buliding_update').submit(function(e){

            e.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                    type:'POST',
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
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
                });

                // console.log('good');


                $('.delete_location').on('click', function(){

                    let myId = $(this).attr('id');

                    $.ajax({
                        type:'GET',
                        url: '/customer/locations/delete/'+ myId +'',
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

        });


</script>
@endpush
