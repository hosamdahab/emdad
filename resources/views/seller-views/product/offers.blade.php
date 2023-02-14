@extends('layouts.back-end.app-seller')

@section('title',\App\CPU\translate('product_offers'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('seller.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('product_offers')}}</li>

            </ol>
        </nav>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row flex-between justify-content-between align-items-center flex-grow-1">
                            <div class="col-12 mb-1 col-md-3">
                                <h5>{{ \App\CPU\translate('Product')}} {{ \App\CPU\translate('Table')}} ({{ $products->total() }})</h5>

                            </div>
                        </div>

                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table id="datatable"
                                   style="text-align: center"
                                   class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                   style="width: 100%">
                                <thead class="thead-light">
                                <tr>
                                   
                                    <th>{{\App\CPU\translate('Product Image')}}</th>
                                    <th>{{\App\CPU\translate('Product Name')}}</th>
                                    
                                    <th>{{\App\CPU\translate('Product Size')}}</th>
                                    <th>{{\App\CPU\translate('selling_price')}}</th>
                                    <th>{{__('messages.price_after_discount')}}</th>
                                    <th>{{\App\CPU\translate('offer_start_date')}}</th>
                                    <th>{{\App\CPU\translate('offer_end_date')}}</th>
                                    <th style="width: 5px" class="text-center">{{\App\CPU\translate('Action')}}</th>
                                   
                                </tr>
                                </thead>
                                <tbody>

                                @if(count($products) > 0)

                                
                                @foreach($products as $p)

                                @php($get_brand = DB::table('brands')->where('id', '=', $p->brand_id)->first())
                                @php($get_sub = DB::table('subs_categories')->where('id', '=', $p->sub_category_id)->first())
                                @php($sub_sub_categories = DB::table('sub_sub_categories')->where('id', '=', $p->sub_sub_category_id)->first())
                                @php($category = DB::table('categories')->where('id', '=', $p->category_ids)->first())
                                    <tr>
                                       
                                        <td>
                                        <img src="{{asset('product/thumbnail/'.$p->thumbnail)}}" alt="" width="100" height="100">
                                        </td>
                                        <td><a href="{{route('seller.product.view',[$p['id']])}}">
                                            @isset($p->name)
                                            {{$get_brand->name}} @isset($sub_sub_categories->id) {{$sub_sub_categories->name}} @endisset {{ $p->name }}
                                            @endisset

                                            @empty($p->name)
                                            {{$get_brand->name}} @isset($sub_sub_categories->id) {{$sub_sub_categories->name}} @endisset {{$p->product_type}}
                                            @endempty
                                            </a>
                                        </td>

                                        <td>
                                            <section style="display:flex;justify-content:center">
                                           <span> {{$p->unit_numbers}} {{ $p->unit }}</span>
                                           <span style="margin:0 5px"> x </span>
                                           <span> {{$p->carton_unit}} </span>
                                           </section>
                                        </td>

                                      
                                      
                                        <td>

                                        <a href="{{route('seller.product.view', ['id' => $p->id])}}">{{number_format($p->unit_price,2)}}</a>
                                           
                                        </td>

                                        <td>
                                            @if($p->discount != null)
                                                @php($calc_price = $p->unit_price - $p->discount)

                                                {{$calc_price}}

                                            @else 

                                            لا يوجد عرض
                                            @endif
                                        </td>
                                      
                                        <td>
                                            @if($p->discount_start != null)
                                            {{$p->discount_start}}
                                            @elseif($p->offer_start != null) 
                                            {{$p->offer_start}}
                                            @else 
                                            لا يوجد
                                            @endif
                                        </td>

                                        <td>
                                        
                                        @if($p->discount_end != null)
                                            {{$p->discount_end}}
                                        @elseif($p->offer_end != null)
                                            {{$p->offer_end}}
                                        @else
                                        لا يوجد
                                        @endif
                                        </td>
                                     
                                        <td>

                                        @if($p->offer_price != null)
                                            <form action="{{route('seller.product.offer.delete')}}" method="post" style="display:inline" class="product_offer_delete">
                                                @csrf
                                                <input type="hidden" name="myId" value="{{$p->id}}">
                                            <button class="btn btn-primary" type="submit">الغاء العرض</button>
                                            </form>
                                        @else 
                                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal{{$p->id}}">اضافة عرض</button>
                                        @endif
                                          

                                          @if($p->discount_percent != null)
                                          <form action="{{route('seller.product.discount.delete')}}" class="product_discount_delete" method="post" style="display:inline">
                                            @csrf
                                            <input type="hidden" name="myId" value="{{$p->id}}">
                                          <button class="btn btn-primary" type="submit">الغاء الخصم</button>
                                          </form>
                                          
                                          @else
                                          <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1{{$p->id}}">اضافة خصم</button>
                                          @endif

                                          @include('layouts.back-end.partials-seller.add_offers')
                                          @include('layouts.back-end.partials-seller.add_discount')
                                        </td>
                                    </tr>
                                @endforeach

                                @else 


                                @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Footer -->
                    <div class="card-footer">
                        {{$products->links()}}
                    </div>
                    @if(count($products)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{\App\CPU\translate('No data to show')}}</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <!-- Page level plugins -->
    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

   
    <script>

        $(document).ready(function(){

            $('#add_product_discount').submit(function(e){

                e.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                    type:'POST',
                    url: "{{ route('seller.add.product.discount') }}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            Swal.fire(
                                'تم اضافة الخصم بنجاح',
                                )
                                location.reload();
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
                });

            });



            $('#product_add_offer').submit(function(e){

                e.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                    type:'POST',
                    url: "{{ route('seller.product.add.offer') }}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            Swal.fire(
                                'تم اضافة العرض بنجاح',
                                )
                                location.reload();
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
                });

            });



            $('#product_offer_delete').submit(function(e){

            e.preventDefault();
            let formData = new FormData(this);

            $.ajax({
                type:'POST',
                url: "{{ route('seller.product.add.offer') }}",
                data: formData,
                contentType: false,
                processData: false,
                success: (response) => {
                    if (response) {
                        this.reset();
                        Swal.fire(
                            'تم حذف العرض بنجاح',
                            )
                            location.reload();
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
