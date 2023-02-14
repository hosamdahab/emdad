@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('pending_products'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header mb-1">
            <div class="flex-between align-items-center">
                <div>
                    <h1 class="page-header-title">{{\App\CPU\translate('pending_products')}}<span
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
                <table class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       style="width: 100%; text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}}">
                    <thead class="thead-light">
                    <tr>
                        <th class="">
                            {{\App\CPU\translate('SL')}}#
                        </th>
                        <th class="">{{\App\CPU\translate('seller_name')}}</th>
                        <th>{{\App\CPU\translate('Product_Name')}}</th>
                        <th>{{\App\CPU\translate('product_type')}}</th>
                        <th>{{\App\CPU\translate('Unit')}}</th>
                        <th>{{\App\CPU\translate('Product Quantity')}}</th>
                        <th>{{\App\CPU\translate('Unit price')}}</th>
                        <th>{{\App\CPU\translate('Purchase price')}}</th>
                        <th>{{\App\CPU\translate('stock_limit_products_list')}}</th>
                        <th>{{\App\CPU\translate('Image')}}</th>
                        <th>{{\App\CPU\translate('pro_review')}}</th>
                        <th>{{\App\CPU\translate('Remove')}}</th>
                    </tr>
                    </thead>

                    @php 
                    $i = 1;
                    @endphp

                    <tbody>
                    @foreach($data as $order)

                    @php 
                    $get_seller = \App\Model\Seller::where('id', '=', $order->seller_id)->first();
                    @endphp

                        <tr class="class-all">
                           
                            <td class="table-column-pl-0">
                                <a href="{{route('admin.orders.details',['id'=>$order->id])}}">{{$i++}}</a>
                            </td>

                            <td>{{$get_seller->f_name}}</td>
                            <td>{{$order->product_name}}</td>
                            <td>{{$order->product_type}}</td>
                            <td>{{$order->product_size}}</td>
                            <td>{{$order->qty_in_unit}}</td>
                            <td>{{$order->product_price}}</td>
                            <td>{{$order->purchase_price}}</td>
                            <td>{{$order->qty_in_stock}}</td>
                            <td><img src="{{asset('product/'.$order->product_image)}}" alt="" width="100" height="100"></td>
                            
                            <td>
                            <button class="btn" data-toggle="modal" data-target=".example-modal{{$order->id}}">
                             مراجعة
                            </button>
                          
                               
                            </td> 

                            <td>
                            <a href="{{route('admin.pending.products.delete',['id' => $order->id])}}" id="{{$order->id}}" class="btn pending_del">حذف</a>
                               
                            </td> 
                        </tr>
                       
                        
                        @include('admin-views.pending_products.edit')
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
                            {!! $data->links() !!}
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
                        location.reload;
                           
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
