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
            <h3>عمولات الموصلين</h3>
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

                            @empty($order->commissions_min_delivery)
                            <td>
                        
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal{{$order->id}}">اضافة عمولة</button>
                               
                                 <!-- Modal 1 -->
                                    <div class="modal fade" id="exampleModal{{$order->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">العمولة علي التوصيل</h1>
                                        </div>
                                        <div class="modal-body">
                                            
                                            <form id="delivery_commissions_stores" method="post" action="{{route('seller.delivery.product.commissions.store')}}">
                                                @csrf

                                                @php($branches = DB::table('branche')->where('user_id', '=', auth('seller')->id())->get())
                                                <div class="mb-3">
                                                <label for="exampleInputEmail1" class="form-label">اختار الفرع</label>
                                                    <select name="branche_id" class="form-control rounded-pill">
                                                        
                                                        @foreach ($branches as $branche)
                                                            <option value="{{ $branche->id }}">{{ $branche->branche_name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                            <div class="mb-3">
                                                <label for="exampleInputEmail1" class="form-label">الحد الادني لللتوصيل</label>
                                                <input type="number" placeholder="عدد الكراتين" name="commissions_min_delivery" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                            </div>

                                            <div class="mb-3">
                                                <label for="exampleInputPassword1" class="form-label">نسبة العمولة</label>
                                                <input type="number" placeholder="نسبة العمولة" name="commissions_delivery_percent" class="form-control" id="exampleInputPassword1">
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

                            @isset($order->commissions_min_delivery)
                            <td>
                            
                                <form action="{{route('seller.product.delivery.commissions.delete')}}" method="post" id="commissions_delivery_form_deletes">
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



@endpush
