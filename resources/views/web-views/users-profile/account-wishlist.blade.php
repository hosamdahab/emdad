@extends('layouts.front-end.app')

@section('title','المفضلة')

@push('css_or_js')
    <meta property="og:image" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']}}"/>
    <meta property="og:title" content="Products of {{$web_config['name']}} "/>
    <meta property="og:url" content="{{env('APP_URL')}}">
    <meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <meta property="twitter:card" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']}}"/>
    <meta property="twitter:title" content="Products of {{$web_config['name']}}"/>
    <meta property="twitter:url" content="{{env('APP_URL')}}">
    <meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <style>
        .headerTitle {
            font-size: 26px;
            font-weight: bolder;
            margin-top: 3rem;
        }

        .for-count-value {
            position: absolute;

        {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 0.6875 rem;;
            width: 1.25rem;
            height: 1.25rem;
            border-radius: 50%;

            color: black;
            font-size: .75rem;
            font-weight: 500;
            text-align: center;
            line-height: 1.25rem;
        }

        .for-count-value {
            position: absolute;

        {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 0.6875 rem;
            width: 1.25rem;
            height: 1.25rem;
            border-radius: 50%;
            color: #fff;
            font-size: 0.75rem;
            font-weight: 500;
            text-align: center;
            line-height: 1.25rem;
        }

        .for-brand-hover:hover {
            color: {{$web_config['primary_color']}};
        }

        .for-hover-lable:hover {
            color: {{$web_config['primary_color']}}       !important;
        }

        .page-item.active .page-link {
            background-color: {{$web_config['primary_color']}}      !important;
        }

        .page-item.active > .page-link {
            box-shadow: 0 0 black !important;
        }

        .for-shoting {
            font-weight: 600;
            font-size: 14px;
            padding- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 9px;
            color: #030303;
        }

        .sidepanel {
            width: 0;
            position: fixed;
            z-index: 6;
            height: 500px;
            top: 0;
        {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 0;
            background-color: #ffffff;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 40px;
        }

        .sidepanel a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidepanel a:hover {
            color: #f1f1f1;
        }

        .sidepanel .closebtn {
            position: absolute;
            top: 0;
        {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 25 px;
            font-size: 36px;
        }

        .openbtn {
            font-size: 18px;
            cursor: pointer;
            background-color: transparent !important;
            color: #373f50;
            width: 40%;
            border: none;
        }

        .openbtn:hover {
            background-color: #444;
        }

        .for-display {
            display: block !important;
        }

        @media (max-width: 360px) {
            .openbtn {
                width: 59%;
            }

            .for-shoting-mobile {
                margin- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 0% !important;
            }

            .for-mobile {

                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10% !important;
            }

        }

        @media (max-width: 500px) {
            .for-mobile {

                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 27%;
            }

            .openbtn:hover {
                background-color: #fff;
            }

            .for-display {
                display: flex !important;
            }

            .for-tab-display {
                display: none !important;
            }

            .openbtn-tab {
                margin-top: 0 !important;
            }

        }

        @media screen and (min-width: 500px) {
            .openbtn {
                display: none !important;
            }


        }

        @media screen and (min-width: 800px) {


            .for-tab-display {
                display: none !important;
            }

        }

        @media (max-width: 768px) {
            .headerTitle {
                font-size: 23px;

            }

            .openbtn-tab {
                margin-top: 3rem;
                display: inline-block !important;
            }

            .for-tab-display {
                display: inline;
            }
        }

        .subs_cat form{

            margin:10px 0;

        }


        #wishlistIcon2 {

            display:none
        }
    </style>
@endpush

@section('content')
    <!-- Page Title-->

   <div class="row">
        <div class="col-12" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <p style="margin:40px 40px 0px 40px;font-weight: 600;font-size: 18px;">المفضلة</p>
                </div>
        <div class="sub-cats col-12" style="display:flex;justify-content:flex-end; margin-right:20px;padding:20px">

        <div class="col-12">
            <div class="col-md-3">
                <a class="openbtn-tab mt-5" onclick="openNav()">
                    <div style="font-size: 20px; font-weight: 600; " class="for-tab-display mt-5">
                        <i class="fa fa-filter"></i>
                        {{\App\CPU\translate('filter')}}
                    </div>
                </a>
            </div>
            
        </div>
   
    @isset($sub_cats)
    <div class="subs_cat col-12" style="display:flex;justify-content: space-around;margin:0 20px;flex-wrap:wrap">
        @foreach($sub_cats as $val)

        <form action="{{route('sub.category.search')}}" method="post" id="sub_filters">
            @csrf
            <input type="hidden" name="myId" value="{{$val->id}}">
            <button type="submit" id="all" class="btn" style="border:1px solid #ecedee;#6c6f7f;font-weight:700;font-size:16px;background:white;border-radius:8px;padding:9px 24px;margin:0 15px">{{$val->name}}</button>
        </form>
        @endforeach
    </div>
    @endisset

        <!-- <button id="all" class="btn" style="background-color:#5044b8;color:#ffffff">الكل</button> -->
    </div>
   </div>

    <!-- Page Content-->
    <div class="container pb-5 mb-2 mb-md-4 rtl"
         style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <div class="row">
           
            <div id="mySidepanel" class="sidepanel">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                <aside class="" style="padding-right: 5%;padding-left: 5%;">
                    <div class="" id="shop-sidebar" style="margin-bottom: -10px;">
                        <div class=" box-shadow-sm">

                        </div>
                        <div class="" style="padding-top: 12px;">
                            <!-- Filter -->
                            <div class="widget cz-filter" style="width: 100%">
                                <div style="text-align: center" >
                                    <span class="widget-title" style="font-weight: 600;">{{\App\CPU\translate('filter')}}</span>
                                </div>
                                <div class="" style="width: 100%">
                                    <label class="opacity-75 text-nowrap for-shoting" for="sorting"
                                           style="width: 100%; padding-{{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 0">
                                        <select style="background: whitesmoke; appearance: auto;width: 100%"
                                                class="form-control custom-select" id="searchByFilterValue">
                                            <option selected disabled>{{\App\CPU\translate('Choose')}}</option>
                                            <option
                                                value="">{{\App\CPU\translate('best_selling_product')}}</option>
                                            <option
                                                value="">{{\App\CPU\translate('top_rated')}}</option>
                                            <option value="">{{\App\CPU\translate('most_favorite')}}</option>
                                            <option value="">{{\App\CPU\translate('featured_deal')}}</option>
                                        </select>
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--Price Sidebar-->
                    <div class="" id="shop-sidebar" style="margin-bottom: -10px;">
                        <div class=" box-shadow-sm">

                        </div>
                        <div class="" style="padding-top: 12px;">
                            <!-- Filter by price-->
                            <div class="widget cz-filter mb-4 pb-4 mt-2">
                                <h3 class="widget-title" style="font-weight: 700;">{{\App\CPU\translate('Price')}}</h3>
                                <div class="divider-role"
                                     style="border: 1px solid whitesmoke; margin-bottom: 14px;  margin-top: -6px;"></div>
                                <div class="input-group-overlay input-group-sm mb-1">
                                    <input style="background: aliceblue;"
                                           class="cz-filter-search form-control form-control-sm appended-form-control"
                                           type="number" value="0" min="0" max="1000000" id="min_price">
                                    <div class="input-group-append-overlay">
                                    <span style="color: #3498db;" class="input-group-text">
                                        {{\App\CPU\currency_symbol()}}
                                    </span>
                                    </div>
                                </div>
                                <div>
                                    <p style="text-align: center;margin-bottom: 1px;">{{\App\CPU\translate('to')}}</p>
                                </div>
                                <div class="input-group-overlay input-group-sm mb-2">
                                    <input style="background: aliceblue;" value="100" min="100" max="1000000"
                                           class="cz-filter-search form-control form-control-sm appended-form-control"
                                           type="number" id="max_price">
                                    <div class="input-group-append-overlay">
                                        <span style="color: #3498db;" class="input-group-text">
                                            {{\App\CPU\currency_symbol()}}
                                        </span>
                                    </div>
                                </div>

                                <div class="input-group-overlay input-group-sm mb-2">
                                    <button class="btn btn-primary btn-block"
                                            onclick="searchByPrice()">
                                        <span>{{\App\CPU\translate('search')}}</span>
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Brand Sidebar-->
                    <div class="" id="shop-sidebar" style="margin-bottom: 11px;">

                        <div class="">
                            <!-- Filter by Brand-->
                            <div class="widget cz-filter mb-4 pb-4 border-bottom mt-2">
                                <h3 class="widget-title" style="font-weight: 700;">{{\App\CPU\translate('brands')}}</h3>
                                <div class="divider-role"
                                     style="border: 1px solid whitesmoke; margin-bottom: 14px;  margin-top: -6px;"></div>
                                <div class="input-group-overlay input-group-sm mb-2">
                                    <input style="background: aliceblue"
                                           class="cz-filter-search form-control form-control-sm appended-form-control"
                                           type="text" id="search-brand-m">
                                    <div class="input-group-append-overlay">
                                        <span style="color: #3498db;"
                                              class="input-group-text">
                                            <i class="czi-search"></i>
                                        </span>
                                    </div>
                                </div>
                                <ul id="lista1" class="widget-list cz-filter-list list-unstyled pt-1"
                                    style="max-height: 12rem;"
                                    data-simplebar data-simplebar-auto-hide="false">
                                    @foreach(\App\CPU\BrandManager::get_brands() as $brand)
                                        <div class="brand mt-4 for-brand-hover" id="brand">
                                            <li style="cursor: pointer;padding: 2px"
                                                onclick="location.href='{{route('products',['id'=> $brand['id'],'data_from'=>'brand','page'=>1])}}'">
                                                {{ $brand['name'] }}
                                                @if($brand['brand_products_count'] > 0 )

                                                    <span class="for-count-value"
                                                          style="float: {{Session::get('direction') === "rtl" ? 'left' : 'right'}}">{{ $brand['brand_products_count'] }}</span>

                                                @endif
                                            </li>

                                        </div>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                  
                </aside>
            </div>

            <!-- Content  -->
            <section class="col-lg-12">
                {{-- <div class="col-md-12"> --}}
                    <div class="row">
                        <div class="col-md-6 d-flex  align-items-center">
                            {{-- if need data from also --}}
                            {{-- <h1 class="h3 text-dark mb-0 headerTitle text-uppercase">{{\App\CPU\translate('product_by')}} {{$data['data_from']}} ({{ isset($brand_name) ? $brand_name : $data_from}})</h1> --}}
                            <h1 class="{{Session::get('direction') === "rtl" ? 'mr-3' : 'ml-3'}}">
                            
                                <label id="price-filter-count">  {{\App\CPU\translate('items found')}} </label>
                            </h1>
                        </div>
                        <div class="col-md-6 m-2 m-md-0 d-flex  align-items-center ">
    
                            <button class="openbtn text-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}" onclick="openNav()">
                                <div >
                                    <i class="fa fa-filter"></i>
                                    {{\App\CPU\translate('filter')}}
                                </div>
                            </button>
    
                            <div class="" style="width: 100%">
                                <form id="filters-search-form" action="{{ route('product.filters.serach') }}" method="POST">
                                    @csrf
                                    <div class=" {{Session::get('direction') === "rtl" ? 'ml-2 float-left' : 'mr-2 float-right'}}">
                                        
                                        <select name="pro_filters" class="form-control" id="pro_filters" style="background: white; appearance: auto;border-radius: 5px;border: 1px solid rgba(27, 127, 237, 0.5);padding:5px;">
                                            <option value="latest">{{__('messages.latest')}}</option>
                                            <option
                                                value="high-price">{{__('messages.high_price')}}</option>
                                            <option
                                                value="low-price">{{__('messages.low_price')}}</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="category_ids" id="category_ids" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                {{-- </div> --}}
              
                   <!-- Get Products -->
                    <div class="text-center pt-5">
                    <div class="row" id="pro_row">
                       @foreach($wishlist as $list)

                       @php 
                        $pro = DB::table('products')->where('id', '=', $list->product_id)->first();
                       $shop_info = DB::table('shops')->where('seller_id', '=', $pro->user_id)->first();
                       $user = App\CPU\Helpers::get_customer();

                       $Brand = DB::table('brands')->where('id','=', $pro->brand_id)->first();

                       $sub_sub_category = DB::table('sub_sub_categories')->where('id','=', $pro->sub_sub_category_id)->first();

                       @endphp
                      
                       <div class="card" style="width: 18rem;">
                       <form action="{{route('customers.wishlists.delete')}}" method="post" id="wishlists_delete" style="position:absolute;left:0.5rem;top:0.5rem;z-index:1000">
                            @csrf
                            
                            <input type="hidden" name="wishlist_id" value="{{ $list->id }}">
                            <button type="submit"  class="btn for-hover-bg" style="color:{{$web_config['secondary_color']}};font-size: 18px;">
                            <i class="fa fa-heart" aria-hidden="true" id="test2" style="cursor:pointer"></i>
                            <i class="fa fa-heart-o"
                                        aria-hidden="true" id="wishlistIcon2"></i>
                            </button>
                        </form>

                            <a href="{{route('product.view', ['id' => $pro->id])}}">
                            <img src="{{asset('product/thumbnail/'.$pro->thumbnail)}}" draggable="false" class="card-img-top" alt="{{$pro->name}}" style="width:100%;height:200px">
                            </a>
                            <div class="card-body">

                                @isset($pro->name)
                                <section class="d-flex">
                                <h5 class="card-title" style="padding:0;margin:0"><a href="{{route('product.view', ['id' => $pro->id])}}">{{$Brand->name}}   {{$Category->name}} {{$pro->product_type}}</a></h5>
                                </section>
                                @endisset

                                @empty($pro->name)

                                <section class="d-flex">
                                <h5 class="card-title" style="padding:0;margin:0"><a href="{{route('product.view', ['id' => $pro->id])}}">{{$Brand->name}}  @isset($sub_sub_category->name) {{$sub_sub_category->name}} @endisset  {{$pro->product_type}}</a></h5>
                                </section>
                                @endempty

                               

                                <section class="d-flex">
                                <span>{{$pro->carton_unit}}</span>
                                <span> x </span>
                                <span>{{$pro->unit_numbers}} {{$pro->unit}}</span>
                                </section>
                                

                                <section class="d-flex" style="margin-top:20px">
                                <span><strong>{{$pro->unit_price. ' ريال'}} </strong> ({{round($pro->unit_price / $pro->carton_unit, 2).' ريال للحبة'}})</span>
                                </section>
                                <br>

                                @if(auth('customer')->check())
                                <form action="{{route('add.to.cart')}}" method="post" id="category_pro_add_cart">
                                    @csrf
                                    <input type="hidden" name="product_id" value="{{ $pro->id }}">
                                    <input type="hidden" name="brand_id" value="{{ $pro->brand_id }}">
                                    <input type="hidden" name="category_id" value="{{ $pro->category_ids }}">
                                     <input type="hidden" name="price" value="{{$pro->unit_price}}">
                                    <input type="hidden" name="discount" value="{{$pro->discount}}">
                                    <input type="hidden" name="slug" value="{{$pro->slug}}">
                                    <input type="hidden" name="name" value="{{$pro->name}}">
                                    <input type="hidden" name="thumbnail" value="{{$pro->thumbnail}}">
                                    <input type="hidden" name="seller_id" value="{{$pro->user_id}}">
                                    <input type="hidden" name="quantity" value="1">
                                    <input type="hidden" name="tax" value="{{$pro->tax}}">
                                    <input type="hidden" name="shop_info" value="{{$shop_info->name}}">
                                    <input type="hidden" name="shipping_cost" value="{{$pro->shipping_cost}}">
                                    <input type="hidden" name="shop_info" value="{{$shop_info->name}}">
                                    <input type="hidden" name="product_type" value="{{$pro->product_type}}">
                                    <input type="hidden" name="unit" value="{{$pro->unit}}">
                                    <input type="hidden" name="unit_numbers" value="{{$pro->unit_numbers}}">
                                    <input type="hidden" name="sub_category_id" value="{{$pro->sub_category_id}}">
                                    <input type="hidden" name="sub_sub_category_id" value="{{$pro->sub_sub_category_id}}">
                                <button type="submit" class="btn btn-primary">{{__('messages.add_cart')}}</button>
                                </form>
                                @else 
                                <a href="{{route('customer.auth.login')}}" class="btn btn-primary">{{__('messages.add_cart')}}</a>
                                @endif
                            </div>
                        </div>

                       @endforeach
                       </div>
                    </div>
                     <!-- Get Products -->
              
            </section>
        </div>
    </div>
@endsection

@push('script')
    <script>
        function openNav() {
            document.getElementById("mySidepanel").style.width = "70%";
            document.getElementById("mySidepanel").style.height = "100vh";
        }

        function closeNav() {
            document.getElementById("mySidepanel").style.width = "0";
        }


       
        $('#searchByFilterValue, #searchByFilterValue-m').change(function () {
            var url = $(this).val();
            if (url) {
                window.location = url;
            }
            return false;
        });

        $("#search-brand").on("keyup", function () {
            var value = this.value.toLowerCase().trim();
            $("#lista1 div>li").show().filter(function () {
                return $(this).text().toLowerCase().trim().indexOf(value) == -1;
            }).hide();
        });
    </script>


 <script>

    $(document).ready(function(){
        

        $('#category_pro_add_cart').submit(function(e){

            e.preventDefault();

            let formData = new FormData(this);

            $.ajax({
                    type:'POST',
                    url: "{{ route('add.to.cart') }}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            Swal.fire(
                                'تم اضافة المنتج للسلة',
                                )

                                location.reload();
                            
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
            });


            // console.log('good');

        });


    
       

        $('#wishlists_delete').submit(function(e){

        e.preventDefault();
        let formData = new FormData(this);

       

            $.ajax({
                    type:'POST',
                    url: "{{route('customers.wishlists.delete')}}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            
                         
                            // $('.countWishlist').text(response);
                            
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
            });

            $('#wishlistIcon2').css('display','block');
            $('#test2').css('display', 'none');
            let myCount =  $('.countWishlist').text();
        
            $('.countWishlist').text(myCount - 1);

        });
       

     

    });
    
 </script>
@endpush
