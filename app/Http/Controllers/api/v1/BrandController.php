<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\BrandManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Brand;
use App\Model\Product;
use App\Model\Category;
use App\Model\subsCategory;
use App\Model\sub_sub_category;
use DB;

class BrandController extends Controller
{
    public function get_brands()
    {
        try {
            $brands = BrandManager::get_brands();
        } catch (\Exception $e) {
        }

        return response()->json($brands,200);
    }

    public function get_products(Request $request)
    {

        $id = $request->brand_id;

        $get_brand = DB::table('brands')->where('id','=', $id)->first();

        $products = Product::where('brand_id', '=', $get_brand->id)->get();
        
        if(count($products) > 0){
        
            $data = [];
      
        
            foreach($products as $pro) {
            
                $sub_cate = Category::where('id','=', $pro->category_ids)->first();
                $sub_sub_cate = sub_sub_category::where('id','=', $pro->sub_sub_category_id)->first();
                $Brand = Brand::where('id', '=', $pro->brand_id)->first();
            
            
                $pro->choice_options = [array('name' => 'choice_19', 'title' => 'الحجم', 'options' => array($pro->unit . $pro->unit_numbers)), array('name' => 'choice_18', 'title' => 'الكمية', 'options' => array($pro->carton_unit)), array('name' => 'choice_7', 'title' => 'النكهة', 'options' => array($pro->product_type))];

                $pro->variation = [array('type' => $pro->unit.'-'.$pro->carton_unit.'-'.$pro->product_type.$pro->unit_numbers, 'price' => (integer)$pro->unit_price, 'sku' => $pro->sku, 'qty' => (integer)$pro->current_stock)];

                (integer)$pro->brand_id;
                $pro->id = (integer)$pro->id;
                $pro->min_qty = (integer)$pro->min_qty;
                $pro->purchase_price = (integer)$pro->purchase_price;
                $pro->unit_price = (integer)$pro->unit_price;
                $pro->brand_id = (integer)$pro->brand_id;
                $pro->current_stock = (integer)$pro->current_stock;
                $pro->user_id = (integer)$pro->user_id;
                $pro->unit_numbers = strval($pro->unit_numbers);
                $pro->tax = (integer)$pro->tax;
                $pro->discount = (integer)$pro->discount;
                $pro->attributes = array(19, 18, 7);

                if($pro->name != null) {

                    $pro->name = $Brand->name. ' ' .$pro->name . ' ' .$pro->unit_numbers . ' ' .$pro->unit . ' * '. $pro->carton_unit . 'حبة';

                } else {

                    $pro->name = $Brand->name. ' ' .$pro->product_type . ' ' .$pro->unit_numbers . ' '.$pro->unit . ' * '. $pro->carton_unit . ' حبة';

                }
            

                if(isset($sub_sub_cate)) {

                    $pro->category_ids = [array('id' => strval($pro->category_ids) , 'position' => 1), array('id' => strval($sub_cate->id), 'position' => 2), array('id' => strval($sub_sub_cate->id), 'position' => 3)];

                } else {

                    $pro->category_ids = [array('id' => strval($pro->category_ids) , 'position' => 1), array('id' => strval($sub_cate->id), 'position' => 2)];

                }


                $pro->images = array($pro->images);
            
            }
       
       
       	    array_push($data,$pro);
     
        
    
            
             // $product = Helpers::product_data_formatting($product);
            return response()->json($data, 200);
        }else{
            
            $data = [];
             // $product = Helpers::product_data_formatting($product);
            return response()->json($data, 200);
        }
        
        
    
    }
}
