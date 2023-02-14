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
                    <h3 class="page-header-title">البيع الاجل<span
                            class="badge badge-soft-dark mx-2"></span></h3>
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
                        <th>{{__('messages.deferred_sale')}}</th>
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

                            @empty($order->deferred)
                            <td>
                              

                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target=".exampleModal">
                                اضافة
                                </button>

                                @include('seller-views.settings.partial.delayed')
                            </td>
                            @endempty

                            @isset($order->deferred)
                            <td>
                            
                                <form action="{{route('seller.product.deferred.delete')}}" method="post" id="deferred_sale_form_deletes">
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

