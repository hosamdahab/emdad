@extends('layouts.back-end.app-seller')

@section('title',\App\CPU\translate('Order Details'))

@push('css_or_js')

<style>

#myDelivery , #orderAccept {

    display:none
}

</style>

@endpush

@section('content')
    <!-- Page Heading -->
    <div class="content container-fluid">

        <div class="page-header d-print-none p-3 pb-0" style="background: white">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <nav aria-label="breadcrumb" class="d-flex justify-content-between">
                        <ol class="breadcrumb breadcrumb-no-gutter">
                            <li class="breadcrumb-item"><a class="breadcrumb-link"
                                                           href="{{route('seller.orders.list','all')}}">{{\App\CPU\translate('Orders')}}</a>
                            </li>
                            <li class="breadcrumb-item active"
                                aria-current="page">{{\App\CPU\translate('Order details')}}</li>
                        </ol>
                        
                        <div class="card">
                            <div class="card-body">
                                {{$order->created_at->format('M d Y')}} | {{$order->created_at->format('D')}}
                            </div>
                        </div>
                    </nav>

                </div>

            </div>
        </div>
      
        <div class="card">
            <div class="card-body d-flex justify-content-between">
                <div>
                    <h5 class="text-muted">تاريخ التوصيل</h5>
                    <section class="d-flex">
                    <span>{{ date('D',strtotime($order->created_at))}} | </span>
                    <span>{{ date('Y d M',strtotime($order->created_at))}}</span>
                    </section>
                </div>
                <div>
                    <h5 class="text-muted">وقت التوصيل</h5>
                    <span>{{$order->timeToDelivery}}</span>
                </div>
                <div>
                    <h5 class="text-muted">الاجمالى</h5>
                    <span>{{$order->order_amount}} ريال</span>
                </div>

                @if ($order->order_status == 'pending')

                @php 

                    $get_del = \App\Model\DeliveryMan::where('seller_id', '=', $order->seller_id)->get();
                @endphp
                <select name="myDelivery" id="myDelivery" class="form-control col-1">
                    <option selected>اضافة موصل</option>
                    @foreach($get_del as $val)
                    <option value="{{$val->id}}">{{$val->f_name}}</option>
                    @endforeach
                </select>

                <section style="width:25rem;display:flex">
                    <div style="padding-right: 40%">
                    
                        <form id="orderAccept" action="{{route('seller.order.accept', ['id' => $order->id])}}" method="POST">
                            @csrf
                            <input type="hidden" name="myId" value="{{$order->id}}">
                            <input type="hidden" name="deliveryId" id="deliveryId">
                            <button type="submit"  class="btn btn-primary rounded-pill" style="background: #645cb3;border:none">اسناد</button>
                            
                        </form>
                        <button type="button"  class="btn btn-primary rounded-pill" id="add_delivery" style="background: #645cb3;border:none">تاكيد الطلب</button>
                    </div>
                    <div>
                        
                        <form action="" method="POST" id="order_status_0">
                            @csrf
                            <button type="button" onclick="check0()" class="btn btn-danger rounded-pill">رفض الطلب</button>
                        </form>
                    </div>
                </section>
                @else
                    <div>
                        <h5 class="text-muted">تغير الحالة</h5>
                        <select name="order_status" onchange="order_status(this.value)" class="form-control rounded-pill">
                            <option value="confirmed" {{ $order_status->order_status == 'confirmed' ? 'selected' : '' }} >مؤكد</option>
                            <option value="processing" {{ $order_status->order_status == 'processing' ? 'selected' : '' }}>قيد التحضير</option>
                            <option value="out_for_delivery" {{ $order_status->order_status == 'out_for_delivery' ? 'selected' : '' }}>جاهز للاستلام</option>
                        </select>
                    </div>

                    <section style="width:25rem;display:flex">
                        <div style="padding-right: 25%;">
                            <a id="orderAccept" href="#" class="btn btn-primary rounded-pill" style="background: #645cb3;border:none">تاكيد الطلب</a>
                        </div>

                        <div style="padding-right: 25%;">
                            <a href="#" class="btn btn-primary rounded-pill" style="background: #e34d73;border:none">الغاء الطلب</a>
                        </div>
                    </section>
                @endif
            </div>

        </div>

        <div class="card mt-3">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="datatable" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                           class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                           style="width: 100%">
                        <thead class="thead-light">
                        <tr>
                            <th>{{\App\CPU\translate('Product Image')}}</th>
                            <th>{{\App\CPU\translate('Product Code')}}</th>
                            <th>{{\App\CPU\translate('Product Name')}}</th>
                            <th>{{__('messages.product_unit')}}</th>
                            <th>{{\App\CPU\translate('Quantity')}} * {{\App\CPU\translate('Unit price')}}</th>
                            <th>{{\App\CPU\translate('Amount')}} </th>
                        </tr>
                        </thead>
                        <tbody>
                       
                        @foreach($order_details as $val)

                        @php 

                        $getPro = DB::table('products')->where('id', '=', $val->product_id)->first();

                        @endphp

                                <tr>
                                    
                                    <td>
                                        <div
                                            class="avatar avatar-xl {{Session::get('direction') === "rtl" ? 'ml-3' : 'mr-3'}}">
                                            <img class="img-fluid"
                                                    onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                    src="{{asset('product/thumbnail/'.$getPro->thumbnail)}}"
                                                    alt="Image Description">
                                        </div>
                                    </td>
                                    <td>
                                    {{ $getPro->sku }}
                                    </td>
                                   
                                    @if($getPro->name !== '')
                                    <td>{{ $getPro->name }}</td>
                                    @else 
                                    <td>{{ $getPro->product_type }}</td>
                                    @endif
                                  
                                    <td>{{  $getPro->carton_unit }} * {{  $getPro->unit }} {{  $getPro->unit_numbers }}</td>
                                    <td>
                                        {{ $val->qty }} * {{ number_format($val->price,2) }} ريال
                                    </td>
                                    @php  

                                     $total = number_format($val->price,2) * $val->qty;

                                    @endphp
                                    <td>
                                        {{ number_format($total,2) }} ريال
                                    </td>

                                    
                                </tr>
                                @endforeach
                          
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

@endsection
@push('script')
    <script>
        $(document).on('change', '.payment_status', function () {
            var id = $(this).attr("data-id");
            var value = $(this).val();
            Swal.fire({
                title: '{{\App\CPU\translate('Are you sure Change this?')}}',
                text: "{{\App\CPU\translate('You wont be able to revert this!')}}",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{\App\CPU\translate('Yes, Change it')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('seller.orders.payment-status')}}",
                        method: 'POST',
                        data: {
                            "id": id,
                            "payment_status": value
                        },
                        success: function (data) {
                            toastr.success('{{\App\CPU\translate('Status Change successfully')}}');
                            location.reload();
                        }
                    });
                }
            })
        });

        function order_status(status) {
            var value = status;
            Swal.fire({
                title: 'هل انت متاكد من تغير الحالة؟',
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                cancelButtonText: 'لا',
                confirmButtonText: 'نعم',
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('seller.orders.status')}}",
                        method: 'POST',
                        data: {
                            "id": '{{$order['id']}}',
                            "order_status": value
                        },
                        success: function (data) {
                            if (data.success == 0) {
                                toastr.success('{{\App\CPU\translate('Order is already delivered, You can not change it !!')}}');
                                location.reload();
                            } else {
                                toastr.success('تم تغير حالة الطلب بنجاح');
                                location.reload();
                            }
                        }
                    });
                }
            })
        }
    </script>
<script>
    $( document ).ready(function() {
        let delivery_type = '{{$order->delivery_type}}';

        if(delivery_type === 'self_delivery'){
            $('#choose_delivery_man').show();
            $('#by_third_party_delivery_service_info').hide();
        }else if(delivery_type === 'third_party_delivery')
        {
            $('#choose_delivery_man').hide();
            $('#by_third_party_delivery_service_info').show();
        }else{
            $('#choose_delivery_man').hide();
            $('#by_third_party_delivery_service_info').hide();
        }
    });
</script>
<script>
    function choose_delivery_type(val)
    {

        if(val==='self_delivery')
        {
            $('#choose_delivery_man').show();
            $('#by_third_party_delivery_service_info').hide();
        }else if(val==='third_party_delivery'){
            $('#choose_delivery_man').hide();
            $('#by_third_party_delivery_service_info').show();
            $('#shipping_chose').modal("show");
        }else{
            $('#choose_delivery_man').hide();
            $('#by_third_party_delivery_service_info').hide();
        }

    }
</script>
    <script>
        function addDeliveryMan(id) {
            $.ajax({
                type: "GET",
                url: '{{url('/')}}/seller/orders/add-delivery-man/{{$order['id']}}/' + id,
                data: {
                    'order_id': '{{$order['id']}}',
                    'delivery_man_id': id
                },
                success: function (data) {
                    if (data.status == true) {
                        toastr.success('Delivery man successfully assigned/changed', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    } else {
                        toastr.error('Deliveryman man can not assign/change in that status', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    }
                },
                error: function () {
                    toastr.error('Add valid data', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        }

        function last_location_view() {
            toastr.warning('Only available when order is out for delivery!', {
                CloseButton: true,
                ProgressBar: true
            });
        }

        function waiting_for_location() {
            toastr.warning('{{\App\CPU\translate('waiting_for_location')}}', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
    {{-- <script
        src="https://maps.googleapis.com/maps/api/js?key={{\App\CPU\Helpers::get_business_settings('map_api_key')}}&v=3.45.8"></script>
    <script>

        function initializegLocationMap() {
            var map = null;
            var myLatlng = new google.maps.LatLng({{$shipping_address->latitude}}, {{$shipping_address->longitude}});
            var dmbounds = new google.maps.LatLngBounds(null);
            var locationbounds = new google.maps.LatLngBounds(null);
            var dmMarkers = [];
            dmbounds.extend(myLatlng);
            locationbounds.extend(myLatlng);

            var myOptions = {
                center: myLatlng,
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP,

                panControl: true,
                mapTypeControl: false,
                panControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_CENTER
                },
                zoomControl: true,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.LARGE,
                    position: google.maps.ControlPosition.RIGHT_CENTER
                },
                scaleControl: false,
                streetViewControl: false,
                streetViewControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_CENTER
                }
            };
            map = new google.maps.Map(document.getElementById("location_map_canvas"), myOptions);
            console.log(map);
            var infowindow = new google.maps.InfoWindow();

            @if($shipping_address && isset($shipping_address))
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng({{$shipping_address->latitude}}, {{$shipping_address->longitude}}),
                map: map,
                title: "{{$order->customer['f_name']??""}} {{$order->customer['l_name']??""}}",
                icon: "{{asset('public/assets/front-end/img/customer_location.png')}}"
            });

            google.maps.event.addListener(marker, 'click', (function (marker) {
                return function () {
                    infowindow.setContent("<div style='float:left'><img style='max-height:40px;wide:auto;' src='{{asset('storage/app/public/profile/')}}{{$order->customer->image??""}}'></div><div style='float:right; padding: 10px;'><b>{{$order->customer->f_name??""}} {{$order->customer->l_name??""}}</b><br/>{{$shipping_address->address}}</div>");
                    infowindow.open(map, marker);
                }
            })(marker));
            locationbounds.extend(marker.getPosition());
            @endif

            google.maps.event.addListenerOnce(map, 'idle', function () {
                map.fitBounds(locationbounds);
            });
        }

        // Re-init map before show modal
        $('#locationModal').on('shown.bs.modal', function (event) {

            initializegLocationMap();
        });
    </script> --}}

    <script>
        function check(){
            Swal.fire({
                title: 'هل انت متاكد من تاكيد الطلب؟',
                text: '',
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#377dff',
                cancelButtonText: 'لا',
                confirmButtonText: 'نعم',
                reverseButtons: true
            }).then((result) => {
                if(result.value == true){
                    $('#order_status').submit();
                }
            })
        };
    </script>
    <script>
        function check0(){
            Swal.fire({
                title: 'هل انت متاكد من الغاء الطلب؟',
                text: '',
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#377dff',
                cancelButtonText: 'لا',
                confirmButtonText: 'نعم',
                reverseButtons: true
            }).then((result) => {
                if(result.value == true){
                    $('#order_status_0').submit();
                }
            })
        };
    </script>





@endpush
