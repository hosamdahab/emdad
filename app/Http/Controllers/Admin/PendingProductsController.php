<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Model\Product;
use App\Model\Brand;
use DB;

class PendingProductsController extends Controller
{
    
    public function index() {

        $data = DB::table("seller_req_add_products")->paginate(15);
        return view("admin-views.pending_products.index", compact('data'));
    }


    public function edit($id) {

        $data = DB::table("seller_req_add_products")->find($id);
        return view("admin-views.pending_products.edit", compact('data'));

    }


    public function update(Request $request, $id) {
        
        $sub_sub=DB::table('sub_sub_categories')->find($request->sub_sub_category_id);
        $request->validate([

            'brand_id'      => 'required',
            // 'category_id'   => 'required',
            'product_type'  => 'required',
            'product_size'  => 'required',
            'qty_in_unit'   => 'required',
            'qty_in_carton' => 'required',
            'product_price' => 'required',
            'purchase_price'=> 'required',
            'qty_in_stock'  => 'required',
            // 'branche_id'    => 'required',
            
        ]);
        

        if($request->file('image')!=null) {


            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('product'), $imageName);

            $path = 'public/product/thumbnail/'.$request->oldImage;

            unlink($path);

        } else {


            $imageName = $request->oldImage;

           $brand =  $request->brand_id;

           $brand_check = Brand::where('id', '=', $brand)->first();
           $brand_get = Brand::where('id', '=', $brand)->get();

           if(count($brand_get) != 0) {

            $brand_id = $brand_check->id;

                $get_sub = $request->sub_category_id; 

                if($get_sub != 'القسم الفرعي') {

                    $sub_cate = $request->sub_category_id;

                } else {

                    $sub_cate = null;

                }


                $get_sub_sub = $request->sub_sub_category_id;

                if($get_sub_sub != 'القسم الفرعي للفرعي') {

                    $sub_sub_cate = $request->sub_sub_category_id;

                } else {

                    $sub_sub_cate = null;

                }
            Product::create([

                'brand_id'          => $brand_id,
                'category_ids'      => $sub_sub->category_id,
                'sub_category_id'   => $sub_sub->sub_category_id,
                'sub_sub_category_id'  =>$sub_sub_cate,
                'name'              => $request->product_name,
                'product_type'      => $request->product_type,
                'unit'              => $request->product_size,
                'unit_numbers'      => $request->qty_in_unit,
                'carton_unit'       => $request->qty_in_carton,
                'unit_price'        => $request->product_price,
                'purchase_price'    => $request->purchase_price,
                'images'            => $imageName,
                'thumbnail'         => $imageName,
                'featured'          => '1',
                'added_by'          => 'seller',
                'user_id'           => $request->selerId,
                'child_seller_id'   => $request->selerId,
                'slug'              => Str::slug($request->name),
                'current_stock'     => $request->qty_in_stock,
                'sku'               => hexdec(uniqid()),
                // 'branche_id'        => $request->branche_id
            
        
            ]);

            DB::table("seller_req_add_products")->where('id','=', $id)->delete();


            } else {
            

                    Brand::create([

                        'seller_id' => $request->selerId,
                        'name'      => $request->indastry_name,
                        'image'     => $imageName,


                    ]);



                    $get_sub = $request->sub_category_id; 

                    if($get_sub != 'القسم الفرعي') {

                        $sub_cate = $request->sub_category_id;

                    } else {

                        $sub_cate = null;

                    }


                    $get_sub_sub = $request->sub_sub_category_id;

                    if($get_sub_sub != 'القسم الفرعي للفرعي') {

                        $sub_sub_cate = $request->sub_sub_category_id;

                    } else {

                        $sub_sub_cate = null;

                    }

                    Product::create([

                        'brand_id'          => $request->brand_id,
                        'category_ids'      => $sub_sub->category_id,
                        'sub_category_id'   => $sub_sub->sub_category_id,
                        'sub_sub_category_id'  => $sub_sub_cate,
                        'name'              => $request->product_name,
                        'product_type'      => $request->product_type,
                        'unit'              => $request->product_size,
                        'unit_numbers'      => $request->qty_in_unit,
                        'carton_unit'       => $request->qty_in_carton,
                        'unit_price'        => $request->product_price,
                        'purchase_price'    => $request->purchase_price,
                        'images'            => $imageName,
                        'thumbnail'         => $imageName,
                        'featured'          => '1',
                        'added_by'          => 'seller',
                        'user_id'           => $request->selerId,
                        'child_seller_id'   => $request->selerId,
                        'slug'              => Str::slug($request->name),
                        'current_stock'     => $request->qty_in_stock,
                        'sku'               => hexdec(uniqid()),
                        'branche_id'        => $request->branche_id
                    
                
                    ]);
                    DB::table("seller_req_add_products")->where('id','=', $id)->delete();

            
                }

            

        

    }

       
        
        return redirect()->back();


    }

    public function destroy($id) {

        $data = DB::table("seller_req_add_products")->where('id', $id)->delete();

    }


    public function admin_brands_store(Request $request) {

        $request->validate([
            'imagebrand' => 'required|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        
        $imageName = time().'.'.$request->imagebrand->extension();  
         
        $request->imagebrand->move(public_path('images'), $imageName);
      
        Image::create([
            
            'Brand'     => $request->brand,
            'category'  => $request->category,
            'image'     => $imageName,
            'created_at'=> Carbon::now()
        
        ]);
        
        return response()->json('Brand uploaded successfully');
    }

    
}
