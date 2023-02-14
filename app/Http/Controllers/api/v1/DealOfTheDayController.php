<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\DealOfTheDay;
use App\Model\Product;
use App\CPU\Helpers;
use App\Model\Category;
use App\Model\subsCategory;
use App\Model\sub_sub_category;
use App\Model\Brand;

class DealOfTheDayController extends Controller
{
    public function get_deal_of_the_day_product(Request $request)
    {
        $deal_of_the_day = DealOfTheDay::where('status','=', '1')->get();
        
        if(isset($deal_of_the_day)){
        
        $data = [];
        foreach($deal_of_the_day as $val) {
        
        $products = Product::where('id', '=',$val->product_id)->get();
        
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
     
        
        }
            
             // $product = Helpers::product_data_formatting($product);
            return response()->json($data, 200);
        }else{
            
            $data = [];
             // $product = Helpers::product_data_formatting($product);
            return response()->json($data, 200);
        }
        
        
    }
}
