<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CartManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use function App\CPU\translate;
use Carbon\Carbon;
use App\User;
use App\Model\subsCategory;
use App\Model\sub_sub_category;
use App\Model\Brand;
use DB;

class CartController extends Controller
{

    public function cart(Request $request)
    {
        // $user = Helpers::get_customer($request);
        // $cart = Cart::where(['customer_id' => $user->id])->get();
        // $cart->map(function ($data) {
        //     $data['choices'] = json_decode($data['choices']);
        //     $data['variations'] = json_decode($data['variations']);
        //     return $data;
        // });
        // return response()->json($cart, 200);

        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DB::table('users')->where('remember_token', '=', $result)->first();

       

        if(isset($check)) {

             //$pro = DB::table('carts')->where('customer_id', '=', $check->id)->get();
             $pro = Cart::where(['customer_id' => $check->id])->get();

            if(count($pro) > 0) {

                
                foreach($pro as $products) {

                    $products->choices = [];
                    $products->variations = [];
                

                }
                return response()->json($pro,200);

            } else {

                return response()->json([],200);
            }


        } else {


        return ['You are not Authorized'];

        }
    }

    public function add_to_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id'    => 'required',
            'qty'   => 'required'
    
        ], [
            'id.required' => translate('Product ID is required!')
        ]);


        $myId = $request->id;
        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DB::table('users')->where('remember_token', '=', $result)->first();

        if(isset($check)) {

            $get_pro = DB::table('products')->where('id', '=', $myId)->first();

            $get_branche = DB::table('branche')->where('id', '=', $get_pro->branche_id)->first();

            if(isset($get_branche)) {

                $branch_name = $get_branche->shop_name;

            } else {

                $branch_name = null;

            }

            $cart = new Cart;

            $total                      =  $get_pro->unit_price * $request->qty;
            $cart->customer_id          = $check->id;
            $cart->product_id           = $get_pro->id;
            $cart->product_type         = $get_pro->product_type;
            $cart->brand_id             = $get_pro->brand_id;
            $cart->category_id          = $get_pro->category_ids;
            $cart->color                = $get_pro->colors;
            $cart->choices              = $get_pro->choice_options;
            $cart->variations           = $get_pro->variation;
            $cart->quantity             = $request->quantity;
            $cart->price                = $get_pro->unit_price;
            $cart->unit                 = $get_pro->unit;
            $cart->unit_numbers         = $get_pro->unit_numbers;
            $cart->tax                  = $get_pro->tax;
            $cart->discount             = $get_pro->discount;
            $cart->slug                 = $get_pro->slug;
            $cart->name                 = $get_pro->name;
            $cart->thumbnail            = $get_pro->thumbnail;
            $cart->seller_id            = $get_pro->user_id;
            $cart->shop_info            = $branch_name;
            $cart->shipping_cost        = $get_pro->shipping_cost;
            $cart->total                = $total;
            $cart->sub_category_id      = $get_pro->category_ids;
            $cart->sub_sub_category_id  = $get_pro->sub_sub_category_id;
            $cart->created_at           = Carbon::now();
            $cart->save();

            return response()->json('تم اضافة المنتج للسلة', 200);

        } else {

    
            return response()->json('You are not Authorized', 200);
        }

     
       
    }

    public function update_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => 'required',
            'quantity' => 'required',
        ], [
            'key.required' => translate('Cart key or ID is required!')
        ]);

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $response = CartManager::update_cart_qty($request);
        return response()->json($response);
    }

    public function remove_from_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => 'required'
        ], [
            'key.required' => translate('Cart key or ID is required!')
        ]);

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $user = Helpers::get_customer($request);
        Cart::where(['id' => $request->key, 'customer_id' => $user->id])->delete();
        return response()->json(translate('successfully_removed'));
    }
    public function remove_all_from_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => 'required'
        ], [
            'key.required' => translate('Cart key or ID is required!')
        ]);

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $user = Helpers::get_customer($request);
        Cart::where(['customer_id' => $user->id])->delete();
        return response()->json(translate('successfully_removed'));
    }
}
