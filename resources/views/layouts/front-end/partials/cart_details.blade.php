@php
    $user = App\CPU\Helpers::get_customer();
    $cart_count = \App\Model\Cart::where('customer_id', '=', $user->id)->count('id');
@endphp
<div class="feature_header d-flex">
    <h4 class="text_header">{{ __('messages.product_in_cart') }}</h4>
    <p style="color: #c1c1c1;margin: 10px 5px;">{{ $cart_count . ' ' . __('messages.product') }}</p>
</div>

<!-- Grid-->
@php($shippingMethod = \App\CPU\Helpers::get_business_settings('shipping_method'))
@php(
    $cart = \App\Model\Cart::where(['customer_id' => auth('customer')->id()])->get()->groupBy('cart_group_id')
)

<div class="row" style="font-family: 'Cairo' !important">
    <!-- List of items-->
    <section class="col-md-8">

        <div>
            @foreach ($cart as $group)
                <div class="cart_information mb-3">
                    @foreach ($group as $cart_key => $cartItem)
                        @if ($shippingMethod == 'inhouse_shipping')
                            <?php

                            $admin_shipping = \App\Model\ShippingType::where('seller_id', 0)->first();
                            $shipping_type = isset($admin_shipping) == true ? $admin_shipping->shipping_type : 'order_wise';

                            ?>
                        @else
                            <?php
                            if ($cartItem->seller_is == 'admin') {
                                $admin_shipping = \App\Model\ShippingType::where('seller_id', 0)->first();
                                $shipping_type = isset($admin_shipping) == true ? $admin_shipping->shipping_type : 'order_wise';
                            } else {
                                $seller_shipping = \App\Model\ShippingType::where('seller_id', $cartItem->seller_id)->first();
                                $shipping_type = isset($seller_shipping) == true ? $seller_shipping->shipping_type : 'order_wise';
                            }
                            ?>
                        @endif
                    @endforeach
                    <div class="table-responsive">
                        <table
                            class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                            style="width: 100%;text-align:center">


                            @foreach ($group as $cartItem)
                                @php($brand = DB::table('brands')->where('id', $cartItem->brand_id)->select('name')->first())
                                {{-- <div class="row"> --}}
                                <div class="card mb-3"
                                    style="border: 1px solid #e7e7e7;
                                        border-radius: 20px;
                                        width: 100%;
                                        cursor: pointer;padding:0 !important;">
                                    <div class="card-body" style="padding: 10px;">
                                        <div class="parent d-flex justify-content-between align-items-center col-12">

                                            <div
                                                class="cart-items d-flex col-4 justify-content-between align-items-center">

                                                <div
                                                    class="product-quantity d-flex justify-content-between align-items-center">
                                                    <div class="qty_number">
                                                            <span class="input-group-btn" style="margin: 0;">
                                                                <button class="btn btn-number" type="button" data-type="minus"
                                                                    onclick="qnatityPlus()" id="quanatiyMinus" data-field="quantity"
                                                                    disabled="disabled"
                                                                    style="padding: 10px;color: {{ $web_config['primary_color'] }}">
                                                                    -
                                                                </button>
                                                            </span>

                                                            <input type="text" name="quantity"
                                                                class="form-control input_cart input-number text-center cart-qty-field"
                                                                placeholder="1" min="1" max="100" id="proQuantityCart"
                                                                value="{{ $cartItem->quantity }}">
                                                            <input type="hidden" id="cart_item_price"
                                                                value="{{ $cartItem->price }}">
                                                            <span class="input-group-btn" style="margin: -4px;">
                                                                <button class="btn btn-number" type="button" data-type="plus"
                                                                    data-field="quantity" onclick="qnatityPlus()" id="qnatityPlus"
                                                                    style="padding: 10px;color: {{ $web_config['primary_color'] }}">
                                                                    +
                                                                </button>
                                                            </span>


                                                        </div>



                                                </div>

                                                <div class="d-flex align-items-center" style="width: 170%;">
                                                    <a class="d-block {{ Session::get('direction') === 'rtl' ? 'ml-2' : 'mr-2' }}"
                                                        href="{{ route('product.view', ['id' => $cartItem->product_id]) }}">
                                                        <img width="60" height="60"
                                                            onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"
                                                            src="{{ asset('public/product/thumbnail/' . $cartItem->thumbnail) }}"
                                                            alt="Product" />
                                                    </a>
                                                    <div class="pro-details">
                                                        <strong
                                                            style="color: #3f3f3f;">{{ $brand->name . ' ' . $cartItem->name }}</strong>
                                                        <p style="color: #636363;">{{ $cartItem->product_type }}</p>
                                                    </div>
                                                </div>



                                            </div>

                                            <div class="pro-unit d-flex">
                                                <span>{{ $cartItem->unit_numbers }}</span>
                                                <span>{{ $cartItem->unit }}</span>
                                                <span style="margin:0 5px"> x </span>
                                                <span>{{ $cartItem->price }} ريال</span>
                                            </div>

                                            <div class="item-total" id="cartTotalItem" style="margin-left:2rem">
                                                {{ $cartItem->total }} ريال
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                @php($realted_pro = DB::table('products')->where('category_ids', '=', $cartItem->category_id)->latest()->paginate(4))

                                {{-- </div> --}}
                            @endforeach
                        </table>
                        <div class="mt-3"></div>
                    </div>
                </div>
            @endforeach



            @if ($cart->count() == 0)
                <div class="d-flex justify-content-center align-items-center">
                    <h4 class="text-danger text-capitalize">{{ \App\CPU\translate('cart_empty') }}</h4>
                </div>
            @endif
        </div>

        {{--
        <div class="row pt-2">
            <div class="col-6">
                <a href="{{ route('home') }}" class="btn btn-primary">
                    <i class="fa fa-{{ Session::get('direction') === 'rtl' ? 'forward' : 'backward' }} px-1"></i>
                    {{ \App\CPU\translate('continue_shopping') }}
                </a>
            </div>

            <div class="col-6">
                <a onclick="checkout()"
                    class="btn btn-primary pull-{{ Session::get('direction') === 'rtl' ? 'left' : 'right' }}">
                    {{ \App\CPU\translate('checkout') }}
                    <i class="fa fa-{{ Session::get('direction') === 'rtl' ? 'backward' : 'forward' }} px-1"></i>
                </a>
            </div>
        </div> --}}
    </section>
    <!-- Sidebar-->

    <div class="col-md-4" style="font-family: 'Cairo'">
        @include('web-views.partials._order-summary')
    </div>


</div>

<div class="row">
    <div class="col-12">
        <h3>{{\App\CPU\translate('realted_pro')}}</h3>
    </div>
    @include('web-views.partials.product_items',['products' => $realted_pro])
</div>


<script>
    cartQuantityInitialize();

    function set_shipping_id(id, cart_group_id) {
        $.get({
            url: '{{ url('/') }}/customer/set-shipping-method',
            dataType: 'json',
            data: {
                id: id,
                cart_group_id: cart_group_id
            },
            beforeSend: function() {
                $('#loading').show();
            },
            success: function(data) {
                location.reload();
            },
            complete: function() {
                $('#loading').hide();
            },
        });
    }
</script>
<script>
    function checkout() {
        let order_note = $('#order_note').val();
        //console.log(order_note);
        $.post({
            url: "{{ route('order_note') }}",
            data: {
                _token: '{{ csrf_token() }}',
                order_note: order_note,

            },
            beforeSend: function() {
                $('#loading').show();
            },
            success: function(data) {
                let url = "{{ route('checkout-details') }}";
                location.href = url;

            },
            complete: function() {
                $('#loading').hide();
            },
        });
    }


    function qnatityPlus() {

        let myPrice = $('#cart_item_price').val();

        let myQuantity = $('#proQuantityCart').val();

        let summary_shipping = $('#summary_shipping').attr('name');

        let Total = myPrice * myQuantity;


        $('#cartTotalItem').text(Total + ' ريال');

        $('#summary_sub_total').text(Total + ' ريال');

        $('#cart_value').text((Total + summary_shipping) + ' ريال');



        // console.log(summary_shipping);

    }
</script>
