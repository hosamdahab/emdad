<style>
    .cart_title {
        font-weight: 400 !important;
        color: #404040
    }

    .cart_value {
        font-weight: 600 !important;
        color: #000;
    }

    .cart_total_value {
        font-weight: 700 !important;
        font-size: 25px !important;
        /* color: {{$web_config['primary_color']}} !important; */
    }
    .card{
        border: 1px solid #e7e7e7;
        border-radius: 20px 20px 0 0;
        padding: 15px 15px 5px!important;
    }
    .card-bottom{
        border: 1px solid #e7e7e7;
        border-radius: 0 0 20px 20px ;
        padding: 15px 15px 15px !important;
        background: #fafafa;

    }


</style>

{{-- <aside class="col-lg-3 pt-4 pt-lg-0" style="font-family: 'Cairo'"> --}}
    <div class="cart_total">
        @php($sub_total=0)
        @php($total_tax=0)
        @php($total_shipping_cost=0)
        @php($total_discount_on_product=0)
        @php ($user = App\CPU\Helpers::get_customer())
        @php($cart= \App\Model\Cart::where('customer_id', '=', $user->id)->get())
        @php($cart_sub_total = \App\Model\Cart::where('customer_id', '=', $user->id)->sum('total'))
        @php($cart_cost_shipping = \App\Model\Cart::where('customer_id', '=', $user->id)->sum('shipping_cost'))
        @php($cart_discount = \App\Model\Cart::where('customer_id', '=', $user->id)->sum('discount'))
        @php($shipping_cost=\App\CPU\CartManager::get_shipping_cost())
        @if($cart->count() > 0)
            @foreach($cart as $key => $cartItem)
                @php($sub_total+=$cartItem['price']*$cartItem['quantity'])
                @php($total_tax+=$cartItem['tax']*$cartItem['quantity'])
                @php($total_discount_on_product+=$cartItem['discount']*$cartItem['quantity'])
            @endforeach
            @php($total_shipping_cost=$shipping_cost)
        @else
            <span>{{\App\CPU\translate('empty_cart')}}</span>
        @endif

        <div>
            <h4 style="font-size: 28px;color: #404040;font-weight: 500;">الملخص المالي</h4>
        </div>

        <div>
            <div class="card">
                <div class="d-flex justify-content-between" style="width: 100%;margin-bottom: 8px;">
                    <span class="cart_title">{{\App\CPU\translate('sub_total')}}</span>
                    <span class="cart_value" id="summary_sub_total">
                        {{$cart_sub_total}} ريال
                    </span>
                </div>

                <div class="d-flex justify-content-between" style="margin-bottom: 8px">
                    <span class="cart_title">{{\App\CPU\translate('shipping')}}</span>
                    <span class="cart_value" name="{{$cart_cost_shipping}}" id="summary_shipping">
                        @if($cart_cost_shipping > 0)

                        <span>{{$cart_cost_shipping}} ريال</span>

                        @else
                        0
                        @endif
                    </span>
                </div>
            </div>

            <div class="card-bottom">
                <div class="d-flex justify-content-between">
                    <span class="cart_title">{{\App\CPU\translate('total')}}</span>
                    <span class="cart_value" id="cart_value">
                    {{$cart_sub_total + $cart_cost_shipping}} ريال
                    </span>
                </div>
            </div>

        </div>


        {{-- <div class="d-flex justify-content-between">
            <span class="cart_title">{{\App\CPU\translate('discount_on_product')}}</span>
            <span class="cart_value">
                @if($cart_discount > 0)
                {{$cart_discount}} ريال
                @else
                0
                @endif
            </span>
        </div> --}}

        {{-- <hr class="mt-2 mb-2"> --}}
        @if(session()->has('coupon_discount'))
            <div class="d-flex justify-content-between">
                <span class="cart_title">{{\App\CPU\translate('coupon_discount')}}</span>
                <span class="cart_value" id="coupon-discount-amount">
                    - {{session()->has('coupon_discount')?\App\CPU\Helpers::currency_converter(session('coupon_discount')):0}}
                </span>
            </div>
            @php($coupon_dis=session('coupon_discount'))
        @else
            <div class="mt-2">
                <form class="needs-validation" action="{{route('check.copoun.code')}}" method="post" id="coupon-code-ajax">
                @csrf
                    <div class="form-group">
                        <input class="form-control input_code rounded-pill" type="text" name="code" placeholder="{{\App\CPU\translate('Coupon code')}}">
                        <div class="invalid-feedback">{{\App\CPU\translate('please_provide_coupon_code')}}</div>
                        <input type="hidden" name="total" value="{{$cart_sub_total + $cart_cost_shipping}}">
                    </div>
                    <button class="btn primary btn-block rounded-pill" type="submit">{{\App\CPU\translate('Next')}}
                    </button>
                </form>
            </div>
            @php($coupon_dis=0)
        @endif



        {{-- <div class="d-flex justify-content-center">
            <span class="cart_total_value mt-2">
                {{\App\CPU\Helpers::currency_converter($sub_total+$total_tax+$total_shipping_cost-$coupon_dis-$total_discount_on_product)}}
            </span>
        </div> --}}
    </div>
    {{-- <div class="container mt-2">
        <div class="row p-0">
            <div class="col-md-3 p-0 text-center mobile-padding">
                <img class="order-summery-footer-image" src="{{asset("public/assets/front-end/png/delivery.png")}}" alt="">
                <div class="deal-title">3 {{\App\CPU\translate('days_free_delivery')}} </div>
            </div>

            <div class="col-md-3 p-0 text-center">
                <img class="order-summery-footer-image" src="{{asset("public/assets/front-end/png/money.png")}}" alt="">
                <div class="deal-title">{{\App\CPU\translate('money_back_guarantee')}}</div>
            </div>
            <div class="col-md-3 p-0 text-center">
                <img class="order-summery-footer-image" src="{{asset("public/assets/front-end/png/Genuine.png")}}" alt="">
                <div class="deal-title">100% {{\App\CPU\translate('genuine')}} {{\App\CPU\translate('product')}}</div>
            </div>
            <div class="col-md-3 p-0 text-center">
                <img class="order-summery-footer-image" src="{{asset("public/assets/front-end/png/Payment.png")}}" alt="">
                <div class="deal-title">{{\App\CPU\translate('authentic_payment')}}</div>
            </div>
        </div>
    </div> --}}
{{-- </aside> --}}
