@extends('layouts.back-end.app-seller-report')

@section('title', \App\CPU\translate('Withdraw'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>


        #section_one {

            margin-bottom:50px
        }
        #section_one .row:first-of-type{

            display:flex;
            justify-content:space-around;
            margin:auto

        }

        #section_one .row > div{

            text-align:center;
            margin:0 20px;
            background:#e3e3e3;
            padding-top:20px;
        }


        #section_one .row > div p {

            font-weight:700
        }

        #section_one .row > div p:first-of-type {

            margin-bottom:0
        }
        
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('seller.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Sales')}}  </li>
            </ol>
        </nav>

    <div class="container-fluid" style="min-height:100vh">
        <h4 class="text-center mb-4">المبيعات الاجله خلال الشهر</h4>
        <div class="row">
            <table class="table table-hover text-center">
                    <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">رقم الطلب</th>
                <th scope="col">المنتج</th>
                <th scope="col">العميل</th>
                <th scope="col">الكمية</th>
                <th scope="col">السعر</th>
                <th scope="col">الاجمالي</th>
                <th scope="col">حالة الطلب</th>
                <th scope="col">التاريخ</th>
                <th scope="col">تاريخ الاستحقاق</th>
                </tr>
            </thead>
            <tbody>
                @php($i = 1)
                @foreach($sales as $val)
                <tr>
                @php($check = DB::table('orders')->where('id', '=', $val->order_id)->first())
                @php($customer = DB::table('users')->where('id', '=', $check->customer_id)->first())
                @php($pro = DB::table('products')->where('id', '=', $val->product_id)->first())

                <td>{{$i++}}</td>
                <td>{{$val->id}}</td>
                <td>{{$pro->name}}</td>
                <td>{{$customer->name}}</td>
                <td>{{$val->qty}}</td>
                <td>{{$val->price}}</td>
                <td>{{$val->qty * $val->price}}</td>
                <td>لم يتم الدفع</td>
                @php($myDate = date('d-m-Y', strtotime($val->created_at)))
                <td>{{$myDate}}</td>

                @php($payDate = date('Y-m-d', strtotime($val->created_at. ' + 6 days')))
                @php($currentDate = date('Y-m-d'))

                @if($currentDate > $payDate)
                <td class="text-danger">{{$payDate}}</td>
                @else 
                <td>{{$payDate}}</td>
                @endif
                </tr>
               
                @endforeach
            </tbody>
            </table>
        </div>
    </div>
      

    </div>
@endsection

@push('script')

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

    $(document).ready(function(){

        $.ajax({
                                                        
            type:'GET',
            url: "{{ route('seller.sales.chart') }}",
            success:function(response){

                const data = {};

                          $.each(response.sales,function(key,value){

                           let total = value.qty * value.price;

                           data[value.created_at.slice(0, 10)] = total;
                            console.log(total)

                          });                                  
                         
               
                    const ctx = document.getElementById('myChart').getContext('2d');

                    const myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: Object.keys(data),
                            datasets: [
                                {
                                    label: 'المبيعات خلال الشهر',
                                    data: Object.values(data),
                                },
                            ],
                        },

                        
                    });

                                                        
            
            }
                       
                                                    
        });
                                                    

        
    


    });
  
</script>

@endpush

