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
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('refund_request_list')}}</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">

                <section id="section_one">
                    <div class="row">
                      

                        <div class="col-4 bg-success text-white">
                            <a href="{{route('refund.invoices.sales.of.month')}}" class="text-white">
                            <p>{{$sales_of_month}} <span>ريال</span></p>
                            <p>المرتجعات</p>
                            </a>
                        </div>


                        <div class="col-4" style="background:#6e85b1;color:#fff"> 
                            <a href="{{route('refund.invoices.sales.of.month')}}" class="text-white">
                            <p>{{$invoices}}</p>
                            <p>اجمالي الطلبات</p>
                            </a>
                        </div>

                       
                    </div>

                </section>

                
                <section id="section_two">
                    <div class="row">
                    <div>
                    <canvas id="myChart" style="width:100%;height:600px"></canvas>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

    $(document).ready(function(){

        $.ajax({
                                                        
            type:'GET',
            url: "{{ route('seller.sales.refund.chart') }}",
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
                                    label: 'المرتجعات خلال الشهر',
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

