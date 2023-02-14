        @foreach ($getCate as $category)
            @if ($category->has_products_count != 0)
                <section class="container rtl mb-3">
    
                    <div style="background: #ffffff; padding:20px;border-radius:5px;">
    
                        {{-- Category Item --}}
                        <div class="flex-between pl-4">
                            <div class="category-product-view-title">
                                <span
                                    class="for-feature-title {{ Session::get('direction') === 'rtl' ? 'float-right' : 'float-left' }}"
                                    style="font-weight: 700;font-size: 20px;text-transform: uppercase;{{ Session::get('direction') === 'rtl' ? 'text-align:right;' : 'text-align:left;' }}">
                                    {{ $category->name }} 
                                </span>
                            </div>
                            <div class="category-product-view-all">
                                <a class="text-capitalize view-all-text" style="color: #645cb3 !important;"
                                    href="{{ route('product.by.category', ['id' => $category->id]) }}">{{ \App\CPU\translate('view_all') }}
                                    <i
                                        class="czi-arrow-{{ Session::get('direction') === 'rtl' ? 'left-circle mr-1 ml-n1 mt-1 float-left' : 'right-circle ml-1 mr-n1' }}"></i>
                                </a>
                            </div>
                        </div>
    
                        @php($getPro = DB::table('products')->where('category_ids', '=', $category->id)->get())
    
                        {{-- {{dd($getPro)}} --}}
                        <div class="owl-carousel owl-theme pt-4 products_list">
    
                            @foreach ($getPro as $pro)
                                <?php
                                    $shop_info = DB::table('shops')
                                        ->where('seller_id', '=', $pro->user_id)
                                        ->first();
                                    $user = App\CPU\Helpers::get_customer();
    
                                    $Brand = DB::table('brands')
                                        ->where('id', '=', $pro->brand_id)
                                        ->first();
    
                                    $sub_sub_category = DB::table('sub_sub_categories')
                                        ->where('id', '=', $pro->sub_sub_category_id)
                                        ->first();
                                    $user = App\CPU\Helpers::get_customer();
                                    $get_pro_wishlist = \App\Model\Wishlist::where([['customer_id', '=', $user->id], ['product_id', '=', $pro->id]])->first();
                                ?>
    
                                {{-- Product Items --}}
                                <div class="card">
                                        <div class="d-flex">
                                            <div class="d-flex justify-content-center align-items-center w-100">
                                                <a href="{{ route('product.view', ['id' => $pro->id]) }}"
                                                   
                                                    class="p-4 min-h-100 justify-content-center align-items-center mb-4">
                                                    <img src="{{ asset('public/product/thumbnail/' . $pro->thumbnail) }}" draggable="false"
                                                        class="card-img-top " alt="{{ $pro->name }}" style="width:100px;height:100px">
                                                </a>
                                            </div>
                                            <div class="bg-light rounded-circle" id="wishlist{{$pro->id}}" style="width: 45px;height:40px;margin-left: 10px;margin-top: 10px;">
                                                @if (auth('customer')->check())
                                                    @if (isset($get_pro_wishlist->id))
                                                        <button class="btn for-hover-bg removeWhishlist"
                                                            data-product_id="{{$pro->id}}"
                                                            data-wishlist_id="{{ $get_pro_wishlist->id }}" >
                                                            <i class="fa fa-heart " style="color:#645cb3;font-size: 18px;" aria-hidden="true" id="heart-icon{{$pro->id}}"></i>
                                                        </button>
                                                    @else
                                                        <button href="#" class="btn for-hover-bg addWhishlist"
                                                            data-product_id="{{$pro->id}}">
                                                            <i class="fa fa-heart-o " style="color:#645cb3;font-size: 18px;" aria-hidden="true" id="heart-icon{{$pro->id}}"></i>
                                                        </button>
                                                    @endif
                                                @else
                                                    <a href="{{ route('customer.auth.login') }}"
                                                        style="color:{{ $web_config['secondary_color'] }};font-size: 18px;">
                                                        <i class="fa fa-heart-o" aria-hidden="true" id="wishlistIcon"></i>
                                                    </a>
                                                @endif
                                            </div>
    
                                        </div>
                                        <div class="card-body">
    
                                            @isset($pro->name)
                                                <div class="pb-2">
                                                    <h5 class="card-title" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
                                                        <a
                                                            href="{{ route('product.view', ['id' => $pro->id]) }}"
                                                            class="your-phone text-right"
                                                            style="text-decoration:none;font-size:16px;">
                                                            {{ $Brand->name . ' ' . $pro->name }}
    
                                                        </a>
                                                    </h5>
                                                </div>
                                                {{-- <div>
                                                    <h6 class="whats-verfiry text-right">
                                                        @isset($sub_sub_category->name)
                                                            {{ $sub_sub_category->name }}
                                                        @endisset
                                                        {{ $Brand->name }}
                                                    </h6>
                                                </div> --}}
                                                <div>
                                                    <h6 class="whats-verfiry text-right">@if ($pro->product_type !== 'الاصلي') {{$pro->product_type}} @else <br> @endif</h6>
                                                </div>
                                            @endisset
    
                                            @empty($pro->name)
                                                <section class="d-flex">
                                                    <h5 class="card-title" style="padding:0;margin:0"><a
                                                            href="{{ route('product.view', ['id' => $pro->id]) }}"
                                                            style="text-decoration:none">{{ $Brand->name }}
                                                            @isset($sub_sub_category->name)
                                                                {{ $sub_sub_category->name }}
                                                            @endisset {{ $pro->product_type }}</a></h5>
                                                </section>
                                            @endempty
    
                                            <div class="d-flex pt-0" >
                                                <span>{{ $pro->carton_unit }}</span>
                                                <span> x </span>
                                                <span>{{ $pro->unit_numbers }} {{ $pro->unit }}</span>
                                            </div>
                                            <br>
                                            <div class="d-flex {{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}" class="your-phone text-right pt-0" style="font-size:20px">
                                                <strong id="chosen_price" >{{ $pro->unit_price * $pro->carton_unit }} </strong>
                                                <strong class="mr-1" > ريال</strong>
                                                <span class="mr-1" style="font-size:16px;font-weight: 600;">({{$pro->unit_price}} ريال للحبه)</span>
                                            </div>
                                            <br>
    
    
                                            @if (auth('customer')->check())
                                                <form action="{{ route('add.to.cart') }}" method="post"
                                                    id="category_pro_add_cart">
                                                    @csrf
                                                    <input type="hidden" name="product_id" value="{{ $pro->id }}">
                                                    <input type="hidden" name="brand_id" value="{{ $pro->brand_id }}">
                                                    <input type="hidden" name="category_id" value="{{ $pro->category_ids }}">
                                                    <input type="hidden" name="price" value="{{ $pro->unit_price }}">
                                                    <input type="hidden" name="discount" value="{{ $pro->discount }}">
                                                    <input type="hidden" name="slug" value="{{ $pro->slug }}">
                                                    <input type="hidden" name="name" value="{{ $pro->name }}">
                                                    <input type="hidden" name="thumbnail" value="{{ $pro->thumbnail }}">
                                                    <input type="hidden" name="seller_id" value="{{ $pro->user_id }}">
                                                    <input type="hidden" name="quantity" value="1">
                                                    <input type="hidden" name="tax" value="{{ $pro->tax }}">
                                                    <input type="hidden" name="shop_info" value="{{ $shop_info->name }}">
                                                    <input type="hidden" name="shipping_cost" value="{{ $pro->shipping_cost }}">
                                                    <input type="hidden" name="shop_info" value="{{ $shop_info->name }}">
                                                    <input type="hidden" name="product_type" value="{{ $pro->product_type }}">
                                                    <input type="hidden" name="unit" value="{{ $pro->unit }}">
                                                    <input type="hidden" name="unit_numbers" value="{{ $pro->unit_numbers }}">
                                                    <input type="hidden" name="sub_category_id"
                                                        value="{{ $pro->sub_category_id }}">
                                                    <input type="hidden" name="sub_sub_category_id"
                                                        value="{{ $pro->sub_sub_category_id }}">
                                                    <button type="submit"
                                                        class="btn primary text-white w-100 rounded-pill">{{ __('messages.add_cart') }}</button>
                                                </form>
                                            @else
                                                <a href="{{ route('customer.auth.login') }}"
                                                    class="btn primary text-white w-100 rounded-pill">{{ __('messages.add_cart') }}</a>
                                            @endif
                                        </div>
                                    </div>
    
                            @endforeach
                        </div>
                    </div>
                </section>
            @endif
        @endforeach