<?php

namespace App\Http\Controllers\Seller;

use App\CPU\BackEndHelper;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\ShippingMethod;
use App\Model\BusinessSetting;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\Category;
use App\Model\CategoryShippingCost;
use App\Model\ShippingType;
use App\Model\DeliveryMan;
use App\Model\City;

class ShippingMethodController extends Controller
{
    public function index()
    {
      
        $seller_id = auth('seller')->id();
        $dalivery = DeliveryMan::where('seller_id', '=', $seller_id)->get();

        
        return view('seller-views.shipping-method.add-new', compact('dalivery'));

    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|max:200',
            'duration' => 'required',
            'cost' => 'numeric'
        ]);

        DB::table('shipping_methods')->insert([
            'creator_id' => auth('seller')->id(),
            'creator_type' => 'seller',
            'title' => $request['title'],
            'duration' => $request['duration'],
            'cost' => BackEndHelper::currency_to_usd($request['cost']),
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        Toastr::success('Successfully added.');
        return back();
    }

    public function status_update(Request $request)
    {
        ShippingMethod::where(['id' => $request['id']])->update([
            'status' => $request['status']
        ]);
        return response()->json([
            'success' => 1,
        ], 200);
    }

    public function edit($id)
    {
        $shippingMethod = Helpers::get_business_settings('shipping_method');

        if($shippingMethod=='sellerwise_shipping')
        {
            $method = ShippingMethod::where(['id' => $id])->first();
            return view('seller-views.shipping-method.edit', compact('method'));
        }else{
            return redirect('/seller/dashboard');
        }
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|max:200',
            'duration' => 'required',
            'cost' => 'numeric'
        ]);

        DB::table('shipping_methods')->where(['id' => $id])->update([
            'creator_id' => auth('seller')->id(),
            'creator_type' => 'seller',
            'title' => $request['title'],
            'duration' => $request['duration'],
            'cost' => BackEndHelper::currency_to_usd($request['cost']),
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        Toastr::success('Successfully updated.');
        return redirect()->route('seller.business-settings.shipping-method.add');
    }

    public function delete(Request $request)
    {
        $shipping = ShippingMethod::find($request->id);

        $shipping->delete();
        return response()->json();
    }

    public function profile()
    {
        return view('seller-views.shipping-method.profile');
    }
}
