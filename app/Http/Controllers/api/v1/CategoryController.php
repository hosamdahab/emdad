<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CategoryManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\subsCategory;
use App\Model\sub_sub_category;
use Illuminate\Http\Request;
use App\Model\Product;
use App\Model\Brand;
use DB;

class CategoryController extends Controller
{
    public function get_categories()
    {
        $category = Category::all();

        foreach($category as $cate) {

            $sub_category = subsCategory::where('parent_id', '=', $cate->id)->get();

            $cate['childes'] = $sub_category;

            foreach($sub_category as $val) {

                $sub_sub_category = sub_sub_category::where('sub_category_id', '=', $val->id)->get();
			
		$val->position = (integer)$val->position;
		$val->parent_id = (integer)$val->parent_id;
		
		foreach($sub_sub_category as $sub) {
		
		$sub->position = (integer)$sub->position;
		$sub->parent_id = (integer)$sub->parent_id;
		
		$sub['childes'] = $sub_sub_category;
		
		}
		
                

            }

        }

        return response()->json($category,200);
    }

    public function get_products($id)
    {

       
        $get_cate = DB::table('categories')->where('id', '=', $id)->first();

        if(isset($get_cate)) {


       
        $pro = DB::table('products')->where('category_ids', '=', $get_cate->id)->get();

            if(count($pro) > 0) {

                foreach($pro as $products) {


                
                    $sub_cate = subsCategory::where('id','=', $products->sub_category_id)->first();
                    $sub_sub_cate = sub_sub_category::where('id','=', $products->sub_sub_category_id)->first();
                    $Brand = Brand::where('id', '=', $products->brand_id)->first();

                    
                    $products->choice_options = [array('name' => 'choice_19', 'title' => 'الحجم', 'options' => array($products->unit . $products->unit_numbers)), array('name' => 'choice_18', 'title' => 'الكمية', 'options' => array($products->carton_unit)), array('name' => 'choice_7', 'title' => 'النكهة', 'options' => array($products->product_type))];

                    $products->variation = [array('type' => $products->unit.'-'.$products->carton_unit.'-'.$products->product_type.$products->unit_numbers, 'price' => (integer)$products->unit_price, 'sku' => $products->sku, 'qty' => (integer)$products->current_stock)];

                    (integer)$products->brand_id;
                    $products->id = (integer)$products->id;
                    $products->min_qty = (integer)$products->min_qty;
                    $products->purchase_price = (integer)$products->purchase_price;
                    $products->unit_price = (integer)$products->unit_price;
                    $products->brand_id = (integer)$products->brand_id;
                    $products->current_stock = (integer)$products->current_stock;
                    $products->user_id = (integer)$products->user_id;
                    $products->unit_numbers = strval($products->unit_numbers);
                    $products->tax = (integer)$products->tax;
                    $products->tax_type = 'percent';
                    if($products->discount != null) {

                        $products->discount = (integer)$products->discount;

                    } else {

                        $products->discount = (integer)0;
                    }
                    $products->discount_type = 'percent';
                    $products->attributes = array(19, 18, 7);
                    $products->colors = [];

                    if($products->name != null) {

                        $products->name = $Brand->name. ' ' .$products->name . ' ' .$products->unit_numbers . ' ' .$products->unit . ' * '. $products->carton_unit . 'حبة';

                    } else {

                        $products->name = $Brand->name. ' ' .$products->product_type . ' ' .$products->unit_numbers . ' '.$products->unit . ' * '. $products->carton_unit . ' حبة';

                    }
                

                    if(isset($sub_sub_cate)) {

                        $products->category_ids = [array('id' => strval($products->category_ids) , 'position' => 1), array('id' => strval($sub_cate->id), 'position' => 2), array('id' => strval($sub_sub_cate->id), 'position' => 3)];

                    } else {

                        $products->category_ids = [array('id' => strval($products->category_ids) , 'position' => 1), array('id' => strval($sub_cate->id), 'position' => 2)];

                    }

                    $products->qty = $products->unit_numbers.' '.$products->unit.' x '.$products->carton_unit;
                    $products->images = array($products->images);

                }
                
                return [
                    
                    $products
                ];

            

            } else {

            return [];
            }

        } else {

            return [];
        }

    }
}
