<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Order;
use App\Model\DeliveryMan;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Brian2694\Toastr\Facades\Toastr;

class DeliveryController extends Controller
{
    
    public function add_new() {

        return view('seller-views.shipping-method.add_delivery');
        
    }


    public function seller_store_delivery(Request $request) {

        $request->validate([
            
            'f_name'        => 'required',
            // 'l_name'        => 'required',
            'phone'         => 'required',
            'zone_id'       => 'required',
            // 'password'      => 'required',
            
        ]);

       


        DeliveryMan::insert([
            
            'f_name'        => $request->f_name,
            // 'l_name'        => $request->l_name,
            // 'password'      => Hash::make($request->password),
            'phone'         => $request->phone,
            'zone_id'       => json_encode($request->zone_id),
            'seller_id'     => auth('seller')->id(),
            'created_at'    => Carbon::now()
        
        ]);

        Toastr::success('تم اضافة الموصل بنجاح');
        
        return redirect()->back();


    }


    public function seller_order_accept(Request $request) {

        // return 'good';
        $myId = $request->myId; 
        $delivery_man = $request->deliveryId;

       $Order =  Order::find($myId)->update([

        'order_status' => 'confirmed',
        'delivery_man_id'  => $delivery_man,

       ]);


       return response()->json('Order Confirmed successfully');

    // dd($delivery_man);
      
    }
}
