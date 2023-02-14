<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\seller_req_add_products;
use DB;

class AddProRequestController extends Controller
{
    
    public function request_products_store(Request $request) {

        $request->validate([

            'brand_id'      => 'required',
            'product_size'  => 'required',
            'qty_in_unit'   => 'required',
            'qty_in_carton' => 'required',
            'product_price' => 'required',
            'purchase_price'=> 'required',
            'qty_in_stock'  => 'required',
            'image'         => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            
        ]);
        

        if($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('product'), $imageName);

        }
        

        if($request->product_type != null) {

            $pro_type = $request->product_type;

        } else {

            $pro_type = 'الاصلي';
        }


        $check_brand = $request->brand_id;

        $check = DB::table('brands')->where('name', '=', $check_brand)->first();

        if(isset($check->id)) {


            $brand = $check->id;

        } else {

            $brand = $request->brand_id;
        }
      

        $get_subs = DB::table('sub_sub_categories')->where('id', '=', $request->sub_sub_category_id)->first();

        seller_req_add_products::create([

            'seller_id'         => auth('seller')->id(),
            'child_seller_id'   => auth('seller')->id(),
            'added_by'          => 'seller',
            'brand_id'          => $brand,
            'product_name'      => $request->product_name,
            'product_type'      => $pro_type,
            'product_size'      => $request->product_size,
            'qty_in_unit'       => $request->qty_in_unit,
            'product_price'     => $request->product_price,
            'purchase_price'    => $request->purchase_price,
            'qty_in_stock'      => $request->qty_in_stock,
            'carton_unit'       => $request->qty_in_carton,
            'product_image'     => $imageName,
            'category_id'       => $get_subs->category_id,
            'sub_category_id'   => $get_subs->sub_category_id,
            'sub_sub_category_id'=> $get_subs->id,
            'branche_id'        => $request->branche_id,
            'discount'          => $request->discount

        
        ]);
        
        return response()->json('Product Add successfully');
    }
}
