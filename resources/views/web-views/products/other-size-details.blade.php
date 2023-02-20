@extends('layouts.front-end.app')

@section('title',$product->name)

@push('css_or_js')
    <meta name="description" content="{{$product->slug}}">
    <meta name="keywords" content="">
   
    <meta property="twitter:url" content="{{route('product',[$product->slug])}}">

    <link rel="stylesheet" href="{{asset('public/assets/front-end/css/product-details.css')}}"/>
    <style>
        .msg-option {
            display: none;
        }

        .chatInputBox {
            width: 100%;
        }

        .go-to-chatbox {
            width: 100%;
            text-align: center;
            padding: 5px 0px;
            display: none;
        }

        .feature_header {
            display: flex;
            justify-content: center;
        }

        .btn-number:hover {
            color: {{$web_config['secondary_color']}};

        }

        .for-total-price {
            margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: -30%;
        }

        .feature_header span {
            padding- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 15px;
            font-weight: 700;
            font-size: 25px;
            background-color: #ffffff;
            text-transform: uppercase;
        }

        .flash-deals-background-image{
            background: {{$web_config['primary_color']}}10;
            border-radius:5px;
            width:125px;
            height:125px;
        }

        @media (max-width: 768px) {
            .feature_header span {
                margin-bottom: -40px;
            }

            .for-total-price {
                padding- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 30%;
            }

            .product-quantity {
                padding- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 4%;
            }

            .for-margin-bnt-mobile {
                margin- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 7px;
            }

            .font-for-tab {
                font-size: 11px !important;
            }

            .pro {
                font-size: 13px;
            }
        }

        @media (max-width: 375px) {
            .for-margin-bnt-mobile {
                margin- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: 3px;
            }

            .for-discount {
                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10% !important;
            }

            .for-dicount-div {
                margin-top: -5%;
                margin- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: -7%;
            }

            .product-quantity {
                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 4%;
            }

        }

        @media (max-width: 500px) {
            .for-dicount-div {
                margin-top: -4%;
                margin- {{Session::get('direction') === "rtl" ? 'left' : 'right'}}: -5%;
            }

            .for-total-price {
                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: -20%;
            }

            .view-btn-div {

                margin-top: -9%;
                float: {{Session::get('direction') === "rtl" ? 'left' : 'right'}};
            }

            .for-discount {
                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 7%;
            }

            .viw-btn-a {
                font-size: 10px;
                font-weight: 600;
            }

            .feature_header span {
                margin-bottom: -7px;
            }

            .for-mobile-capacity {
                margin- {{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 7%;
            }
        }

        th, td {
            border-bottom: 1px solid #ddd;
            padding: 5px;
        }

        thead {
            background: {{$web_config['primary_color']}} !important;
            color: white;
        }
        .product-details-shipping-details{
            background: #ffffff; 
            border-radius: 5px;
            font-size: 14;
            font-weight: 400;
            color: #212629;
        }
        .shipping-details-bottom-border{
            border-bottom: 1px #F9F9F9 solid;
        }

        #test2 {

            display:none
        }
    </style>
  
@endpush

@section('content')
    
    <!-- Page Content-->
    <div class="container mt-4 rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <!-- General info tab-->
        <div class="row" style="direction: ltr">
            <!-- Product gallery-->
            <div class="col-md-12 col-12">
                <div class="row">
                               
                    <!-- Product details-->
                    <div class="col-lg-6 col-md-8 col-12 mt-md-0 mt-sm-3" style="direction: {{ Session::get('direction') }}">
                        <div class="details">
                            <p class="mb-2" style="font-size: 22px;font-weight:700;">{{$Brand->name}} @isset($sub_sub_category->name) {{$sub_sub_category->name}} @endisset {{$product->product_type}}</p>
                            <section class="d-flex">
                            <span class="mb-2"> {{$other_size->qty_in_carton}}  </span>
                            <span> X </span>
                            <span> {{$other_size->qty_in_unit}} {{$other_size->product_size}} </span>
                            </section>
                            <div class="d-flex align-items-center mb-2 pro">
                                <span
                                    class="d-inline-block  align-middle mt-1 {{Session::get('direction') === "rtl" ? 'ml-md-2 ml-sm-0 pl-2' : 'mr-md-2 mr-sm-0 pr-2'}}"
                                    style="color: #FE961C"></span>
                                <div class="star-rating" style="{{Session::get('direction') === "rtl" ? 'margin-left: 25px;' : 'margin-right: 25px;'}}">
                                   
                                       
                                            <i class="sr-star czi-star-filled active"></i>
                                        
                                   
                                </div>
                                <span style="font-weight: 400;"
                                    class="font-for-tab d-inline-block font-size-sm text-body align-middle mt-1 {{Session::get('direction') === "rtl" ? 'mr-1 ml-md-2 ml-1 pr-md-2 pr-sm-1 pl-md-2 pl-sm-1' : 'ml-1 mr-md-2 mr-1 pl-md-2 pl-sm-1 pr-md-2 pr-sm-1'}}">{{\App\CPU\translate('Reviews')}}</span>
                                <span style="width: 0px;height: 10px;border: 0.5px solid #707070; margin-top: 6px;font-weight: 400 !important;"></span>
                                <span style="font-weight: 400;"
                                    class="font-for-tab d-inline-block font-size-sm text-body align-middle mt-1 {{Session::get('direction') === "rtl" ? 'mr-1 ml-md-2 ml-1 pr-md-2 pr-sm-1 pl-md-2 pl-sm-1' : 'ml-1 mr-md-2 mr-1 pl-md-2 pl-sm-1 pr-md-2 pr-sm-1'}}">{{\App\CPU\translate('orders')}}   </span>
                                <span style="width: 0px;height: 10px;border: 0.5px solid #707070; margin-top: 6px;font-weight: 400;">    </span>
                                <span style="font-weight: 400;"
                                    class=" font-for-tab d-inline-block font-size-sm text-body align-middle mt-1 {{Session::get('direction') === "rtl" ? 'mr-1 ml-md-2 ml-0 pr-md-2 pr-sm-1 pl-md-2 pl-sm-1' : 'ml-1 mr-md-2 mr-0 pl-md-2 pl-sm-1 pr-md-2 pr-sm-1'}} text-capitalize"> {{\App\CPU\translate('wish_listed')}} </span>

                            </div>
                            <div class="mb-3">
                                @if($product->discount > 0)
                                    <strike style="color: #E96A6A;" class="{{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-3'}}">
                                        {{\App\CPU\Helpers::currency_converter($product->unit_price)}}
                                    </strike>
                                @endif
                                <span
                                    class="h3 font-weight-normal text-accent ">
                                    <!-- Get Price Range -->
                                </span>
                               
                            </div>

                    

                          
                               
                              
                               
                                    <div class="row flex-start mx-0">
                                        <div
                                            class="product-description-label text-body mt-2 {{Session::get('direction') === "rtl" ? 'pl-2' : 'pr-2'}}">{{__('messages.Quantity')}}
                                            :
                                        </div>
                                        <div>
                                            <ul class="list-inline checkbox-alphanumeric checkbox-alphanumeric--style-1 mb-2 mx-1 flex-start row"
                                                style="padding-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 0;">
                                                
                                                    <div>
                                                        <li class="for-mobile-capacity">
                                                            <input type="radio"
                                                                id="{{ $other_size->qty_in_carton }}"
                                                                name="{{ $other_size->qty_in_carton }}" value="{{ $other_size->qty_in_carton }}">
                                                            <label style="font-size: 12px;"
                                                                for="{{ $other_size->qty_in_carton }}">{{$other_size->qty_in_carton}}</label>
                                                        
                                                        
                                                            </li>
                                                    </div>
                                               
                                            </ul>
                                        </div>
                                    </div>
                           

                            <!-- Product Size -->
                                <div class="row no-gutters">
                                    <div>
                                        <div class="product-description-label text-body" style="margin-top: 10px;">{{\App\CPU\translate('size')}}:</div>
                                    </div>
                                    <div >
                                        @php 
                                        $view =  App\Model\Product::where('name', 'LIKE', $product->name)->get()
                                        @endphp

                                        <div class="product-quantity d-flex justify-content-between align-items-center">
                                            <div
                                                class="d-flex justify-content-center align-items-center"
                                                style="width: 160px;color: {{$web_config['primary_color']}}">
                                                <span class="input-group-btn" style="">
                                                    <a class="btn btn-outline-primary" 
                                                    href="{{ Route('product.view',$product->id) }}"
                                                            data-type="minus" data-field="quantity"
                                                            disabled="disabled" style="padding: 10px;color: {{$web_config['primary_color']}}">
                                                       {{$product->unit_numbers}} {{$product->unit}} 
                                                    </a>
                                                </span>
                                                @foreach ($product->sizes as $val)
                                                    
                                                        <span class="input-group-btn m-2" style="">
                                                            <a class="btn btn-outline-primary" 
                                                            href="{{ Route('product.view.size',['product_id'=>$product->id,'size_id'=>$val->id]) }}"
                                                                    data-type="minus" data-field="quantity"
                                                                    disabled="disabled" style="padding: 10px;color: {{$web_config['primary_color']}}">
                                                            {{$val->qty_in_unit}} {{$val->product_size}} 
                                                            </a>
                                                        </span>
                                                    
                                                @endforeach
                                            </div>
                                        
                                        </div>
                                    </div>
                                    
                                </div>

                                <br>

                                <!-- Product Type -->
                                <div class="row no-gutters">
                                    <div>
                                        <div class="product-description-label text-body" style="margin-top: 10px;">{{\App\CPU\translate('testy')}}:</div>
                                    </div>
                                    <div >
                                        @php 
                                        $view =  App\Model\Product::where('name', 'LIKE', $product->name)->get();
                                        $user = App\CPU\Helpers::get_customer();
                                        @endphp

                                        <div class="product-quantity d-flex justify-content-between align-items-center">
                                        @foreach ($view as $val)
                                            <div
                                                class="d-flex justify-content-center align-items-center"
                                                style="width: 160px;color: {{$web_config['primary_color']}}">
                                                <span class="input-group-btn" style="">
                                                    <a class="btn btn-outline-primary" type="button"
                                                            data-type="minus" data-field="quantity"
                                                            disabled="disabled" style="padding: 10px;color: {{$web_config['primary_color']}}">
                                                       {{$val->product_type}}
                                                    </a>
                                                </span>
                                               
                                            </div>
                                        @endforeach
                                        </div>
                                    </div>
                                    
                                </div>

                                <br>
                            <!-- Quantity + Add to cart -->
                                <div class="row no-gutters">
                                    <div>
                                        <div class="product-description-label text-body" style="margin-top: 10px;">{{\App\CPU\translate('Quantity')}}:</div>
                                    </div>
                                    <div >
                                        <div class="product-quantity d-flex justify-content-between align-items-center">
                                            <div
                                                class="d-flex justify-content-center align-items-center"
                                                style="width: 160px;color: {{$web_config['primary_color']}}">
                                                <span class="input-group-btn" style="">
                                                    <button class="btn btn-number" type="button"
                                                            data-type="minus" id="quanatiyMinus" data-field="quantity"
                                                            disabled="disabled" style="padding: 10px;color: {{$web_config['primary_color']}}">
                                                        -
                                                    </button>
                                                </span>
                                                <input type="text" name="quantity"
                                                    class="form-control input-number text-center cart-qty-field"
                                                    placeholder="1" formaction="{{route('add.to.cart')}}" value="1" min="1" max="100" form="add_to_cart" id="proQuantity"
                                                    style="padding: 0px !important;width: 40%;height: 25px;">

                                                <span class="input-group-btn">
                                                    <button class="btn btn-number" type="button" data-type="plus"
                                                            data-field="quantity" id="qnatityPlus" style="padding: 10px;color: {{$web_config['primary_color']}}">
                                                    +
                                                    </button>
                                                </span>

                                                <input type="hidden" id="myPrice" value="{{$product->unit_price}}">
                                            </div>
                                            @php
                                                  $carton_unit=$other_size->qty_in_carton==0 ? 1 :$other_size->qty_in_carton;
                                            @endphp
                                            <div class="float-right"  id="chosen_price_div">
                                                <div class="d-flex justify-content-center align-items-center {{Session::get('direction') === "rtl" ? 'ml-2' : 'mr-2'}}">
                                                    <div class="product-description-label"><strong>{{\App\CPU\translate('total_price')}}</strong> : </div>
                                                    {{-- <strong id="chosen_price">{{$product->unit_price}}</strong> <strong style="margin:0 5px"> ريال </strong> --}}
                                                    <strong id="chosen_price" >{{ $other_size->product_price}} </strong>
                                                    <strong class="mr-1" > ريال</strong>
                                                  
                                                    <span class="mr-1" style="font-size:16px;font-weight: 600;">({{round($other_size->product_price/$carton_unit,1)}} ريال للحبه)</span>
                                                </div>
                                            
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="row flex-start no-gutters d-none mt-2">
                                    

                                    <div class="col-12">
                                       
                                            <h5 class="mt-3 text-body" style="color: red">{{\App\CPU\translate('out_of_stock')}}</h5>
                                       
                                    </div>
                                </div>

                                <div class="d-flex justify-content-start mt-2 mb-3">
                                    <button
                                        class="btn element-center btn-gap-{{Session::get('direction') === "rtl" ? 'left' : 'right'}}"
                                        onclick="buy_now()"
                                        type="button"
                                        style="width:37%; height: 45px; background: #FFA825 !important; color: #ffffff;">
                                        <span class="string-limit">{{\App\CPU\translate('buy_now')}}</span>
                                    </button>
                                  
                                    @if(auth('customer')->check())
                                    <form action="{{route('add.to.cart')}}" id="add_to_cart" method="post">
                                        @csrf
                                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                                     <input type="hidden" name="price" value="{{$product->unit_price}}">
                                    <input type="hidden" name="discount" value="{{$product->discount}}">
                                    <input type="hidden" name="slug" value="{{$product->slug}}">
                                    <input type="hidden" name="name" value="{{$product->name}}">
                                    <input type="hidden" name="thumbnail" value="{{$product->thumbnail}}">
                                    <input type="hidden" name="seller_id" value="{{$product->user_id}}">
                                    <input type="hidden" name="tax" value="{{$product->tax}}">
                                    <input type="hidden" name="shop_info" value="{{$shop_info->name}}">
                                    <input type="hidden" name="shipping_cost" value="{{$product->shipping_cost}}">
                                    <input type="hidden" name="brand_id" value="{{ $product->brand_id }}">
                                    <input type="hidden" name="category_id" value="{{ $product->category_ids }}">
                                    <input type="hidden" name="product_type" value="{{$product->product_type}}">
                                    <input type="hidden" name="unit" value="{{$product->unit}}">
                                    <input type="hidden" name="unit_numbers" value="{{$product->unit_numbers}}">
                                    <input type="hidden" name="sub_category_id" value="{{$product->sub_category_id}}">
                                    <input type="hidden" name="sub_sub_category_id" value="{{$product->sub_sub_category_id}}">
                                    <button
                                        class="btn btn-primary element-center btn-gap-{{Session::get('direction') === "rtl" ? 'left' : 'right'}}"
                                        type="submit"
                                        style="height: 45px;{{Session::get('direction') === "rtl" ? 'margin-right: 20px;' : 'margin-left: 20px;'}}">
                                        {{\App\CPU\translate('add_to_cart')}}
                                    </button>
                                    </form>
                                    @else 
                                    <a href="{{route('customer.auth.login')}}" class="btn btn-primary element-center" style="height: 45px;{{Session::get('direction') === "rtl" ? 'margin-right: 20px;' : 'margin-left: 20px;'}}">
                                        {{\App\CPU\translate('add_to_cart')}}
                                    </a>

                                    @endif

                                
                                    @if(auth('customer')->check())

                                    @php
                                    
                                    $user = App\CPU\Helpers::get_customer();
                                    $get_pro_wishlist = \App\Model\Wishlist::where([
                                        ['customer_id', '=', $user->id],
                                        ['product_id', '=', $product->id]
                                        ])->first();
                                   

                                    @endphp

                                    @isset($get_pro_wishlist->id)
                                    <form action="{{route('customers.wishlists.delete')}}" method="post" id="pro_wishlist_delete">
                                        @csrf
                                        <input type="hidden" name="wishlist_id" value="{{ $get_pro_wishlist->id }}">
                                        <button type="submit" onclick=""
                                            class="btn for-hover-bg"
                                            style="color:{{$web_config['secondary_color']}};font-size: 18px;" id="del_wishlist_pro">
                                        <i class="fa fa-heart" aria-hidden="true" id="test1"></i>
                                       
                                      
                                    </button>
                                    </form>
                                    @endisset


                                    @empty($get_pro_wishlist->id)


                                    <form action="{{route('customers.wishlists.store')}}" method="post" id="pro_wishlist_store">
                                        @csrf
                                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                                        <button type="submit" onclick=""
                                            class="btn for-hover-bg"
                                            style="color:{{$web_config['secondary_color']}};font-size: 18px;" id="get_check_wishlist">
                                       
                                            <i class="fa fa-heart" aria-hidden="true" id="test2"></i>
                                       <i class="fa fa-heart-o"
                                        aria-hidden="true" id="wishlistIcon"></i>
                                      
                                    </button>
                                    </form>

                                    @endempty


                                    @else 

                                    <a href="{{route('customer.auth.login')}}" style="color:{{$web_config['secondary_color']}};font-size: 18px;" >
                                    <i class="fa fa-heart-o"
                                        aria-hidden="true" id="wishlistIcon"></i>
                                      
                                    </a>

                                    @endif
                                </div>
                            
                            
                            <div style="text-align:{{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                class="sharethis-inline-share-buttons"></div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-4 col-12">
                        <div class="cz-product-gallery">
                            <div class="cz-preview">
                                
                                        <div class="d-flex align-items-center justify-content-center"
                                            style="width:100%;height:341px">
                                                <img src="{{asset('public/product/thumbnail/'.$other_size->image)}}" class="img-responsive" 
                                                alt="Product image" width="" alt="{{$product->name}}" style="width:100%;height:100%" draggable="false">

                                            <div class="cz-image-zoom-pane"></div>
                                        </div>
                                 
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="mt-4 rtl col-12" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                        <div class="row" >
                            <div class="col-12">
                                <div class=" mt-1">
                                    <!-- Tabs-->
                                    <ul class="nav nav-tabs d-flex justify-content-center" role="tablist" style="margin-top:35px;">
                                        <li class="nav-item">
                                            <a class="nav-link active " href="#overview" data-toggle="tab" role="tab"
                                            style="color: black !important;font-weight: 400;font-size: 24px;">
                                                {{\App\CPU\translate('overview')}}
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#reviews" data-toggle="tab" role="tab"
                                            style="color: black !important;font-weight: 400;font-size: 24px;">
                                                {{\App\CPU\translate('reviews')}}
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="px-4 pt-lg-3 pb-3 mb-3 mr-0 mr-md-2" style="background: #ffffff;border-radius:10px;min-height: 817px;">
                                        <div class="tab-content px-lg-3">
                                            <!-- Tech specs tab-->
                                            <div class="tab-pane fade show active" id="overview" role="tabpanel">
                                                <div class="row pt-2 specification">
                                                    @if($product->video_url!=null)
                                                        <div class="col-12 mb-4">
                                                            <iframe width="420" height="315"
                                                                    src="{{$product->video_url}}">
                                                            </iframe>
                                                        </div>
                                                    @endif

                                                    <div class="text-body col-lg-12 col-md-12" style="overflow: scroll;">
                                                        {!! $product->details !!}
                                                    </div>
                                                </div>
                                            </div>
                                            @php($reviews_of_product = App\Model\Review::where('product_id',$product->id)->paginate(2))
                                            <!-- Reviews tab-->
                                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                                <div class="row pt-2 pb-3">
                                                    <div class="col-lg-4 col-md-5 ">
                                                        <div class=" row d-flex justify-content-center align-items-center">
                                                            <div class="col-12 d-flex justify-content-center align-items-center">
                                                                <h2 class="overall_review mb-2" style="font-weight: 500;font-size: 50px;">
                                                                   
                                                                </h2>
                                                            </div>
                                                            <div
                                                                class="d-flex justify-content-center align-items-center star-rating ">
                                                               
                                                                        <i class="czi-star-filled font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                               
                                                                        <i class="czi-star-filled font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                                  
                                                                    <i class="czi-star font-size-sm text-muted {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                             
                                                                        <i class="czi-star-filled font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                                  
                                                                        <i class="czi-star font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                               
                                                                 
                                                                        <i class="czi-star-filled font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                                  
                                                                        <i class="czi-star font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                            
                                                                        <i class="czi-star font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                                   
                                                                    <i class="czi-star-filled font-size-sm text-accent {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                              
                                                                        <i class="czi-star font-size-sm text-muted {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                                                               
                                                            </div>
                                                            <div class="col-12 d-flex justify-content-center align-items-center mt-2">
                                                                <span class="text-center">
                                                                    {{$reviews_of_product->total()}} {{\App\CPU\translate('ratings')}}
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-8 col-md-7 pt-sm-3 pt-md-0" >
                                                        <div class="row d-flex align-items-center mb-2 font-size-sm">
                                                            <div
                                                                class="col-3 text-nowrap "><span
                                                                    class="d-inline-block align-middle text-body">{{\App\CPU\translate('Excellent')}}</span>
                                                            </div>
                                                            <div class="col-8">
                                                                <div class="progress text-body" style="height: 5px;">
                                                                    <div class="progress-bar " role="progressbar"
                                                                        style="background-color: {{$web_config['primary_color']}} !important"
                                                                        aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-1 text-body">
                                                                <span
                                                                    class=" {{Session::get('direction') === "rtl" ? 'mr-3 float-left' : 'ml-3 float-right'}} ">
                                                                  
                                                                </span>
                                                            </div>
                                                        </div>

                                                        <div class="row d-flex align-items-center mb-2 text-body font-size-sm">
                                                            <div
                                                                class="col-3 text-nowrap "><span
                                                                    class="d-inline-block align-middle ">{{\App\CPU\translate('Good')}}</span>
                                                            </div>
                                                            <div class="col-8">
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="background-color: {{$web_config['primary_color']}} !important; background-color: #a7e453;"
                                                                        aria-valuenow="27" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-1">
                                                                <span
                                                                    class="{{Session::get('direction') === "rtl" ? 'mr-3 float-left' : 'ml-3 float-right'}}">
                                                                    
                                                                </span>
                                                            </div>
                                                        </div>

                                                        <div class="row d-flex align-items-center mb-2 text-body font-size-sm">
                                                            <div
                                                                class="col-3 text-nowrap"><span
                                                                    class="d-inline-block align-middle ">{{\App\CPU\translate('Average')}}</span>
                                                            </div>
                                                            <div class="col-8">
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="background-color: {{$web_config['primary_color']}} !important;background-color: #ffda75;"
                                                                        aria-valuenow="17" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-1">
                                                                <span
                                                                    class="{{Session::get('direction') === "rtl" ? 'mr-3 float-left' : 'ml-3 float-right'}}">
                                                                  
                                                                </span>
                                                            </div>
                                                        </div>

                                                        <div class="row d-flex align-items-center mb-2 text-body font-size-sm">
                                                            <div
                                                                class="col-3 text-nowrap "><span
                                                                    class="d-inline-block align-middle">{{\App\CPU\translate('Below Average')}}</span>
                                                            </div>
                                                            <div class="col-8">
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="background-color: {{$web_config['primary_color']}} !important; background-color: #fea569;"
                                                                        aria-valuenow="9" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-1">
                                                                <span
                                                                        class="{{Session::get('direction') === "rtl" ? 'mr-3 float-left' : 'ml-3 float-right'}}">
                                                                   
                                                                </span>
                                                            </div>
                                                        </div>

                                                        <div class="row d-flex align-items-center text-body font-size-sm">
                                                            <div
                                                                class="col-3 text-nowrap"><span
                                                                    class="d-inline-block align-middle ">{{\App\CPU\translate('Poor')}}</span>
                                                            </div>
                                                            <div class="col-8">
                                                                <div class="progress" style="height: 5px;">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="background-color: {{$web_config['primary_color']}} !important;backbround-color:{{$web_config['primary_color']}};"
                                                                        aria-valuenow="4" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-1">
                                                                <span
                                                                    class="{{Session::get('direction') === "rtl" ? 'mr-3 float-left' : 'ml-3 float-right'}}">
                                                                        
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row pb-4 mb-3">
                                                    <div style="display: block;width:100%;text-align: center;background: #F3F4F5;border-radius: 5px;padding:5px;">
                                                        <span class="text-capitalize">{{\App\CPU\translate('Product Review')}}</span>
                                                    </div>
                                                </div>
                                                <div class="row pb-4">
                                                    <div class="col-12" id="product-review-list">
                                                      
                                                            <div class="card">
                                                                <div class="card-body">
                                                                    <h6 class="text-danger text-center">{{\App\CPU\translate('product_review_not_available')}}</h6>
                                                                </div>
                                                            </div>
                                                       
                                                        
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="card-footer d-flex justify-content-center align-items-center">
                                                            <button class="btn" style="background: {{$web_config['primary_color']}}; color: #ffffff" onclick="load_review()">{{\App\CPU\translate('view more')}}</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
          
            

        </div>
    </div>

    <!-- Product carousel (You may also like)-->
    <div class="container  mb-3 rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <div class="row flex-between">
            <div class="text-capitalize" style="font-weight: 700; font-size: 30px;{{Session::get('direction') === "rtl" ? 'margin-right: 5px;' : 'margin-left: 5px;'}}">
                <span>{{ \App\CPU\translate('similar_products')}}</span>
            </div>

            <div class="view_all d-flex justify-content-center align-items-center">
                <div>
                    
                    <a class="text-capitalize view-all-text" style="color:{{$web_config['primary_color']}} !important;{{Session::get('direction') === "rtl" ? 'margin-left:10px;' : 'margin-right: 8px;'}}"
                       href="">{{ \App\CPU\translate('view_all')}}
                       <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left-circle mr-1 ml-n1 mt-1 ' : 'right-circle ml-1 mr-n1'}}"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- Grid-->
        
        <!-- Product-->
        <div class="row mt-4">
           
                    <div class="col-xl-2 col-sm-3 col-6" style="margin-bottom: 20px;">
                       
                    </div>
           
                <!-- <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="text-danger text-center">{{\App\CPU\translate('similar')}} {{\App\CPU\translate('product_not_available')}}</h6>
                        </div>
                    </div>
                </div> -->
           
        </div>
    </div>

    <div class="modal fade rtl" id="show-modal-view" tabindex="-1" role="dialog" aria-labelledby="show-modal-image"
         aria-hidden="true" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="display: flex;justify-content: center">
                    <button class="btn btn-default"
                            style="border-radius: 50%;margin-top: -25px;position: absolute;{{Session::get('direction') === "rtl" ? 'left' : 'right'}}: -7px;"
                            data-dismiss="modal">
                        <i class="fa fa-close"></i>
                    </button>
                    <img class="element-center" id="attachment-view" src="">
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')

    <script type="text/javascript">
        cartQuantityInitialize();
        getVariantPrice();
        $('#add-to-cart-form input').on('change', function () {
            getVariantPrice();
        });

        function showInstaImage(link) {
            $("#attachment-view").attr("src", link);
            $('#show-modal-view').modal('toggle')
        }
    </script>
    <script>
        $( document ).ready(function() {
            load_review();
        });
        let load_review_count = 1;
        function load_review()
        {
            
            $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });
            $.ajax({
                    type: "post",
                    url: '{{route('review-list-product')}}',
                    data:{
                        product_id:{{$product->id}},
                        offset:load_review_count
                    },
                    success: function (data) {
                        $('#product-review-list').append(data.productReview)
                        if(data.not_empty == 0 && load_review_count>2){
                            toastr.info('{{\App\CPU\translate('no more review remain to load')}}', {
                                CloseButton: true,
                                ProgressBar: true
                            });
                            console.log('iff');
                        }
                    }
                });
                load_review_count++
        }
    </script>
    
    {{-- Messaging with shop seller --}}
    <script>
        $('#contact-seller').on('click', function (e) {
            // $('#seller_details').css('height', '200px');
            $('#seller_details').animate({'height': '276px'});
            $('#msg-option').css('display', 'block');
        });
        $('#sendBtn').on('click', function (e) {
            e.preventDefault();
            let msgValue = $('#msg-option').find('textarea').val();
            let data = {
                message: msgValue,
                shop_id: $('#msg-option').find('textarea').attr('shop-id'),
                seller_id: $('.msg-option').find('.seller_id').attr('seller-id'),
            }
            if (msgValue != '') {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "post",
                    url: '{{route('messages_store')}}',
                    data: data,
                    success: function (respons) {
                        console.log('send successfully');
                    }
                });
                $('#chatInputBox').val('');
                $('#msg-option').css('display', 'none');
                $('#contact-seller').find('.contact').attr('disabled', '');
                $('#seller_details').animate({'height': '125px'});
                $('#go_to_chatbox').css('display', 'block');
            } else {
                console.log('say something');
            }
        });
        $('#cancelBtn').on('click', function (e) {
            e.preventDefault();
            $('#seller_details').animate({'height': '114px'});
            $('#msg-option').css('display', 'none');
        });
    </script>


<script>

    $(document).ready(function(){

        $('#qnatityPlus').on('click', function(){

            let myPrice = $('#myPrice').val();

            let myQuantity = $('#proQuantity').val();

            let total = myPrice * myQuantity;

            $('#chosen_price').text(total);

            // console.log(total);

        });


        $('#quanatiyMinus').on('click', function(){

            let myPrice = $('#myPrice').val();

            let myQuantity = $('#proQuantity').val();

            let total = myPrice * myQuantity;

            $('#chosen_price').text(total);


            // console.log('good');

        });


        $('#add_to_cart').submit(function(e){

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
                               
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
            });


            // console.log('good');

        })



        $('#pro_wishlist_store').submit(function(e){

            e.preventDefault();
            let formData = new FormData(this);

           

            $.ajax({
                    type:'POST',
                    url: "{{route('customers.wishlists.store')}}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            
                              
                            $('#wishlistIcon').css('display','none');
                            $('#test2').css('display', 'block');
                            $('.countWishlist').text(response);
                               
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
            });

            // console.log(formData);
            
            
           
        });


        $('#pro_wishlist_delete').submit(function(e){

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
                            
                            $('#test1').css('display', 'block');
                            $('#test2').css('display', 'none');
                            $('.countWishlist').text(response);
                               
                        }
                    },
                    error: function(response){
                        $('#image-input-error').text(response.responseJSON.message);
                    }
            });

           
        //     // console.log('good');

        });
      
    })
    
</script>

    <script type="text/javascript"
            src="https://platform-api.sharethis.com/js/sharethis.js#property=5f55f75bde227f0012147049&product=sticky-share-buttons"
            async="async"></script>
@endpush
