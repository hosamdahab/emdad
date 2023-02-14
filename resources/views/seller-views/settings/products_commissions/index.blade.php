@extends('layouts.back-end.app-seller')

@section('title', 'منتجاتي')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header mb-1">
            <div class="flex-between align-items-center">
                <div>
                    <h1 class="page-header-title"><span
                            class="badge badge-soft-dark mx-2"></span></h1>
                </div>
                <div>
                    <i class="tio-shopping-cart" style="font-size: 30px"></i>
                </div>
                
            </div>
            <!-- End Row -->
            <h3 style="text-align:right">عمولات الشراء</h3>
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

           
            </div>
            <!-- End Nav Scroller -->
        </div>
        <!-- End Page Header -->

        <!-- Card -->
        <div class="card">
          

            <!-- Table -->
            <div class="table-responsive datatable-custom">
                <table class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       style="width: 100%; text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}}">
                    <thead class="thead-light">
                    <tr>
                        <th class="">
                            {{\App\CPU\translate('SL')}}#
                        </th>
                        <th>{{__('messages.Product_Image')}}</th>
                        <th>{{__('messages.Product name is required!')}}</th>
                        <th>{{__('messages.Product Size')}}</th>
                        <th>{{__('messages.commissions')}}</th>
                    </tr>
                    </thead>

                    @php 
                    $i = 1;
                    @endphp

                    <tbody>
                    @foreach($data as $order)

                    @php 
                    $get_seller = \App\Model\Seller::where('id', '=', $order->seller_id)->first();
                    $get_brand = \App\Model\Brand::where('id', '=', $order->brand_id)->first();
                    @endphp

                        <tr class="class-all">
                           
                            <td class="table-column-pl-0">
                                <a href="{{route('admin.orders.details',['id'=>$order->id])}}">{{$i++}}</a>
                            </td>

                            <td><img src="{{asset('product/thumbnail/'.$order->thumbnail)}}" alt="" width="100" height="100"></td>
                            @empty($order->name)
                                <td>{{$get_brand->name}} {{$order->product_type}}</td>
                            @endempty

                            @isset($order->name)
                            <td>{{$get_brand->name}} {{$order->name}}</td>
                            @endisset

                            <td>{{$order->unit_numbers}} {{$order->unit}}</td>

                            @empty($order->sales_commissions)
                            <td>
                        
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal{{$order->id}}">اضافة عمولة</button>
                               
                                 <!-- Modal 1 -->
                                    <div class="modal fade" id="exampleModal{{$order->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">العمولة علي المبيعات</h1>
                                        </div>
                                        <div class="modal-body">
                                            
                                            <form id="myForm" method="post" action="{{route('seller.commissions.sale.pro.store')}}">
                                                @csrf
                                            <div class="mb-3">
                                                <label for="exampleInputEmail1" class="form-label">الحد الادني للشراء</label>
                                                <input type="number" placeholder="عدد الكراتين" name="commissions_min_purchasing" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                            </div>

                                            <div class="mb-3">
                                                <label for="exampleInputPassword1" class="form-label">نسبة العمولة</label>
                                                <input type="number" placeholder="نسبة العمولة" name="commissions_purchasing_percent" class="form-control" id="exampleInputPassword1">
                                            </div>
                                           
                                            <input type="hidden" name="product_id" value="{{$order->id}}">
                                            
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">الغاء</button>
                                            <button type="submit" class="btn btn-primary">حفظ</button>
                                       
                                            </form>
                                        
                                        </div>
                                       
                                        </div>
                                    </div>
                                    </div>
                                    <!-- Modal 1 -->
                               
                            </td>
                            @endempty

                            @isset($order->sales_commissions)
                            <td>
                            
                                <form action="{{route('seller.product.commissions.delete')}}" method="post" id="commissions_sale_form_deletes">
                                    @csrf 
                                    <input type="hidden" name="product_id" value="{{$order->id}}">
                                    <button class="btn btn-primary" type="submit">الغاء التفعيل</button>
                                </form>
                               
                            </td>
                            @endisset
                         
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
