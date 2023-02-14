<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use App\Model\WithdrawRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\AdminCommissions;
use App\Model\Banner;

class SystemController extends Controller
{
    public function order_data()
    {
        $sellerId = auth('seller')->id();

        $new_order = DB::table('orders')->where(['seller_is' => 'seller'])
                                        ->where(['seller_id' => $sellerId])
                                        ->where(['checked' => 0])->count();
        return response()->json([
            'success' => 1,
            'data' => ['new_order' => $new_order]
        ]);
    }


    public function seller_get_site_commissions(Request $request) {

        $price = $request->price;

        $get_commission = AdminCommissions::find(1);

        $calc = $price * $get_commission->percent / 100;

        $commission = $price - $calc;


        return response()->json(['commission' => $commission]);
    }



    public function seller_notifications_index() {

        $Banner = Banner::all();
        return view('seller-views.system.notifications', compact('Banner'));

    }

}
