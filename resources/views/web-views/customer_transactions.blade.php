@extends('layouts.front-end.app')

@section('title','المحفظة')

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
        
        #Account , #Locations{

            display:none
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
        
            <section>
                
                <div class="row">
                    <section class="col-6" style="display:flex;align-items:center">
                    <div style="margin:0 10px">
                    <img src="{{asset('images/logo.png')}}" alt="" width="70" height="70">
                    </div>
                    <div style="text-align:center">
                        <p style="margin-bottom:0">امداد لتقنية المعلومات</p>
                        <small>Emdad Technologies LLC</small>
                    </div>
                    </section>
                    
                    <section class="col-6">
                    <h4>فاتورة بيع رقم {{ ($get_orders->id) }}</h4>
                    </section>
                
                </div>

                
                <div class="row" style="display:flex;direction:rtl;margin-top:40px">

                <div class="col-6" style="text-align:right">
                    <p style="margin-bottom:0">العنوان</p>
                    <p>Address</p>
                </div>

                <div class="col-6" style="text-align:left">
                    <p>{{$get_shipping_address->address}}</p>
                </div>
                

                </div>
               

                <table class="table" style="direction:rtl;text-align:center">
                    <thead>
                        <tr>
                        
                        <th scope="col">تاريخ الاصدار</th>
                        <th scope="col">رقم الطلب</th>
                        <th scope="col">رقم الشحنة</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        @php($myDate = date('d-m-Y', strtotime($get_orders->created_at)))
                        <td>{{$myDate}}</td>
                        <td>{{ ($get_orders->id) }}</td>
                        <td>{{ ($get_orders->id) }}</td>
                        </tr>
                        
                    </tbody>
                </table>

                <div class="row" style="direction:rtl;margin:30px 0 20px 0;align-items:center">
                    <div class="col-6" style="text-align:right">
                        <p style="margin-bottom:0">اسم العميل</p>
                        <p>Customer Name</p>
                    </div>


                    <div class="col-6" style="text-align:left">
                        <p>{{$get_customer->name}}</p>
                    </div>
                   
                </div>


                <div class="row">
                        <table class="table" style="direction:rtl;text-align:center">
                            <thead>
                                <tr>
                                <th scope="col">م</th>
                                <th scope="col">المنتج</th>
                                <th scope="col">الوحدة</th>
                                <th scope="col">الكمية</th>
                                <th scope="col">سعر الوحدة</th>
                                <th scope="col">السعر الكلي</th>
                                </tr>
                            </thead>
                            @php($i = 1)
                            <tbody>
                                @foreach($get_details as $val)

                                @php($get_pro = DB::table('products')->where('id', '=', $val->product_id)->first())
                               
                                <tr>
                                    
                                <th scope="row">{{$i++}}</th>
                                <td>
                                    @isset($get_pro->name)

                                    @isset($get_sub_sub)
                                    {{$get_brand->name}} {{$get_sub_sub->name}} {{$get_pro->name}}
                                    @endisset

                                    @empty($get_sub_sub) 

                                        @isset($get_sub)
                                        {{$get_brand->name}} {{$get_sub->name}} {{$get_pro->name}}
                                        @endisset

                                        @empty($get_sub)
                                            {{$get_brand->name}} {{$get_pro->name}}
                                        @endempty

                                    @endempty

                                    @endisset

                                    @empty($get_pro->name)

                                    @php($get_brand = DB::table('brands')->where('id', '=', $get_pro->brand_id)->first())
                                    @php($get_sub_sub = DB::table('sub_sub_categories')->where('id', '=', $get_pro->sub_sub_category_id)->first())
                                    @php($get_sub = DB::table('sub_categories')->where('id', '=', $get_pro->sub_category_id)->first())
                                       
                                    @isset($get_sub_sub)
                                    {{$get_brand->name}} {{$get_sub_sub->name}} {{$get_pro->product_type}}
                                    @endisset

                                    @empty($get_sub_sub) 

                                    @isset($get_sub)
                                    {{$get_brand->name}} {{$get_sub->name}}
                                    @endisset

                                    @empty($get_sub)
                                        {{$get_brand->name}} {{$get_pro->product_type}}
                                    @endempty

                                    @endempty

                                    @endempty
                                </td>
                                <td>
                                    <div style="display:flex;margin:auto;text-align:center;justify-content:center">
                                        <span>{{$get_pro->unit}}</span>
                                        <span>{{$get_pro->unit_numbers}}</span>
                                        <span style="padding:0 5px">x</span>
                                        <span>{{$get_pro->carton_unit}}</span>
                                    </div>
                                </td>
                                <td>{{$val->qty}}</td>
                                <td>{{$get_pro->unit_price}} ريال</td>
                                @php($total = $val->qty * $get_pro->unit_price)

                                <td>{{$total}} ريال</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                </div>

                <div class="row" style="direction:rtl">
                    <section class="col-6">
                        <img src="{{asset('images/barcode.png')}}" alt="" draggable="false" width="120" height="120">
                    </section>

                    <section class="col-6">
                        <div style="display:flex;justify-content:flex-end">
                            <section><p>المجموع :</p></section>
                            <section><p>{{$total}} ريال</p></section>
                        </div>

                        <div style="display:flex;justify-content:flex-end">
                            <section><p>رسوم التوصيل :</p></section>
                            <section>
                                @if($get_pro->shipping_cost != null)
                                <p>{{$get_pro->shipping_cost}}</p>
                                @else

                             
                                <p>مجاني</p>
                                @endif
                        
                            </section>
                        </div>

                        <div style="display:flex;justify-content:flex-end">
                            <section><p>الخصم : </p></section>
                            <section>
                                @if($get_pro->discount != 0.00)
                                <p>{{$get_pro->discount}} ريال</p>
                                @else

                               
                                <p>لا يوجد</p>
                                @endif
                            </section>
                        </div>

                        <div style="display:flex;justify-content:flex-end">
                            <section><p>المجموع : </p></section>
                            <section>
                                @php($grand_total = $total + $get_pro->shipping_cost - $get_pro->discount)
                                <p>{{$grand_total}} ريال</p>
                            </section>
                        </div>
                    </section>
                </div>
                
            </section>
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

        // $(document).ready(function() {

        //     $('.account').click(function(){

        //         $('#Account').css('display', 'block');

        //         $('#Wallet').css('display', 'none');
        //         $('#Locations').css('display', 'none');

        //     })

        // });

</script>
@endpush
