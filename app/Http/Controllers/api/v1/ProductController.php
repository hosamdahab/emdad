<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CategoryManager;
use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\CPU\ProductManager;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\OrderDetail;
use App\Model\Product;
use App\Model\Review;
use App\Model\ShippingMethod;
use App\Model\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use function App\CPU\translate;
use App\Model\subsCategory;
use App\Model\sub_sub_category;
use App\Model\Brand;


class ProductController extends Controller
{
    public function get_latest_products(Request $request,$limit = 10, $offset = 1)
    {
       
        $products = DB::table('products')->latest()->get();

        if(count($products) > 0) {

          

            foreach($products as $pro) { 

                $sub_cate = subsCategory::where('id','=', $pro->sub_category_id)->first();
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

        } else {

            $products = [];

        }

        return [
            'total_size' => count($products),
            'limit' => (integer)$limit,
            'offset' => (integer)$offset,
            'products' => $products
        ];

    }

    public function get_featured_products(Request $request)
    {
        $products = ProductManager::get_featured_products($request['limit'], $request['offset']);
        // $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }

    public function get_top_rated_products(Request $request,$limit = 10, $offset = 1)
    {
        // $products = ProductManager::get_top_rated_products($request['limit'], $request['offset']);
        // $products['products'] = Helpers::product_data_formatting($products['products'], true);

        $reviews = DB::table('reviews')->get();
        $reviews_count = DB::table('reviews')->count('id');

        

        if(count($reviews) > 0) {

            $data = [];
            foreach($reviews as $re) {

                $products = DB::table('products')->where('id', '=', $re->product_id)->first();
                $sub_cate = Category::where('id','=', $products->category_ids)->first();
                $sub_sub_cate = sub_sub_category::where('id','=', $products->sub_sub_category_id)->first();
                $Brand = Brand::where('id', '=', $products->brand_id)->first();


                $products->choice_options = [array('name' => 'choice_19', 'title' => 'الحجم', 'options' => array($products->unit . $products->unit_numbers)), array('name' => 'choice_18', 'title' => 'الكمية', 'options' => array($products->carton_unit)), array('name' => 'choice_7', 'title' => 'النكهة', 'options' => array($products->product_type))];

                $products->variation = [array('type' => $products->unit.'-'.$products->carton_unit.'-'.$products->product_type.$products->unit_numbers, 'price' => $products->unit_price, 'sku' => $products->sku, 'qty' => $products->current_stock)];

                $products->attributes = array(19, 18, 7);

                if($products->name != null) {

                    $products->name = $Brand->name. ' ' .$products->name . ' ' .$products->unit_numbers . ' ' .$products->unit . ' * '. $products->carton_unit . 'حبة';

                } else {

                    $products->name = $Brand->name. ' ' .$products->product_type . ' ' .$products->unit_numbers . ' '.$products->unit . ' * '. $products->carton_unit . ' حبة';

                }


                if(isset($sub_sub_cate)) {

                    $products->category_ids = [array('id' => $products->category_ids , 'position' => '1'), array('id' => $sub_cate->id, 'position' => '2'), array('id' => $sub_sub_cate->id, 'position' => '3')];

                } else {

                    $products->category_ids = [array('id' => $products->category_ids , 'position' => '1'), array('id' => $sub_cate->id, 'position' => '2')];

                }


                $products->images = array($products->images);


                array_push($data, $products);

            
            }

        }
      

        

        return [
            'total_size' => $reviews_count,
            'limit' => (integer)$limit,
            'offset' => (integer)$offset,
            'products' => $data
        ];
       
    }

    public function get_searched_products(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $products = ProductManager::search_products($request['name'], $request['limit'], $request['offset']);
        if ($products['products'] == null) {
            $products = ProductManager::translated_product_search($request['name'], $request['limit'], $request['offset']);
        }
        $products['products'] = Helpers::product_data_formatting($products['products'], true);
        return response()->json($products, 200);
    }

    public function get_product($slug)
    {
        $products = DB::table('products')->where('slug', '=', $slug)->first();

        if(isset($products)) {


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

                $products->qty = ($products->unit_numbers.' '.$products->unit).' x '.($products->carton_unit);
                $products->images = array($products->images);

            return response()->json(['product' => $products],200);
           

        } else {



        return [];
        }


    }

    public function get_best_sellings(Request $request, $limit = 10, $offset = 1)
    {
       
       
        $orders = OrderDetail::all();
       
        $paginator = OrderDetail::all()->count('id');

        if(count($orders) > 0) {

            $data = [];
            foreach($orders as $order) {

                $products = DB::table('products')->where('id', '=', $order->product_id)->first();
                $sub_cate = Category::where('id','=', $products->category_ids)->first();
                $sub_sub_cate = sub_sub_category::where('id','=', $products->sub_sub_category_id)->first();
                $Brand = Brand::where('id', '=', $products->brand_id)->first();


                $products->choice_options = [array('name' => 'choice_19', 'title' => 'الحجم', 'options' => array($products->unit . $products->unit_numbers)), array('name' => 'choice_18', 'title' => 'الكمية', 'options' => array($products->carton_unit)), array('name' => 'choice_7', 'title' => 'النكهة', 'options' => array($products->product_type))];

                $products->variation = [array('type' => $products->unit.'-'.$products->carton_unit.'-'.$products->product_type.$products->unit_numbers, 'price' => $products->unit_price, 'sku' => $products->sku, 'qty' => $products->current_stock)];

                $products->attributes = array(19, 18, 7);

                if($products->name != null) {

                    $products->name = $Brand->name. ' ' .$products->name . ' ' .$products->unit_numbers . ' ' .$products->unit . ' * '. $products->carton_unit . 'حبة';

                } else {

                    $products->name = $Brand->name. ' ' .$products->product_type . ' ' .$products->unit_numbers . ' '.$products->unit . ' * '. $products->carton_unit . ' حبة';

                }


                if(isset($sub_sub_cate)) {

                    $products->category_ids = [array('id' => $products->category_ids , 'position' => '1'), array('id' => $sub_cate->id, 'position' => '2'), array('id' => $sub_sub_cate->id, 'position' => '3')];

                } else {

                    $products->category_ids = [array('id' => $products->category_ids , 'position' => '1'), array('id' => $sub_cate->id, 'position' => '2')];

                }


                $products->images = array($products->images);


                array_push($data, $products);

            }

         

        }
          
        return [
            'total_size' => $paginator,
            'limit' => (integer)$limit,
            'offset' => (integer)$offset,
            'products' => $data,
           
        
        ];

       
    }

    public function get_home_categories()
    {
        $categories = Category::where('home_status', true)->get();
        // $categories->map(function ($data) {
        //     $data['products'] = Helpers::product_data_formatting(CategoryManager::products($data['id']), true);
        //     return $data;
        // });

        foreach($categories as $cate) {

            $product = Product::where('category_ids','=', $cate->id)->get();
            
            $cate->priority = 0;

            if(isset($product)) {

                foreach($product as $pro) {

                    foreach($pro as $val) {

                        $sub_cate = subsCategory::where('id','=', $pro->sub_category_id)->first();

                       

                        $sub_sub_cate = sub_sub_category::where('id','=', $pro->sub_sub_category_id)->first();

                        $Brand = Brand::where('id', '=', $pro->brand_id)->first();

                      

                    }

                    $pro->choice_options = [array('name' => 'choice_19', 'title' => 'الحجم', 'options' => array($pro->unit . $pro->unit_numbers)), array('name' => 'choice_18', 'title' => 'الكمية', 'options' => array($pro->carton_unit)), array('name' => 'choice_7', 'title' => 'النكهة', 'options' => array($pro->product_type))];

                    $pro->variation = [array('type' => $pro->unit.'-'.$pro->carton_unit.'-'.$pro->product_type.$pro->unit_numbers, 'price' => $pro->unit_price, 'sku' => $pro->sku, 'qty' => $pro->current_stock)];

                    $pro->attributes = array(19, 18, 7);

                    $pro['qty'] = $pro->unit_numbers.' '.$pro->unit.' x '.$pro->carton_unit;

                    

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

                    $pro->tax = (integer)$pro->tax;
                    $pro->tax_type = 'percent';
                    if($pro->discount != null) {
    
                        $pro->discount = (integer)$pro->discount;
    
                    } else {
    
                        $pro->discount = (integer)0;
                    }

                    $pro->discount_type = 'percent';

                    $pro->colors = [];

                    $pro->images = array($pro->images);

                    $cate['products']= array($pro);

                }
                
            }
    

        }

       
       
        return response()->json($categories, 200);
    }

    public function get_related_products($id)
    {
        if (Product::find($id)) {
            $products = ProductManager::get_related_products($id);
            // $products = Helpers::product_data_formatting($products, true);
            return response()->json($products, 200);
        }
        return response()->json([
            'errors' => ['code' => 'product-001', 'message' => translate('Product not found!')]
        ], 404);
    }

    public function get_product_reviews($id)
    {
        $reviews = Review::with(['customer'])->where(['product_id' => $id])->get();

        $storage = [];
        foreach ($reviews as $item) {
            $item['attachment'] = json_decode($item['attachment']);
            array_push($storage, $item);
        }

        $get_pro = Product::where('id', '=', $id)->first();

        if(isset($get_pro)) {

            $result = $get_pro->carton_unit . ' * ' . $get_pro->unit_numbers . ' ' . $get_pro->unit;

            array_push($storage,$result);

        } else {

            $storage = $storage;
        }

      


        return response()->json($storage, 200);
    }

    public function get_product_rating($id)
    {
        try {
            $product = Product::find($id);
            $overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews);
            return response()->json(floatval($overallRating[0]), 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function counter($product_id)
    {
        try {
            $countOrder = OrderDetail::where('product_id', $product_id)->count();
            $countWishlist = Wishlist::where('product_id', $product_id)->count();
            return response()->json(['order_count' => $countOrder, 'wishlist_count' => $countWishlist], 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function social_share_link($product_slug)
    {
        $product = Product::where('slug', $product_slug)->first();
        $link = route('product', $product->slug);
        try {

            return response()->json($link, 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function submit_product_review(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
            'comment' => 'required',
            'rating' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $image_array = [];
        if (!empty($request->file('fileUpload'))) {
            foreach ($request->file('fileUpload') as $image) {
                if ($image != null) {
                    array_push($image_array, ImageManager::upload('review/', 'png', $image));
                }
            }
        }

        $review = new Review;
        $review->customer_id = $request->user()->id;
        $review->product_id = $request->product_id;
        $review->comment = $request->comment;
        $review->rating = $request->rating;
        $review->attachment = json_encode($image_array);
        $review->save();

        return response()->json(['message' => translate('successfully review submitted!')], 200);
    }

    public function get_shipping_methods(Request $request)
    {
        $methods = ShippingMethod::where(['status' => 1])->get();
        return response()->json($methods, 200);
    }

    public function get_discounted_product(Request $request, $limit = 10, $offset = 1)
    {
        $products = DB::table('products')->where('discount', '!=', 0)->get();

        if(count($products) > 0) {

          

            foreach($products as $pro) { 

                $sub_cate = subsCategory::where('id','=', $pro->sub_category_id)->first();
                $sub_sub_cate = sub_sub_category::where('id','=', $pro->sub_sub_category_id)->first();
                $Brand = Brand::where('id', '=', $pro->brand_id)->first();

                
                $pro->choice_options = [array('name' => 'choice_19', 'title' => 'الحجم', 'options' => array($pro->unit . $pro->unit_numbers)), array('name' => 'choice_18', 'title' => 'الكمية', 'options' => array($pro->carton_unit)), array('name' => 'choice_7', 'title' => 'النكهة', 'options' => array($pro->product_type))];

                $pro->variation = [array('type' => $pro->unit.'-'.$pro->carton_unit.'-'.$pro->product_type.$pro->unit_numbers, 'price' => $pro->unit_price, 'sku' => $pro->sku, 'qty' => $pro->current_stock)];

                $pro->attributes = array(19, 18, 7);

                if($pro->name != null) {

                    $pro->name = $Brand->name. ' ' .$pro->name . ' ' .$pro->unit_numbers . ' ' .$pro->unit . ' * '. $pro->carton_unit . 'حبة';

                } else {

                    $pro->name = $Brand->name. ' ' .$pro->product_type . ' ' .$pro->unit_numbers . ' '.$pro->unit . ' * '. $pro->carton_unit . ' حبة';

                }
              

                if(isset($sub_sub_cate)) {

                    $pro->category_ids = [array('id' => $pro->category_ids , 'position' => '1'), array('id' => $sub_cate->id, 'position' => '2'), array('id' => $sub_sub_cate->id, 'position' => '3')];

                } else {

                    $pro->category_ids = [array('id' => $pro->category_ids , 'position' => '1'), array('id' => $sub_cate->id, 'position' => '2')];

                }


                $pro->images = array($pro->images);

               

            }

        } else {

            $products = [];

        }

        return [
            'total_size' => count($products),
            'limit' => (integer)$limit,
            'offset' => (integer)$offset,
            'products' => $products
        ];
    }
}
