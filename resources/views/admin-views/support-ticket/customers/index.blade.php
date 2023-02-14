@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('customers_messages'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header mb-1">
            <div class="flex-between align-items-center">
                <div>
                    <h1 class="page-header-title">{{\App\CPU\translate('customers_messages')}}<span
                            class="badge badge-soft-dark mx-2"></span></h1>
                </div>
                <div>
                    <i class="tio-shopping-cart" style="font-size: 30px"></i>
                </div>
            </div>
            <!-- End Row -->

            <!-- Nav Scroller -->
            <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <span class="hs-nav-scroller-arrow-prev" style="display: none;">
              <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                <i class="tio-chevron-left"></i>
              </a>
            </span>

                <span class="hs-nav-scroller-arrow-next" style="display: none;">
              <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                <i class="tio-chevron-right"></i>
              </a>
            </span>

                <!-- Nav -->
                <ul class="nav nav-tabs page-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">{{\App\CPU\translate('order_list')}}</a>
                    </li>
                </ul>
                <!-- End Nav -->
            </div>
            <!-- End Nav Scroller -->
        </div>
        <!-- End Page Header -->

        <!-- Card -->
        <div class="card">
            <!-- Header -->
            <div class="card-header">
                <div class="row flex-between justify-content-between flex-grow-1">
                    <div class="col-12 col-md-4">
                        <form action="{{ url()->current() }}" method="GET">
                            <!-- Search -->
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control"
                                       placeholder="{{\App\CPU\translate('Search orders')}}" aria-label="Search orders" value=""
                                       required>
                                <button type="submit" class="btn btn-primary">{{\App\CPU\translate('search')}}</button>
                            </div>
                            <!-- End Search -->
                        </form>
                    </div>
                   
                </div>
                <!-- End Row -->
            </div>
            <!-- End Header -->

            <!-- Table -->
            <div class="table-responsive datatable-custom">
                <table class="table text-center table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       style="width: 100%; text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}}">
                    <thead class="thead-light">
                    <tr>
                        <th class="">
                            {{\App\CPU\translate('SL')}}#
                        </th>
                        <th class="">{{\App\CPU\translate('Customer Name')}}</th>
                        <th>{{\App\CPU\translate('message_subject')}}</th>
                        <th>{{\App\CPU\translate('status')}} </th>
                        <th>{{\App\CPU\translate('myDate')}}</th>
                        <th>{{\App\CPU\translate('Show')}}</th>
                        <th>{{\App\CPU\translate('Remove')}}</th>
                    </tr>
                    </thead>

                    @php 
                    $i = 1;
                    @endphp

                    <tbody>
                  
                        @foreach($Customers_Chat as $val)
                        <tr class="class-all">
                            @php($get_customer = DB::table('users')->where('id', '=', $val->user_id)->first())
                            <td class="table-column-pl-0">
                                <a href="">{{$i++}}</a>
                            </td>
                            @php($myDate = date('Y-m-d', strtotime($val->created_at)))
                            <td>{{$get_customer->f_name . ' ' . $get_customer->l_name}}</td>
                            <td style="max-width:5rem;overflow:hidden">{{$val->message}}</td>
                            <td>
                                @if($val->seen_by_admin != null)
                                    <span class="text-secondary">
                                        مقروءه
                                    </span>
                                    @else
                                    <span class="text-success">
                                        غير مقروءه
                                    </span>
                                @endif
                            </td>
                            <td>{{$myDate}}</td>  
                            <td><a href="{{route('admin.customer.chat', ['id' => $val->id])}}" class="btn btn-success">{{\App\CPU\translate('Show')}}</a></td>
                            <td>
                                <form action="{{route('admin.customer.chat.delete')}}" method="post">
                                    @csrf
                                    <input type="hidden" name="myId" value="{{$val->id}}">
                                    <button type="submit" class="btn del_message btn btn-danger">{{\App\CPU\translate('Remove')}}</button>
                                </form>
                               
                            </td> 
                        </tr>
                       @endforeach
                        
                     
                    </tbody>
                </table>
            </div>
            <!-- End Table -->

            <!-- Footer -->
            <div class="card-footer">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-sm-auto">
                        <div class="d-flex justify-content-center justify-content-sm-end">
                            <!-- Pagination -->
                            
                        </div>
                    </div>
                </div>
                <!-- End Pagination -->
            </div>
            <!-- End Footer -->
        </div>
        <!-- End Card -->
    </div>
@endsection

@push('script_2')
    <script>
        function filter_order() {
            $.get({
                url: '{{route('admin.orders.inhouse-order-filter')}}',
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    toastr.success('{{\App\CPU\translate('order_filter_success')}}');
                    location.reload();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        };
    </script>

<script>
            $(document).ready(function(){


                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $('.pending_del').click(function(e) {
                    e.preventDefault();

                   var myId =  $(this).attr('id');

                   $.ajax({
                        type:'GET',
                        url: '/admin/pending-products/delete/'+ myId + "",
                        success: (response) => {
                           
                        Swal.fire(
                        'تم بنجاح',
                        )
                        window.location.reload;
                           
                        }

                    });

                   
                });



            
                $('#adminPendingProEdit').submit(function(e) {
                    e.preventDefault();
                    let formData = new FormData(this);
                    $('#image-input-error').text('');
                    var myId =  $('#myId').attr('id');

                    $.ajax({
                        type:'POST',
                        url: '/admin/pending-product/update/' + myId + '',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: (response) => {
                            if (response) {
                                this.reset();
                                alert('Product Updated successfully');
                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });
                });

            });

        


        </script>
        

@endpush
