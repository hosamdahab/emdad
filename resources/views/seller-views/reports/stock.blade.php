@extends('layouts.back-end.app-seller-report')

@section('title', \App\CPU\translate('Withdraw'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>

        #section_one .row{

            display:flex;
            justify-content:space-between;
            margin:auto

        }

        #section_one .row > div{

            text-align:center;
            margin:0 20px;
            background:#e3e3e3;
            padding-top:20px;
        }

        
    </style>
@endpush

@section('content')
<div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('seller.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('stock')}}</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">

                <section id="section_one">
                    <div class="row">
                      

                        <div class="col-3 bg-success text-white">
                            <p><span>ريال</span></p>
                            <p>المبيعات النقدية</p>
                        </div>

                     

                        <div class="col-3" style="background:#6e85b1;color:#fff"> 
                            <p></p>
                            <p>اجمالي الطلبات</p>
                        </div>



                        <div class="col-3 bg-info text-white"> 
                            <p></p>
                            <p>الفواتير المفتوحة</p>
                        </div>

                       
                    </div>

                  
                </section>

                
                <section id="section_two">
                    <div class="row">
                    <div>
                    <canvas id="myChart" style="width:100%;height:500px"></canvas>
                    </div>



                    </div>
                </section>
            </div>
        </div>

    
        <!-- /.row -->


    </div>
@endsection

@push('script')
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script
        src="{{ asset('public/assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js">
    </script>

@endpush

