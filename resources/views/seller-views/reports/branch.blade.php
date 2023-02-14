@extends('layouts.back-end.app-seller-report')

@section('title', \App\CPU\translate('Withdraw'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">

   
    <style>

#section_one {

margin-bottom:50px
}

#section_one .row:first-of-type{

display:none;


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
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('branch_reports')}}</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">

                <section id="section_one">
                   
                    @php($branch = DB::table('branche')->where(['user_id'=>auth('seller')->id()])->get())
                        <select name="branch_report" onchange="get_branch()" id="branch_report" class="col-4 form-control">
                            <option selected>حدد الفرع</option>
                            @foreach($branch as $val) 
                            <option value="{{$val->id}}">{{$val->branche_name}}</option>
                            @endforeach
                        </select>
                    
                    <div class="row" id="delivery_report_section">
                      

                        <div class="col-4 bg-success text-white">
                            <p id="delivery_order"><span>ريال</span></p>
                            <p>المبلغ</p>
                        </div>


                        <div class="col-4" style="background:#6e85b1;color:#fff"> 
                            <p id="delivery_order_count"></p>
                            <p>اجمالي الطلبات</p>
                        </div>

                       
                    </div>

                </section>

                
                <section id="section_two">
                    <div class="row">
                    <div id="myCanvas">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

    
        function get_branch(){

            var branch_report = document.getElementById('branch_report').value;

                $('#myCanvas').empty().append();


                $.ajax({
                type:'POST',
                url: "{{ route('seller.sales.branch.chart') }}",
                data:{branch_report:branch_report},
                success:function(response){

                    // $('#myCanvas').append('<canvas id="myChart" style="width:100%;height:600px"></canvas>');
                    // $('#section_one .row:first-of-type').css({'display' : 'flex', 'justify-content' : 'space-around', 'margin': '20px auto'});
                                       
                    //   console.log(response.sales);

                    //   const data = {};

                    //     $.each(response.sales,function(key,value){

                    //     let total = value.order_amount;

                    //     data[value.created_at.slice(0, 10)] = total.toFixed(2);
                    //     console.log(total)

                    //     });                 
                        

                    //     $('#delivery_order').text(response.sales_amount.toFixed(2));
                        
                    //     $('#delivery_order_count').text(response.sales_count);
                        

                    //     const ctx = document.getElementById('myChart').getContext('2d');

                    //     const myChart = new Chart(ctx, {
                    //     type: 'bar',
                    //     data: {
                    //     labels: Object.keys(data),
                    //     datasets: [
                    //         {
                    //             label: ' الطلبات خلال الشهر',
                    //             data: Object.values(data),
                    //         },
                    //     ],
                    //     },


                    // });

                    console.log(response.pro);

                }

         
                                                                   
                                                                                                
            });
           
            
        }

    
  
</script>

@endpush

