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
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Withdraw')}}  </li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">

                <section id="section_one">
                    <div class="row">
                        <div class="col">
                            <p>{{$sales_of_month}} <span>ريال</span></p>
                            <p>المبيعات</p>
                        </div>

                        <div class="col">
                            <p>0</p>
                            <p>المرتجعات</p>
                        </div>

                        <div class="col">
                            <p>0</p>
                            <p>المبيعات الاجله</p>
                        </div>

                        <div class="col">
                            <p>0</p>
                            <p>المخزون</p>
                        </div>

                        <div class="col">
                            <p>0</p>
                            <p>تقارير الموصلين</p>
                        </div>

                        <div class="col">
                            <p>0</p>
                            <p>تقارير الفروع</p>
                        </div>

                        <div class="col">
                            <p>0</p>
                            <p>العمولات</p>
                            
                        </div>
                    </div>
                </section>

                <section id="section_two">
                    <div class="row">
                    <canvas id="myChart" height="100px"></canvas>


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

