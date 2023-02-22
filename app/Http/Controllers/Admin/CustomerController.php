<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\OrderDetail;
use App\Model\Seller;
use App\Model\City;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\Subscription;
use App\Model\CustomerLocations;



class CustomerController extends Controller
{
    public function customer_list(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search')) {
            $key = explode(' ', $request['search']);
            $customers = User::with(['orders'])
                ->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('f_name', 'like', "%{$value}%")
                            ->orWhere('l_name', 'like', "%{$value}%")
                            ->orWhere('phone', 'like', "%{$value}%")
                            ->orWhere('email', 'like', "%{$value}%");
                    }
                });
            $query_param = ['search' => $request['search']];
        } else {
            $customers = User::with(['orders'])->orderBy('created_at','desc');
        }
        $customers = $customers->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.customer.list', compact('customers', 'search'));
    }

    public function status_update(Request $request)
    {
        User::where(['id' => $request['id']])->update([
            'is_active' => $request['status']
        ]);

        DB::table('oauth_access_tokens')
            ->where('user_id', $request['id'])
            ->delete();

        return response()->json([], 200);
    }
    
    public function isdoc_update(Request $request)
    {
       
       if($request['status'] == 1){
            User::where(['id' => $request['id']])->update([
                'isDoc' => $request['status'],
                'isDocReq' => 1
            ]);
       } else {
           User::where(['id' => $request['id']])->update([
                'isDoc' => $request['status'],
                'isDocReq' => 0
            ]);
       }
        return response()->json([], 200);
    }


    public function view(Request $request, $id)
    {

        $customer = User::find($id);
        if (isset($customer)) {
            $query_param = [];
            $search = $request['search'];
            $orders = Order::where(['customer_id' => $id]);
            if ($request->has('search')) {

                $orders = $orders->where('id', 'like', "%{$search}%");
                $query_param = ['search' => $request['search']];
            }
            $orders = $orders->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
            return view('admin-views.customer.customer-view', compact('customer', 'orders', 'search'));
        }
        Toastr::error('Customer not found!');
        return back();
    }
    public function delete($id)
    {
        $customer = User::find($id);
        $customer->delete();
        Toastr::success('Customer deleted successfully!');
        return back();
    }

    public function subscriber_list(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search')) {
            $subscription_list = Subscription::where('email','like', "%{$search}%");
            
            $query_param = ['search' => $request['search']];
        } else {
        $subscription_list = new Subscription;
        }
        $subscription_list = $subscription_list->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.customer.subscriber-list',compact('subscription_list','search'));
    }


    public function admin_customer_fetch(Request $request) {

        $check = $request->categories;

        $categories = User::where('building_type', '=', $check)->get();
        // dd($categories);
        if(count($categories) > 0) {

            foreach($categories as $user) {

                $orders_check = Order::where('customer_id', '=', $user->id)->get(); 

                if(count($orders_check) > 0) {

                    $order = Order::where('customer_id', '=', $user->id)->sum('order_amount'); 

                } else{

                    $order = 0;
                }

            }

            
        }else{
            $order = 0;
        }
       

        return response()->json(['categories' => $categories, 'order' => $order]);
    }
}
