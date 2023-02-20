<?php

namespace App\Http\Controllers\Web;

use App\CPU\Helpers;
use App\CPU\OrderManager;
use App\CPU\ProductManager;
use App\CPU\CartManager;
use App\Http\Controllers\Controller;
use App\Model\Admin;
use App\Model\Brand;
use App\Model\BusinessSetting;
use App\Model\Cart;
use App\Model\CartShipping;
use App\Model\Category;
use App\Model\Contact;
use App\Model\DealOfTheDay;
use App\Model\FlashDeal;
use App\Model\FlashDealProduct;
use App\Model\HelpTopic;
use App\Model\OrderDetail;
use App\Model\Customers_Chat;
use App\Model\Product;
use App\Model\CustomerWallet;
use App\Model\Review;
use App\Model\Seller;
use App\Model\Subscription;
use App\Model\ShippingMethod;
use App\Model\Shop;
use App\Model\Order;
use App\Model\Transaction;
use App\Model\Translation;
use App\Model\CustomerLocations;
use App\Model\Coupon;
use App\User;
use Carbon\Carbon;
use App\Model\Wishlist;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use function App\CPU\translate;
use App\Model\ShippingType;
use Facade\FlareClient\Http\Response;
use Gregwar\Captcha\PhraseBuilder;
use Gregwar\Captcha\CaptchaBuilder;
use Illuminate\Support\Facades\Auth;
use App\Model\ShippingAddress;
use App\Model\sub_sub_category;

class WebController extends Controller
{
    public function maintenance_mode()
    {
        $maintenance_mode = Helpers::get_business_settings('maintenance_mode') ?? 0;
        if ($maintenance_mode) {
            return view('web-views.maintenance-mode');
        }
        return redirect()->route('home');
    }
    public function customer_location_add_helper(Request $request){
        $id = auth('customer')->user()->id;
        $user = User::find($id)->update([
            'city' => $request->location_city,
            'country' => $request->location_country,
        ]);
        return redirect()->route('home');
    }
    public function customer_search_products(Request $request) {

        $item = $request->search;
        $result = ProductManager::search_products_web($request['name']);
        $products = $result['products'];
        return view('web-views.partials._search-result', compact('products'));
    }
    public function home()
    {
        $home_categories = Category::where('home_status', true)->priority()->get();
        $home_categories->map(function ($data) {
            $id = '"'.$data['id'].'"';
            $data['products'] = Product::active()
                ->where('category_ids', 'like', "%{$id}%")
                /*->whereJsonContains('category_ids', ["id" => (string)$data['id']])*/
                ->inRandomOrder()->take(12)->get();
        });
        //products based on top seller
        $top_sellers = Seller::approved()->with('shop')
            ->withCount(['orders'])->orderBy('orders_count', 'DESC')->take(12)->get();
        //end

        //feature products finding based on selling
        $featured_products = Product::with(['reviews'])->active()
            ->where('featured', 1)
            ->withCount(['order_details'])->orderBy('order_details_count', 'DESC')
            ->take(12)
            ->get();
        //end

        $latest_products = Product::with(['reviews'])->active()->orderBy('id', 'desc')->take(8)->get();
        $categories = Category::where('position', 0)->priority()->take(11)->get();
        $brands = Brand::take(15)->get();
        //best sell product
        $bestSellProduct = OrderDetail::with('product.reviews')
            ->whereHas('product', function ($query) {
                $query->active();
            })
            ->select('product_id', DB::raw('COUNT(product_id) as count'))
            ->groupBy('product_id')
            ->orderBy("count", 'desc')
            ->take(4)
            ->get();
        //Top rated
        $topRated = Review::with('product')
            ->whereHas('product', function ($query) {
                $query->active();
            })
            ->select('product_id', DB::raw('AVG(rating) as count'))
            ->groupBy('product_id')
            ->orderBy("count", 'desc')
            ->take(4)
            ->get();

        if ($bestSellProduct->count() == 0) {
            $bestSellProduct = $latest_products;
        }

        if ($topRated->count() == 0) {
            $topRated = $bestSellProduct;
        }


        $user = Helpers::get_customer();



        $wallet_check = CustomerWallet::where('customer_id', '=', $user->id)->first();

        if(!isset($wallet_check)) {

            CustomerWallet::insert([

                'customer_id'   => $user->id,
                'created_at'    => carbon::now()
            ]);

        }
        $deal_of_the_day = DealOfTheDay::join('products', 'products.id', '=', 'deal_of_the_days.product_id')->select('deal_of_the_days.*', 'products.unit_price')->where('deal_of_the_days.status', 1)->first();

        return view('web-views.home', compact('featured_products', 'topRated', 'bestSellProduct', 'latest_products', 'categories', 'brands', 'deal_of_the_day', 'top_sellers', 'home_categories'));
    }

    public function flash_deals($id)
    {
        $deal = FlashDeal::with(['products.product.reviews'])->where(['id' => $id, 'status' => 1])->whereDate('start_date', '<=', date('Y-m-d'))->whereDate('end_date', '>=', date('Y-m-d'))->first();

        $discountPrice = FlashDealProduct::with(['product'])->whereHas('product', function ($query) {
            $query->active();
        })->get()->map(function ($data) {
            return [
                'discount' => $data->discount,
                'sellPrice' => $data->product->unit_price,
                'discountedPrice' => $data->product->unit_price - $data->discount,

            ];
        })->toArray();
        // dd($deal->toArray());

        if (isset($deal)) {
            return view('web-views.deals', compact('deal', 'discountPrice'));
        }
        Toastr::warning(translate('not_found'));
        return back();
    }

    public function search_shop(Request $request)
    {
        $key = explode(' ', $request['shop_name']);
        $sellers = Shop::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })->whereHas('seller', function ($query) {
            return $query->where(['status' => 'approved']);
        })->paginate(30);
        return view('web-views.sellers', compact('sellers'));
    }

    public function all_categories()
    {
        $categories = Category::all();
        return view('web-views.categories', compact('categories'));
    }

    public function categories_by_category($id)
    {
        $category = Category::with(['childes.childes'])->where('id', $id)->first();
        return response()->json([
            'view' => view('web-views.partials._category-list-ajax', compact('category'))->render(),
        ]);
    }

    public function all_brands()
    {
        $brands = Brand::paginate(24);
        return view('web-views.brands', compact('brands'));
    }

    public function all_sellers()
    {
        $sellers = Shop::whereHas('seller', function ($query) {
            return $query->approved();
        })->paginate(24);
        return view('web-views.sellers', compact('sellers'));
    }

    public function seller_profile($id)
    {
        $seller_info = Seller::find($id);
        return view('web-views.seller-profile', compact('seller_info'));
    }

    public function searched_products(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ], [
            'name.required' => 'Product name is required!',
        ]);

        $result = ProductManager::search_products_web($request['name']);
        $products = $result['products'];

        if ($products == null) {
            $result = ProductManager::translated_product_search_web($request['name']);
            $products = $result['products'];
        }

        return response()->json([
            'result' => view('web-views.partials._search-result', compact('products'))->render(),
        ]);
    }

    public function checkout_details(Request $request)
    {
        $cart_group_ids = CartManager::get_cart_group_ids();
        // return count($ cart_group_ids);
        $shippingMethod = Helpers::get_business_settings('shipping_method');
        $carts = Cart::whereIn('cart_group_id', $cart_group_ids)->get();
        foreach($carts as $cart)
        {
            if ($shippingMethod == 'inhouse_shipping') {
                $admin_shipping = ShippingType::where('seller_id',0)->first();
                $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';
            } else {
                if($cart->seller_is == 'admin'){
                    $admin_shipping = ShippingType::where('seller_id',0)->first();
                    $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';
                }else{
                    $seller_shipping = ShippingType::where('seller_id',$cart->seller_id)->first();
                    $shipping_type = isset($seller_shipping)==true?$seller_shipping->shipping_type:'order_wise';
                }
            }
            
            if($shipping_type == 'order_wise'){
                $cart_shipping = CartShipping::where('cart_group_id', $cart->cart_group_id)->first();
                if (!isset($cart_shipping)) {
                    Toastr::info(translate('select_shipping_method_first'));
                    return redirect('shop-cart');
                }
            }
        }
        

        if (count($cart_group_ids) > 0) {
            return view('web-views.checkout-shipping');

        }

        Toastr::info(translate('no_items_in_basket'));
        return redirect('/');
    }

    public function checkout_payment()
    {
        $cart_group_ids = CartManager::get_cart_group_ids();
        
        $shippingMethod = Helpers::get_business_settings('shipping_method');
        $carts = Cart::whereIn('cart_group_id', $cart_group_ids)->get();
        foreach($carts as $cart)
        {
            if ($shippingMethod == 'inhouse_shipping') {
                $admin_shipping = ShippingType::where('seller_id',0)->first();
                $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';
            } else {
                if($cart->seller_is == 'admin'){
                    $admin_shipping = ShippingType::where('seller_id',0)->first();
                    $shipping_type = isset($admin_shipping)==true?$admin_shipping->shipping_type:'order_wise';
                }else{
                    $seller_shipping = ShippingType::where('seller_id',$cart->seller_id)->first();
                    $shipping_type = isset($seller_shipping)==true?$seller_shipping->shipping_type:'order_wise';
                }
            }
            if($shipping_type == 'order_wise'){
                $cart_shipping = CartShipping::where('cart_group_id', $cart->cart_group_id)->first();
                if (!isset($cart_shipping)) {
                    Toastr::info(translate('select_shipping_method_first'));
                    return redirect('shop-cart');
                }
            }
        }

        if (session()->has('address_id') && count($cart_group_ids) > 0) {
            return view('web-views.checkout-payment');
        }

        Toastr::error(translate('incomplete_info'));
        return back();
    }

    public function checkout_complete(Request $request)
    {
        $unique_id = OrderManager::gen_unique_id();
        $order_ids = [];
        foreach (CartManager::get_cart_group_ids() as $group_id) {
            $data = [
                'payment_method' => 'cash_on_delivery',
                'order_status' => 'pending',
                'payment_status' => 'unpaid',
                'transaction_ref' => '',
                'order_group_id' => $unique_id,
                'cart_group_id' => $group_id
            ];
            $order_id = OrderManager::generate_order($data);
            array_push($order_ids, $order_id);
        }

        CartManager::cart_clean();


        // $token = mt_rand(1111, 9999);
        // $this->token = $token;

        // $sender = "967777794438";
        // $dest = "967" . $request->phone;
        // $massagestouser1 = " حياك الله في امــداد، تفضل رمز الدخول: ";
        // $isiPesan = $massagestouser1 . "" . $token . "";


        // Session::put("seller.token", $token);

        // // masukan data pengiriman pesan ke log
        // $curl = curl_init();
        // $data = [
        //     'number' => $sender, // number sender
        //     'message' => $isiPesan, // message content
        //     'to' => $dest, // number receiver
        // ];

        // curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        // curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        // curl_setopt($curl, CURLOPT_URL, 'https://api.stiker-label.com/send');
        // curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        // curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // $result = curl_exec($curl);
        // curl_close($curl);


        return view('web-views.checkout-complete');
    }

    public function order_placed()
    {
        return view('web-views.checkout-complete');
    }

    public function shop_cart(Request $request)
    {
        if (auth('customer')->check() && Cart::where(['customer_id' => auth('customer')->id()])->count() > 0) {
            return view('web-views.shop-cart');
        }
        Toastr::info(translate('no_items_in_basket'));
        return redirect('/');
    }

    //for seller Shop

    public function seller_shop(Request $request, $id)
    {
        $business_mode=Helpers::get_business_settings('business_mode');
        
        if($id!=0 && $business_mode == 'single')
        {
            Toastr::error(translate('access_denied!!'));
            return back();
        }
        $product_ids = Product::active()
            ->when($id == 0, function ($query) {
                return $query->where(['added_by' => 'admin']);
            })
            ->when($id != 0, function ($query) use ($id) {
                return $query->where(['added_by' => 'seller'])
                    ->where('user_id', $id);
            })
            ->pluck('id')->toArray();

        
        $avg_rating = Review::whereIn('product_id', $product_ids)->avg('rating');
        $total_review = Review::whereIn('product_id', $product_ids)->count();
        if($id == 0){
            $total_order = Order::where('seller_is','admin')->where('order_type','default_type')->count();
        }else{
            $seller = Seller::find($id);
            $total_order = $seller->orders->where('seller_is','seller')->where('order_type','default_type')->count();
        }
        

        //finding category ids
        $products = Product::whereIn('id', $product_ids)->paginate(12);

        $category_info = [];
        foreach ($products as $product) {
            array_push($category_info, $product['category_ids']);
        }

        $category_info_decoded = [];
        foreach ($category_info as $info) {
            array_push($category_info_decoded, json_decode($info));
        }

        $category_ids = [];
        foreach ($category_info_decoded as $decoded) {
            foreach ($decoded as $info) {
                array_push($category_ids, $info->id);
            }
        }

        $categories = [];
        foreach ($category_ids as $category_id) {
            $category = Category::with(['childes.childes'])->where('position', 0)->find($category_id);
            if ($category != null) {
                array_push($categories, $category);
            }
        }
        $categories = array_unique($categories);
        //end

        //products search
        if ($request->product_name) {
            $products = Product::active()
                ->when($id == 0, function ($query) {
                    return $query->where(['added_by' => 'admin']);
                })
                ->when($id != 0, function ($query) use ($id) {
                    return $query->where(['added_by' => 'seller'])
                        ->where('user_id', $id);
                })
                ->where('name', 'like', $request->product_name . '%')
                ->paginate(12);
        } elseif ($request->category_id) {
            $products = Product::active()
                ->when($id == 0, function ($query) {
                    return $query->where(['added_by' => 'admin']);
                })
                ->when($id != 0, function ($query) use ($id) {
                    return $query->where(['added_by' => 'seller'])
                        ->where('user_id', $id);
                })
                ->whereJsonContains('category_ids', [
                    ['id' => strval($request->category_id)],
                ])->paginate(12);
        }

        if ($id == 0) {
            $shop = [
                'id' => 0,
                'name' => Helpers::get_business_settings('company_name'),
            ];
        } else {
            $shop = Shop::where('seller_id', $id)->first();
            if (isset($shop) == false) {
                Toastr::error(translate('shop_does_not_exist'));
                return back();
            }
        }

        return view('web-views.shop-page', compact('products', 'shop', 'categories'))
            ->with('seller_id', $id)
            ->with('total_review', $total_review)
            ->with('avg_rating', $avg_rating)
            ->with('total_order', $total_order);
    }

    //ajax filter (category based)
    public function seller_shop_product(Request $request, $id)
    {
        $products = Product::active()->with('shop')->where(['added_by' => 'seller'])
            ->where('user_id', $id)
            ->whereJsonContains('category_ids', [
                ['id' => strval($request->category_id)],
            ])
            ->paginate(12);
        $shop = Shop::where('seller_id', $id)->first();
        if ($request['sort_by'] == null) {
            $request['sort_by'] = 'latest';
        }

        if ($request->ajax()) {
            return response()->json([
                'view' => view('web-views.products._ajax-products', compact('products'))->render(),
            ], 200);

        }

        return view('web-views.shop-page', compact('products', 'shop'))->with('seller_id', $id);
    }

    public function quick_view(Request $request)
    {
        $product = ProductManager::get_product($request->product_id);
        $order_details = OrderDetail::where('product_id', $product->id)->get();
        $wishlists = Wishlist::where('product_id', $product->id)->get();
        $countOrder = count($order_details);
        $countWishlist = count($wishlists);
        $relatedProducts = Product::with(['reviews'])->where('category_ids', $product->category_ids)->where('id', '!=', $product->id)->limit(12)->get();
        return response()->json([
            'success' => 1,
            'view' => view('web-views.partials._quick-view-data', compact('product', 'countWishlist', 'countOrder', 'relatedProducts'))->render(),
        ]);
    }

    public function product($slug)
    {
        $product = Product::active()->with(['reviews'])->where('slug', $slug)->first();
        if ($product != null) {
            $countOrder = OrderDetail::where('product_id', $product->id)->count();
            $countWishlist = Wishlist::where('product_id', $product->id)->count();
            $relatedProducts = Product::with(['reviews'])->active()->where('category_ids', $product->category_ids)->where('id', '!=', $product->id)->limit(12)->get();
            $deal_of_the_day = DealOfTheDay::where('product_id', $product->id)->where('status', 1)->first();

            return view('web-views.products.details', compact('product', 'countWishlist', 'countOrder', 'relatedProducts', 'deal_of_the_day'));
        }

        Toastr::error(translate('not_found'));
        return back();
    }

    public function products(Request $request)
    {
        $request['sort_by'] == null ? $request['sort_by'] == 'latest' : $request['sort_by'];

        $porduct_data = Product::active()->with(['reviews']);

        if ($request['data_from'] == 'category') {
            $products = $porduct_data->get();
            $product_ids = [];
            foreach ($products as $product) {
                foreach (json_decode($product['category_ids'], true) as $category) {
                    if ($category['id'] == $request['id']) {
                        array_push($product_ids, $product['id']);
                    }
                }
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'brand') {
            $query = $porduct_data->where('brand_id', $request['id']);
        }

        if ($request['data_from'] == 'latest') {
            $query = $porduct_data->orderBy('id', 'DESC');
        }

        if ($request['data_from'] == 'top-rated') {
            $reviews = Review::select('product_id', DB::raw('AVG(rating) as count'))
                ->groupBy('product_id')
                ->orderBy("count", 'desc')->get();
            $product_ids = [];
            foreach ($reviews as $review) {
                array_push($product_ids, $review['product_id']);
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'best-selling') {
            $details = OrderDetail::with('product')
                ->select('product_id', DB::raw('COUNT(product_id) as count'))
                ->groupBy('product_id')
                ->orderBy("count", 'desc')
                ->get();
            $product_ids = [];
            foreach ($details as $detail) {
                array_push($product_ids, $detail['product_id']);
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'most-favorite') {
            $details = Wishlist::with('product')
                ->select('product_id', DB::raw('COUNT(product_id) as count'))
                ->groupBy('product_id')
                ->orderBy("count", 'desc')
                ->get();
            $product_ids = [];
            foreach ($details as $detail) {
                array_push($product_ids, $detail['product_id']);
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'featured') {
            $query = Product::with(['reviews'])->active()->where('featured', 1);
        }

        if ($request['data_from'] == 'featured_deal') {
            $featured_deal_id = FlashDeal::where(['status'=>1])->where(['deal_type'=>'feature_deal'])->pluck('id')->first();
            $featured_deal_product_ids = FlashDealProduct::where('flash_deal_id',$featured_deal_id)->pluck('product_id')->toArray();
            $query = Product::with(['reviews'])->active()->whereIn('id', $featured_deal_product_ids);
        }

        if ($request['data_from'] == 'search') {
            $key = explode(' ', $request['name']);
            $query = $porduct_data->where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            });
        }

        if ($request['data_from'] == 'discounted') {
            $query = Product::with(['reviews'])->active()->where('discount', '!=', 0);
        }

        if ($request['sort_by'] == 'latest') {
            $fetched = $query->latest();
        } elseif ($request['sort_by'] == 'low-high') {
            $fetched = $query->orderBy('unit_price', 'ASC');
        } elseif ($request['sort_by'] == 'high-low') {
            $fetched = $query->orderBy('unit_price', 'DESC');
        } elseif ($request['sort_by'] == 'a-z') {
            $fetched = $query->orderBy('name', 'ASC');
        } elseif ($request['sort_by'] == 'z-a') {
            $fetched = $query->orderBy('name', 'DESC');
        } else {
            $fetched = $query;
        }

        if ($request['min_price'] != null || $request['max_price'] != null) {
            $fetched = $fetched->whereBetween('unit_price', [Helpers::convert_currency_to_usd($request['min_price']), Helpers::convert_currency_to_usd($request['max_price'])]);
        }

        $data = [
            'id' => $request['id'],
            'name' => $request['name'],
            'data_from' => $request['data_from'],
            'sort_by' => $request['sort_by'],
            'page_no' => $request['page'],
            'min_price' => $request['min_price'],
            'max_price' => $request['max_price'],
        ];

        $products = $fetched->paginate(20)->appends($data);

        if ($request->ajax()) {
            return response()->json([
                'total_product'=>$products->total(),
                'view' => view('web-views.products._ajax-products', compact('products'))->render()
            ], 200);
        }
        if ($request['data_from'] == 'category') {
            $data['brand_name'] = Category::find((int)$request['id'])->name;
        }
        if ($request['data_from'] == 'brand') {
            $data['brand_name'] = Brand::find((int)$request['id'])->name;
        }

        return view('web-views.products.view', compact('products', 'data'), $data);
    }

    public function discounted_products(Request $request)
    {
        $request['sort_by'] == null ? $request['sort_by'] == 'latest' : $request['sort_by'];

        $porduct_data = Product::active()->with(['reviews']);

        if ($request['data_from'] == 'category') {
            $products = $porduct_data->get();
            $product_ids = [];
            foreach ($products as $product) {
                foreach (json_decode($product['category_ids'], true) as $category) {
                    if ($category['id'] == $request['id']) {
                        array_push($product_ids, $product['id']);
                    }
                }
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'brand') {
            $query = $porduct_data->where('brand_id', $request['id']);
        }

        if ($request['data_from'] == 'latest') {
            $query = $porduct_data->orderBy('id', 'DESC');
        }

        if ($request['data_from'] == 'top-rated') {
            $reviews = Review::select('product_id', DB::raw('AVG(rating) as count'))
                ->groupBy('product_id')
                ->orderBy("count", 'desc')->get();
            $product_ids = [];
            foreach ($reviews as $review) {
                array_push($product_ids, $review['product_id']);
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'best-selling') {
            $details = OrderDetail::with('product')
                ->select('product_id', DB::raw('COUNT(product_id) as count'))
                ->groupBy('product_id')
                ->orderBy("count", 'desc')
                ->get();
            $product_ids = [];
            foreach ($details as $detail) {
                array_push($product_ids, $detail['product_id']);
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'most-favorite') {
            $details = Wishlist::with('product')
                ->select('product_id', DB::raw('COUNT(product_id) as count'))
                ->groupBy('product_id')
                ->orderBy("count", 'desc')
                ->get();
            $product_ids = [];
            foreach ($details as $detail) {
                array_push($product_ids, $detail['product_id']);
            }
            $query = $porduct_data->whereIn('id', $product_ids);
        }

        if ($request['data_from'] == 'featured') {
            $query = Product::with(['reviews'])->active()->where('featured', 1);
        }

        if ($request['data_from'] == 'search') {
            $key = explode(' ', $request['name']);
            $query = $porduct_data->where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            });
        }

        if ($request['data_from'] == 'discounted_products') {
            $query = Product::with(['reviews'])->active()->where('discount', '!=', 0);
        }

        if ($request['sort_by'] == 'latest') {
            $fetched = $query->latest();
        } elseif ($request['sort_by'] == 'low-high') {
            return "low";
            $fetched = $query->orderBy('unit_price', 'ASC');
        } elseif ($request['sort_by'] == 'high-low') {
            $fetched = $query->orderBy('unit_price', 'DESC');
        } elseif ($request['sort_by'] == 'a-z') {
            $fetched = $query->orderBy('name', 'ASC');
        } elseif ($request['sort_by'] == 'z-a') {
            $fetched = $query->orderBy('name', 'DESC');
        } else {
            $fetched = $query;
        }

        if ($request['min_price'] != null || $request['max_price'] != null) {
            $fetched = $fetched->whereBetween('unit_price', [Helpers::convert_currency_to_usd($request['min_price']), Helpers::convert_currency_to_usd($request['max_price'])]);
        }

        $data = [
            'id' => $request['id'],
            'name' => $request['name'],
            'data_from' => $request['data_from'],
            'sort_by' => $request['sort_by'],
            'page_no' => $request['page'],
            'min_price' => $request['min_price'],
            'max_price' => $request['max_price'],
        ];

        $products = $fetched->paginate(5)->appends($data);

        if ($request->ajax()) {
            return response()->json([
                'view' => view('web-views.products._ajax-products', compact('products'))->render()
            ], 200);
        }
        if ($request['data_from'] == 'category') {
            $data['brand_name'] = Category::find((int)$request['id'])->name;
        }
        if ($request['data_from'] == 'brand') {
            $data['brand_name'] = Brand::find((int)$request['id'])->name;
        }

        return view('web-views.products.view', compact('products', 'data'), $data);

    }

    public function viewWishlist()
    {
        $wishlists = Wishlist::where('customer_id', auth('customer')->id())->get();
        return view('web-views.users-profile.account-wishlist', compact('wishlists'));
    }

    public function storeWishlist(Request $request)
    {
        if ($request->ajax()) {
            if (auth('customer')->check()) {
                $wishlist = Wishlist::where('customer_id', auth('customer')->id())->where('product_id', $request->product_id)->first();
                if (empty($wishlist)) {

                    $wishlist = new Wishlist;
                    $wishlist->customer_id = auth('customer')->id();
                    $wishlist->product_id = $request->product_id;
                    $wishlist->save();

                    $countWishlist = Wishlist::where('customer_id', auth('customer')->id())->get();
                    $data = "Product has been added to wishlist";

                    $product_count = Wishlist::where(['product_id' => $request->product_id])->count();
                    session()->put('wish_list', Wishlist::where('customer_id', auth('customer')->user()->id)->pluck('product_id')->toArray());
                    return response()->json(['success' => $data, 'value' => 1, 'count' => count($countWishlist), 'id' => $request->product_id, 'product_count' => $product_count]);
                } else {
                    $data = "Product already added to wishlist";
                    return response()->json(['error' => $data, 'value' => 2]);
                }

            } else {
                $data = translate('login_first');
                return response()->json(['error' => $data, 'value' => 0]);
            }
        }
    }

    public function deleteWishlist(Request $request)
    {
        Wishlist::where(['product_id' => $request['id'], 'customer_id' => auth('customer')->id()])->delete();
        $data = "Product has been remove from wishlist!";
        $wishlists = Wishlist::where('customer_id', auth('customer')->id())->get();
        session()->put('wish_list', Wishlist::where('customer_id', auth('customer')->user()->id)->pluck('product_id')->toArray());
        return response()->json([
            'success' => $data,
            'count' => count($wishlists),
            'id' => $request->id,
            'wishlist' => view('web-views.partials._wish-list-data', compact('wishlists'))->render(),
        ]);
    }

    //for HelpTopic
    public function helpTopic()
    {
        $helps = HelpTopic::Status()->latest()->get();
        return view('web-views.help-topics', compact('helps'));
    }

    //for Contact US Page
    public function contacts()
    {
        return view('web-views.contacts');
    }

    public function about_us()
    {
        $about_us = BusinessSetting::where('type', 'about_us')->first();
        return view('web-views.about-us', [
            'about_us' => $about_us,
        ]);
    }

    public function termsandCondition()
    {
        $terms_condition = BusinessSetting::where('type', 'terms_condition')->first();
        return view('web-views.terms', compact('terms_condition'));
    }

    public function privacy_policy()
    {
        $privacy_policy = BusinessSetting::where('type', 'privacy_policy')->first();
        return view('web-views.privacy-policy', compact('privacy_policy'));
    }

    //order Details

    public function orderdetails()
    {
        return view('web-views.orderdetails');
    }

    public function chat_for_product(Request $request)
    {
        return $request->all();
    }

    public function supportChat()
    {
        return view('web-views.users-profile.profile.supportTicketChat');
    }

    public function error()
    {
        return view('web-views.404-error-page');
    }

    public function contact_store(Request $request)
    {
        //recaptcha validation
        $recaptcha = Helpers::get_business_settings('recaptcha');
        if (isset($recaptcha) && $recaptcha['status'] == 1) {
            
            try {
                $request->validate([
                    'g-recaptcha-response' => [
                        function ($attribute, $value, $fail) {
                            $secret_key = Helpers::get_business_settings('recaptcha')['secret_key'];
                            $response = $value;
                            $url = 'https://www.google.com/recaptcha/api/siteverify?secret=' . $secret_key . '&response=' . $response;
                            $response = \file_get_contents($url);
                            $response = json_decode($response);
                            if (!$response->success) {
                                $fail(\App\CPU\translate('ReCAPTCHA Failed'));
                            }
                        },
                    ],
                ]);

            } catch (\Exception $exception) {
                return back()->withErrors(\App\CPU\translate('Captcha Failed'))->withInput($request->input());
            }
        } else {
            if (strtolower($request->default_captcha_value) != strtolower(Session('default_captcha_code'))) {
                Session::forget('default_captcha_code');
                return back()->withErrors(\App\CPU\translate('Captcha Failed'))->withInput($request->input());
            }
        }

        $request->validate([
            'mobile_number' => 'required',
            'subject' => 'required',
            'message' => 'required',
        ], [
            'mobile_number.required' => 'Mobile Number is Empty!',
            'subject.required' => ' Subject is Empty!',
            'message.required' => 'Message is Empty!',

        ]);
        $contact = new Contact;
        $contact->name = $request->name;
        $contact->email = $request->email;
        $contact->mobile_number = $request->mobile_number;
        $contact->subject = $request->subject;
        $contact->message = $request->message;
        $contact->save();
        Toastr::success(translate('Your Message Send Successfully'));
        return back();
    }

    public function captcha($tmp)
    {

        $phrase = new PhraseBuilder;
        $code = $phrase->build(4);
        $builder = new CaptchaBuilder($code, $phrase);
        $builder->setBackgroundColor(220, 210, 230);
        $builder->setMaxAngle(25);
        $builder->setMaxBehindLines(0);
        $builder->setMaxFrontLines(0);
        $builder->build($width = 100, $height = 40, $font = null);
        $phrase = $builder->getPhrase();

        if(Session::has('default_captcha_code')) {
            Session::forget('default_captcha_code');
        }
        Session::put('default_captcha_code', $phrase);
        header("Cache-Control: no-cache, must-revalidate");
        header("Content-Type:image/jpeg");
        $builder->output();
    }

    public function order_note(Request $request)
    {
        if ($request->has('order_note')) {
            session::put('order_note', $request->order_note);
        }
        return response()->json();
    }
    public function subscription(Request $request)
    {
        $subscription_email = Subscription::where('email',$request->subscription_email)->first();
        if(isset($subscription_email))
        {
            Toastr::info(translate('You already subcribed this site!!'));
            return back();
        }else{
            $new_subcription = new Subscription;
            $new_subcription->email = $request->subscription_email;
            $new_subcription->save();

            Toastr::success(translate('Your subscription successfully done!!'));
            return back();

        }
        
    }
    public function review_list_product(Request $request)
    {
        
        $productReviews =Review::where('product_id',$request->product_id)->latest()->paginate(2, ['*'], 'page', $request->offset);
        
        
        return response()->json([
            'productReview'=> view('web-views.partials.product-reviews',compact('productReviews'))->render(),
            'not_empty'=>$productReviews->count()
        ]);
    }


    public function category_view($id) {

        $Category = DB::table('categories')->find($id);
      
        $Product = DB::table('products')->where('category_ids', '=', $Category->id)->get();
        $Brands = DB::table('brands')->where('category_id','=', $Category->id)->get();
        $sub_cats = DB::table('subs_categories')->where('parent_id','=', $Category->id)->get();

        return view('web-views.category_view', compact('Category', 'Brands','Product', 'sub_cats'));
    }


    public function brand_products($id) {

        $Product = Product::where('brand_id', '=', $id)->get();
        return view('web-views.brand_view', compact('Product'));
        

    }

    public function product_view($id)
    {

        $product = Product::find($id);
        // dd($product->IsDiscount);
        $Brand = DB::table('brands')->where('id', '=', $product->brand_id)->first();
        $sub_sub_category = DB::table('sub_sub_categories')->where('id', '=', $product->sub_sub_category_id)->first();
        $shop_info = DB::table('shops')->where('seller_id', '=', $product->user_id)->first();
        $same_products = DB::table('products')->where('brand_id',$product->brand_id)->get();
        return view('web-views.products.details', compact('product', 'sub_sub_category','same_products', 'Brand', 'shop_info'));
    }

    public function product_view_details($id,$size_id)
    {

        $product = Product::find($id);
        $Brand = DB::table('brands')->where('id', '=', $product->brand_id)->first();
        $sub_sub_category = DB::table('sub_sub_categories')->where('id', '=', $product->sub_sub_category_id)->first();
        $shop_info = DB::table('shops')->where('seller_id', '=', $product->user_id)->first();
        $same_products = DB::table('products')->where('brand_id',$product->brand_id)->get();
        $other_size=$product->sizes->where('id',$size_id)->first();
        
        return view('web-views.products.other-size-details', compact('product', 'sub_sub_category','same_products', 'Brand', 'shop_info','size_id','other_size'));
    }




    public function product_filters_serach(Request $request) {

       $filter = $request->pro_filters;

       if($filter == 'latest') {

        $product = DB::table('products')->where('category_ids', '=', $request->category_ids)->get();

        return response()->json(['product' => $product]);


       } else if($filter == 'high-price') {

        $product = DB::table('products')->where('category_ids', '=', $request->category_ids)->orderBy('unit_price', 'asc')->get();

        return response()->json(['product' => $product]);

       } else if($filter == 'low-price') {

        $product = DB::table('products')->where('category_ids', '=', $request->category_ids)->orderBy('unit_price', 'desc')->get();
        return response()->json(['product' => $product]);

       }

    }


    public function add_to_cart(Request $request) {

        $validated = $request->validate([
            'product_id'    => 'required',
            'price'         => 'required',
            'quantity'      => 'required',
            'thumbnail'     => 'required',
            'seller_id'     => 'required',
            'shop_info'     => 'required'
        ]);

        
        $user = Helpers::get_customer();

        $total = $request->price * $request->quantity;

        

        Cart::create([

            'customer_id'           => $user->id,
            'product_id'            => $request->product_id,
            'product_type'          => $request->product_type,
            'quantity'              => $request->quantity,
            'price'                 => $request->price,
            'tax'                   => $request->tax,
            'discount'              => $request->discount,
            'slug'                  => $request->slug,
            'name'                  => $request->name,
            'thumbnail'             => $request->thumbnail,
            'seller_id'             => $request->seller_id,
            'created_at'            => date('Y-m-d'),
            'shop_info'             => $request->shop_info,
            'shipping_cost'         => $request->shipping_cost,
            'total'                 => $total,
            'brand_id'              => $request->brand_id,
            'category_id'           => $request->category_id,
            'unit'                  => $request->unit,
            'unit_numbers'          => $request->unit_numbers,
            'sub_category_id'       => $request->sub_category_id,
            'sub_sub_category_id'   => $request->sub_sub_category_id
        
        ]);
        
        return response()->json('Product Add successfully');
        
        
    }


    public function remove_cart_item(Request $request) {

        $item_id = $request->myId;

        $Cart = Cart::find($item_id)->delete();

        return response()->json('Product Deleted successfully');
        
    }


    public function check_copoun_code(Request $request) {

        $code = $request->code;
        $total = $request->total;
        $newDate = date("Y-m-d", strtotime(Carbon::now()));  
        $Coupon = Coupon::where('code', '=', $code)->first();

       
        
        if($Coupon) {

            $oldDate = date("Y-m-d", strtotime($Coupon->expire_date)); 

            if($oldDate > $newDate) {

                $user = Helpers::get_customer();

                $cart_total = Cart::where('customer_id', '=', $user->id)->sum('total');
                $cart_total_shipping_cost = Cart::where('customer_id', '=', $user->id)->sum('shipping_cost');

                $cart_minus_discount = Cart::where('customer_id', '=', $user->id)->get();

                // foreach($cart_minus_discount as $val) {


                // }

                $total_after_discount = ($cart_total + 	$cart_total_shipping_cost) - $Coupon->discount;

                return response()->json(['total_after_discount' => $total_after_discount]);

            } else {

                $user = Helpers::get_customer();

                $cart_total = Cart::where('customer_id', '=', $user->id)->sum('total');

                $total_after_discount = $cart_total;

                return response()->json(['total_after_discount' => 'كود الخصم غير صحيح']);

            }

        } else {

                $user = Helpers::get_customer();

                $cart_total = Cart::where('customer_id', '=', $user->id)->sum('total');

                $total_after_discount = $cart_total;

                return response()->json(['total_after_discount' => 'كود الخصم غير صحيح']);

        }
        
      
        // $Coupon = Coupon::where()

    }


    public function sub_category_search(Request $request) {

        $myId = $request->myId; 

        $Product =  DB::table('Products')->where('sub_category_id', '=', $myId)->get();

        $Category = DB::table('subs_categories')->where('id', '=', $myId)->first();

        $sub_cats = DB::table('subs_categories')->where('id','=', $myId)->get();
    
        return view('web-views.category_filter', compact('Product', 'Category', 'sub_cats'));


        
    }


    public function check_banner_code(Request $request) {

        
        $get_banner = DB::table('banners')->where('id', '=', $request->myId)->first();

        $get_cart_total = DB::table('carts')->where('customer_id', '=', auth('customer')->id())->sum('total');


        if($get_banner->min_purchasing > $get_cart_total) {

            return response()->json(['lower_purchasing' => 'لم تصل لمبلغ الشراء المطلوب لتفعيل الكود']);

        } else {

           
            $get_date = date("Y/m/d");

            $expire_date = date("Y/m/d", strtotime($get_banner->expire));

            if($expire_date > $get_date) {

                $get_cart_total = DB::table('carts')->where('customer_id', '=', auth('customer')->id())->update([

                    'discount' => $request->discount,
                ]);

                return response()->json(['valid' => 'تم تفعيل الكود بنجاح']);
                

            } else {

                return response()->json(['expire' => 'الكوبون منتهي الصلاحية']);

            }


        }

       
    }


    public function customer_wishlist() {

        $users = Helpers::get_customer();
        $wishlist = Wishlist::where('customer_id', '=', $users->id)->get();
        return view('web-views.users-profile.account-wishlist',compact('wishlist'));
    }

    public function customer_wishlists_store(Request $request) {


        $validated = $request->validate([
            'product_id' => 'required|unique:wishlists|max:255',
          
        ]);

        $users = Helpers::get_customer();

        Wishlist::create([

            'customer_id' => $users->id,
            'product_id' => $request->product_id
            
        ]);

     
        $Wishlist = Wishlist::where('customer_id', '=', $users->id)->count('id');
        
        return response()->json($Wishlist);
       
    }


    public function customers_wishlists_delete(Request $request) {

        $users = Helpers::get_customer();
        $wishlist_id = $request->wishlist_id;
        $del = DB::table('wishlists')->where('id', '=', $wishlist_id)->delete();

        $Wishlist = Wishlist::where('customer_id', '=', $users->id)->count('id');
        
        return response()->json($Wishlist);

    }


    public function hot_sales_pro() {

        $ip = getenv('REMOTE_ADDR'); // your ip address here
        $query = @unserialize(file_get_contents('http://ip-api.com/php/'.$ip));
        if($query && $query['status'] == 'success')
        {
            // echo 'Your City is ' . $query['city'];

            $get_order = DB::table('order_details')->get();

            foreach($get_order as $val) {

                $seller = DB::table('sellers')->where('id', '=', $val->seller_id)->first();

                $get_city = DB::table('cities')->where('id', '=', json_decode($seller->city_id))->first();

                if(isset($get_city)) {

                    $orders = DB::table('order_details')->where('seller_id', '=', $seller->id)->get();

                } else {

                    $orders = [];

                }



            }

             

        return view('web-views.hot_sales', compact('orders'));

          
        }

     
    }


    
    public function my_last_orders() {

        $user = Helpers::get_customer();
        $orders = Order::where('customer_id', '=', $user->id)->get();
        return view('web-views.last_orders', compact('orders'));

        // return $user->id;
    }


    public function customer_wallet() {

        $user = Helpers::get_customer();
        $wallet = CustomerWallet::where('customer_id', '=', $user->id)->first();
        $get_user = User::where('id', '=', $user->id)->first();

        $get_banner = DB::table('banners')->latest()->paginate(6);

        $terms_condition = BusinessSetting::where('type', 'terms_condition')->first();

        $privacy_police = BusinessSetting::where('type', 'privacy_policy')->first();
        
        $get_orders = Order::where([
            
            ['customer_id', '=', $user->id],
            ['order_status', '=', 'canceled']
            ])->orWhere([
                ['customer_id', '=', $user->id],
            ['order_status', '=', 'delivered']
            ])->get();

            $CustomerLocations = CustomerLocations::where('user_id', '=', $user->id)->get();


        return view('web-views.customer_wallet',compact('wallet', 'get_user', 'get_orders', 'get_banner', 'terms_condition', 'privacy_police', 'CustomerLocations'));

       
    }


    public function customer_transactions_details($id) {

        $get_orders = Order::find($id);
        $get_details = OrderDetail::where('order_id', '=', $get_orders->id)->get();
        $get_shipping_address = ShippingAddress::where('id', '=', $get_orders->shipping_address)->first();
        $user = Helpers::get_customer();
        $get_customer =  User::where('id', '=', $user->id)->first();
        return view('web-views.customer_transactions', compact('get_orders', 'get_details', 'get_shipping_address', 'get_customer'));
    }

    
    public function customer_account_update(Request $request) {

        $request->validate([
            'name'  => 'required',
            'email' => 'required',
            'whats' => 'required',
        ]);


        $myId = $request->myId;

        $check = User::where('id', '=', $myId)->update([

            'name'      => $request->name,
            'email'     => $request->email,
            'whats'     => $request->whats,
            'position'  => $request->position

        ]);

        Toastr::success(\App\CPU\translate('account_update'));
        return redirect()->back();

    }



    public function customer_building_update(Request $request) {


        $request->validate([
            'building_name'     => 'required',
            'building_email'    => 'required',
            'tax_no'            => 'required',
            'commercial_no'     => 'required'
        ]);


        $myId = $request->myId;

        $check = User::where('id', '=', $myId)->update([

            'building_name'         => $request->building_name,
            'building_email'        => $request->building_email,
            'building_type'         => $request->building_type,
            'building_size'         => $request->building_size,
            'month_purchasing'      => $request->month_purchasing,
            'tax_no'                => $request->tax_no,
            'commercial_no'         => $request->commercial_no

        ]);

        Toastr::success(\App\CPU\translate('account_update'));
        return redirect()->back();

    }


    public function customer_add_new_location() {

        return view('web-views.customer_add_location');
        
    }


    public function customer_location_details_store(Request $request) {

        $request->validate([
            'address_details'       => 'required',
            'country'               => 'required',
            'city'                  => 'required',
            'address_latitude'      => 'required',
            'address_longitude'     => 'required'
        ]);


        $user = Helpers::get_customer();

        $check = DB::table('customer_locations')->where('user_id', '=', $user->id)->insert([

            'user_id'               => $user->id,
            'address_details'       => $request->address_details,
            'country'               => $request->country,
            'city'                  => $request->city,
            'address_latitude'      => $request->address_latitude,
            'address_longitude'     => $request->address_longitude,
            'created_at'            => Carbon::now(),

        ]);

        Toastr::success(\App\CPU\translate('account_update'));
        return redirect()->route('customer.location.details');


    }



    public function customer_location_details() {

        $user = Helpers::get_customer();
        $wallet = CustomerWallet::where('customer_id', '=', $user->id)->first();
        $get_user = User::where('id', '=', $user->id)->first();

        $get_banner = DB::table('banners')->latest()->paginate(6);

        $terms_condition = BusinessSetting::where('type', 'terms_condition')->first();

        $privacy_police = BusinessSetting::where('type', 'privacy_policy')->first();
        
        $get_orders = Order::where([
            
            ['customer_id', '=', $user->id],
            ['order_status', '=', 'canceled']
            ])->orWhere([
                ['customer_id', '=', $user->id],
            ['order_status', '=', 'delivered']
            ])->get();

        $CustomerLocations = CustomerLocations::where('user_id', '=', $user->id)->get();
        $location_check = CustomerLocations::where([
            ['user_id', '=', $user->id],
            ['building_type', '=', ''],
            ['building_no', '=', '']
            ])->first();
        return view('web-views.customer_location_details',compact('location_check','wallet', 'get_user', 'get_orders', 'get_banner', 'terms_condition', 'privacy_police', 'CustomerLocations'));
    }



    public function customer_location_updated(Request $request) {

        $request->validate([
            'building_type'       => 'required',
            'building_no'         => 'required',
            'building_floor'      => 'required',
            'address_details'     => 'required',
            'delivery_phone'      => 'required',
            'building_image'      => 'required',
            'delivery_image'      => 'required'
        ]);

        $myId = $request->myId;

        if($request->building_image) {

            $building_image = time().'.'.$request->building_image->extension();  
         
            $request->building_image->move(public_path('users'), $building_image);

        }

        if($request->delivery_image) {

            $delivery_image = time().'.'.$request->delivery_image->extension();  
         
            $request->delivery_image->move(public_path('users'), $delivery_image);

        }



        $CustomerLocations = CustomerLocations::where('id', '=', $myId)->update([

            'name'              => $request->name,
            'building_type'     => $request->building_type,
            'building_no'       => $request->building_no,
            'building_floor'    => $request->building_floor,
            'address_details'   => $request->address_details,
            'delivery_phone'    => $request->delivery_phone,
            'building_image'    => $building_image,
            'delivery_image'    => $delivery_image

        ]);

        return redirect()->back();

    }

    public function sub_category_view($id) {

        $sub_sub_category = sub_sub_category::find($id);
        $Product = Product::where('sub_sub_category_id', '=', $sub_sub_category->id)->get();
        return view('web-views.sub_category_view', compact('sub_sub_category', 'Product'));

    }


    public function product_by_category($id) {

        $Category = Category::find($id);

        $Product = Product::where('category_ids', '=', $Category->id)->get();

        return view('web-views.product_by_category', compact('Category','Product'));

    }

    public function customer_locations() {

        $user = Helpers::get_customer();
        $CustomerLocations = CustomerLocations::where('user_id', '=', $user->id)->get();
        return view('customer-view.auth.locations', compact('CustomerLocations', 'user'));
    }



    public function customer_locations_delete($id) {

        CustomerLocations::find($id)->delete();
        return redirect()->back();
    }


    public function customer_select_location() {

        $user = Helpers::get_customer();
        $CustomerLocations = CustomerLocations::where('user_id', '=', $user->id)->get();
        return view('customer-view.select_location', compact('CustomerLocations', 'user'));

    }


    public function customer_verfication_account() {

        return view('web-views.verfication_account');
        
    }


    public function customers_messages_store(Request $request) {

        $request->validate([

            'message'  => 'required',
    
        ]);

        $user = Helpers::get_customer();

        $message = strip_tags($request->message);

        Customers_Chat::insert([

            'user_id'           => $user->id,
            'sent_by'           => 'customer',
            'message'           => $message,
            'created_at'        => Carbon::now()

        ]);

        

    }
    
}
