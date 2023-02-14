<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Branche;
use Illuminate\Support\Facades\Response;
use DB;
use App\Model\Product;

class hotOffersController extends Controller
{
    
    public function index() {


        $ip = getenv('REMOTE_ADDR'); // your ip address here
        $query = @unserialize(file_get_contents('http://ip-api.com/php/'.$ip));
        if($query && $query['status'] == 'success')
        {
            // echo 'Your City is ' . $query['city'];

            $get_product = DB::table('products')->get();

            foreach($get_product as $val) {

                $seller = DB::table('sellers')->where('id', '=', $val->user_id)->first();

                $get_city = DB::table('cities')->where('id', '=', json_decode($seller->city_id))->first();

                if(isset($get_city)) {

                    $orders = DB::table('products')->where('user_id', '=', $seller->id)->get();

                } else {

                    $orders = [];

                }



            }

             

        return view('web-views.hot_offers.index', compact('orders'));

          
        }
        
            
    }


    public function hot_offers_get() {

        $data = Category::all();

        return response()->json([

            'data' => $data
        ]);

    }
}
