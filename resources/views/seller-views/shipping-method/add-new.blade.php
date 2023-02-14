@extends('layouts.back-end.app-seller')

@section('title', \App\CPU\translate('Add Shipping'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb" style="display:flex;justify-content:space-between">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('seller.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('shipping_method')}}</li>

            </ol>
            @php($today = date("Y-m-d"))
            <strong> {{$today}}</strong>
        </nav>

        <div class="row">
            <div class="col-md-12 ">
                {{-- <div class="card" style="height: 200px;">
                    <div class="card-header text-capitalize">
                        <h4>{{\App\CPU\translate('choose_shipping_method')}}</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 text-capitalize" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                                <select class="form-control text-capitalize" name="shippingCategory" onchange="seller_shipping_type(this.value);"
                                            style="width: 100%">
                                    <option value="0" selected disabled>---{{\App\CPU\translate('select')}}---</option>
                                    <option value="order_wise" {{$shippingType=='order_wise'?'selected':'' }} >{{\App\CPU\translate('order_wise')}} </option>
                                    <option  value="category_wise" {{$shippingType=='category_wise'?'selected':'' }} >{{\App\CPU\translate('category_wise')}}</option>
                                    <option  value="product_wise" {{$shippingType=='product_wise'?'selected':'' }}>{{\App\CPU\translate('product_wise')}}</option>
                                </select>
                            </div>
                            <div class="col-12 mt-2" id="product_wise_note">
                                <p class="m-2" style="color: red;">{{\App\CPU\translate('note')}}: {{\App\CPU\translate("Please_make_sure_all_the product's_delivery_charges_are_up_to_date.")}}</p>
                            </div>
                        </div>
                    </div>
                </div> --}}

                <div class="card">
                    <div class="card-header">
                        <a href="{{route('add.new.delivrey.man')}}" class="btn btn-primary">اضافة موصل</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="datatable"
                                   style="text-align:center"
                                   class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                   style="width: 100%">
                                <thead class="thead-light">
                                <tr>
                                    <th>اسم الموصل</th>
                                    <th>المنطقة</th>
                                    <th>عدد الطلبات</th>
                                    <th>المرتجع</th>
                                    <th>الرصيد</th>
                                    <th>تسوية الرصيد</th>
                                    <th>تعديل</th>
                                    <th>حذف</th>
                                </tr>
                                </thead>
                                @foreach($dalivery as $val)
                                <tbody>
                                    <tr>
                                    @php( $get_zone = DB::table('cities')->where('id', [$val->zone_id])->get())
                                    @php( $total_orders = DB::table('orders')->where('delivery_man_id', '=', $val->id)->count('id'))
                                    @php( $total_orders_cancel = DB::table('orders')->where([['delivery_man_id', '=', $val->id],['order_status', '=', 'canceled']])->count('id'))
                                    @php( $total = DB::table('orders')->where([['delivery_man_id', '=', $val->id],['order_status', '=', 'delivered'], ['payment_status', '=', 'unpaid']])->sum('order_amount'))
                                      
                                        <td>
                                            <a href="#">
                                                {{$val->f_name . ' '. $val->l_name}} 
                                            </a>
                                        </td>
                                        <td>
                                           
                                            @foreach($get_zone as $val)
                                            {{$val->name}}
                                            @endforeach
                                           
                                        </td>
                                        <td>
                                            {{$total_orders}}
                                        </td>
                                        <td>
                                           {{$total_orders_cancel}}
                                        </td>
                                        <td>
                                           
                                            <span class="bg-light rounded-pill p-2">
                                                {{number_format($total,2)}} ريال
                                            </span>
                                        </td>

                                        <td>
                                            @if($total > 0)
                                            <form action="{{route('seller.delivery.payment')}}" method="post" id="delivery_payment">
                                                @csrf
                                                <input type="hidden" name="delivery_man_id" value="{{$val->id}}">
                                                <button type="submit" class="btn btn-primary">تسوية الرصيد</button>
                                            </form>
                                            @endif
                                        </td>


                                        <td>
                                            <a href="{{route('seller.delivery.edit', ['id' => $val->id])}}" class="btn btn-warning">تعديل</a>
                                        </td>

                                        <td>
                                            <form action="{{route('seller.delivery.delete')}}" method="post" id="seller_delivery_delete">
                                                @csrf
                                                <input type="hidden" name="myId" value="{{$val->id}}">
                                                <button type="submit" class="btn btn-danger">حذف</button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   
    </div>
@endsection

@push('script')
<script>
        // Call the dataTables jQuery plugin
      
    
    </script>
    <script>
       
    </script>
@endpush
