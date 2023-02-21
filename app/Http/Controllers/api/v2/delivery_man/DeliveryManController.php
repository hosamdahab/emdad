<?php

namespace App\Http\Controllers\api\v2\delivery_man;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\DeliveryHistory;
use App\Model\DeliveryMan;
use App\Model\Order;
use App\Model\OrderDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use function App\CPU\translate;
use App\CPU\OrderManager;
use App\Model\Product;
use Auth;
use Carbon\Carbon;
use App\DeliveryProductCommission;
use App\DeliveryMenWallet;

class DeliveryManController extends Controller
{
    public function info(Request $request)
    {
        return response()->json($request['delivery_man'], 200);
    }



    public function get_last_orders(Request $request) {

        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DeliveryMan::where('auth_token', '=', $result)->first();

        $orders = Order::with(['shippingAddress', 'customer'])->whereIn('order_status', ['pending', 'processing', 'out_for_delivery'])
            ->where(['delivery_man_id' => $check->id])->latest()->get();

          
            if(isset($orders)) {


                foreach($orders as $order) {



                    $pro = OrderDetail::where('order_id', '=', $order->id)->get();

                    foreach($pro as $product) {

                        $pro_branch = Product::where('id', '=', $product->product_id)->get();

                        foreach($pro_branch as $branch) {

                            $branch =  DB::table('branche')->where('id', '=', $branch->branche_id)->get();

                                    if(isset($branch)) {

                                        foreach($branch as $bran) {

                                            if($bran->default_delivery != null) {

                                                $order['default_delivery'] = $bran->default_delivery;

                                            } else {

                                                $order['default_delivery'] = false;

                                            }
                                            
                                           
                                           
                                        }

                                    }
                                  
                                

                        }

                    }




                }

                  

            } else {

                $orders = [];
               

            }

               
            return response()->json($orders, 200);

      
        
    }



    public function get_last_orders_status(Request $request) {

        
        $order_delivery_status = $request->order_status;
        $myId = $request->id;
        
        if($order_delivery_status == true) {

         $data =  Order::where('id', '=', $myId)->update([

                'order_status' => 'confirmed'

            ]);

            OrderDetail::where('order_id', '=', $myId)->update([

                'delivery_status' => 'confirmed'
            ]);

        } else {

            $data = Order::where('id', '=', $myId)->update([

                'order_status' => 'canceled'

            ]);

            OrderDetail::where('order_id', '=', $myId)->update([

                'delivery_status' => 'canceled'
            ]);

        }
      
        
        return response()->json($data, 200);

    }


    public function get_current_orders(Request $request)
    {
        
        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DeliveryMan::where('auth_token', '=', $result)->first();
           
        
         if(isset($check)) {

            $orders = Order::with(['shippingAddress', 'customer'])->whereIn('order_status', ['confirmed'])
            ->where(['delivery_man_id' => $check->id])->get();


         } else {

            $orders = "لا يوجد طلبات حاليا";
         }
          

      
        return response()->json($orders, 200);

      
        
    }



    public function get_order_delivered(Request $request) {


        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        $token = $request->header('authorization');
        $result = substr($token,7);
       
        $order_id = $request->id;
        $order_status = $request->order_status;

       

        $get_order = Order::where('id', '=', $order_id)->first();

        $check = DeliveryMan::where('auth_token', '=', $result)->first();
           
        
         if(isset($check)) {

            if($order_status == 'delivered') {

                $result = Order::where('id','=', $order_id)->update([

                    'order_status'      => 'delivered',
                    'payment_status'    => 'paid'

                ]);


                OrderDetail::where('order_id', '=', $order_id)->update([

                    'delivery_status'   => 'delivered',
                    'payment_status'    => 'paid'
                   
                ]);


            } elseif($order_status == 'canceled') {

                $result = Order::where('id','=', $order_id)->update([

                    'order_status' => 'canceled',

                ]);



                OrderDetail::where('order_id', '=', $order_id)->update([

                    'delivery_status' => 'canceled'

                ]);


            } elseif($order_status == 'delayed') {


                if(isset($request->payment_date)) {

                    $result = Order::where('id','=', $order_id)->update([

                        'order_status'      => 'delivered',
                        'payment_status'    => 'delayed',
                        'payment_date'      => $request->payment_date
    
                    ]);
    
                  
    
                    OrderDetail::where('order_id', '=', $order_id)->update([
    
                        'delivery_status'   => 'delivered',
                        'payment_status'    => 'delayed',
                        'payment_date'      => $request->payment_date
                        
                    ]);

                } else {

                    $result = Order::where('id','=', $order_id)->update([

                        'order_status'      => 'delivered',
                        'payment_status'    => 'delayed',
    
                    ]);
    
                  
    
                    OrderDetail::where('order_id', '=', $order_id)->update([
    
                        'delivery_status'   => 'delivered',
                        'payment_status'    => 'delayed',
                        
                    ]);

                }
                

            } else {

                $resule = 'يوجد خطا ما';
            }
           

         } else {


            $result = 'You Are Not Authorized';


         }


         return response()->json($result, 200);

    }


    public function wallet(Request $request) {

        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DeliveryMan::where('auth_token', '=', $result)->first();

        $orders = Order::whereIn('order_status', ['delivered'])
            ->where('delivery_man_id', '=', $check->id)->where('payment_status', '=', 'unpaid')->sum('order_amount');
            
          $last_paid = Order::where('delivery_man_id', '=', $check->id)->where('payment_status', '=', 'paid')->orderBy('payment_at', 'desc')->first();
          
          $last_paid_date = date('Y-m-d', strtotime($last_paid->payment_at));

            $total_orders = number_format($orders,2);

            $total_amount['total_amount'] = $total_orders;
            
            $total_amount['last_payment'] = $last_paid_date;
            $wallet=DeliveryMenWallet::where('delivery_man_id',$check->id)->first();
            $total_amount['wallet_current_balance'] = $wallet? $wallet->total_earning : 0;
            
            

        return response()->json($total_amount, 200);

    }
  

    public function record_location_data(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
            'location' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $d_man = $request['delivery_man'];
        DB::table('delivery_histories')->insert([
            'order_id' => $request['order_id'],
            'deliveryman_id' => $d_man['id'],
            'longitude' => $request['longitude'],
            'latitude' => $request['latitude'],
            'time' => now(),
            'location' => $request['location'],
            'created_at' => now(),
            'updated_at' => now()
        ]);
        return response()->json(['message' => 'location recorded'], 200);
    }



    public function order_history(Request $request) {

        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DeliveryMan::where('auth_token', '=', $result)->first();

        $orders_done = Order::whereIn('order_status', ['delivered'])->whereIn('payment_status', ['paid', 'unpaid'])
            ->where('delivery_man_id', '=', $check->id)->get();

            $orders_cancel = Order::whereIn('order_status', ['canceled'])->whereIn('payment_status', ['paid', 'unpaid'])
            ->where('delivery_man_id', '=', $check->id)->get();

        return response()->json(['order_done' => $orders_done, 'order_cancel' => $orders_cancel], 200);

    }


    public function get_order_history(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        $history = OrderDetail::where(['order_id' => $request['order_id']])->get();
        return response()->json($history, 200);

    }


    public function update_order_status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'status' => 'required|in:delivered,canceled,returned,out_for_delivery'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $d_man = $request['delivery_man'];

        Order::where(['id' => $request['order_id'], 'delivery_man_id' => $d_man['id']])->update([
            'order_status' => $request['status']
        ]);

        $order = Order::where(['delivery_man_id' => $d_man['id'], 'id' => $request['order_id']])->first();
        
        try {
            $fcm_token = $order->customer->cm_firebase_token;
            if ($request['status'] == 'out_for_delivery') {
                $value = Helpers::order_status_update_message('ord_start');
            } elseif ($request['status'] == 'delivered') {
                $value = Helpers::order_status_update_message('delivered');

                if(isset($order->details)){
                    foreach($order->details as $details){
                        $product=Product::find($details->product_id);
                        if($product->commissions_min_delivery && $product->commissions_end_date >= Carbon::today() ){
                            $row=DeliveryProductCommission::create([
                                'product_id'=>$product->id,
                                'qty'=>$details->qty,
                                'delivery_man_id'=>$d_man['id'],
                                'date'=>Carbon::today(),
                            ]);

                            $check=DeliveryProductCommission::where('product_id',$product->id)->where('delivery_man_id',$d_man['id'])
                            ->where('date','<=',$product->commissions_end_date)
                            ->where('date','>=',$product->commissions_start_date)
                            ->sum('qty');

                            if($check>=$product->commissions_min_delivery){
                                $total_price=$product->commissions_min_delivery*$product->unit_price;
                                $commissions_delivery_percent=$product->commissions_delivery_percent;
                                $commissions_price=round(($commissions_delivery_percent/$total_price)*100,1);
                                
                                $check_wallet=DeliveryMenWallet::where('delivery_man_id',$d_man['id'])->first();

                                if($check_wallet){
                                    $current_total_earning=$check_wallet->total_earning;
                                    $check_wallet->update(['total_earning'=>$check_wallet->total_earning +$commissions_price]);
                                }else{
                                    DeliveryMenWallet::create(['delivery_man_id'=>$d_man['id'],'total_earning'=>$commissions_price]);
                                }

                            }
                        }
                    }
                }
            }
            
            if ($value) {
                $data = [
                    'title' => translate('order'),
                    'description' => $value,
                    'order_id' => $order['id'],
                    'image' => '',
                ];
                Helpers::send_push_notif_to_device($fcm_token, $data);
            }
        } catch (\Exception $e) {
        }

        OrderManager::stock_update_on_order_status_change($order, $request['status']);

        if ($request['status'] == 'delivered' && $order['seller_id'] != null) {
            OrderManager::wallet_manage_on_order_status_change($order, 'delivery man');
            OrderDetail::where('order_id', $order->id)->update(
                ['delivery_status'=>'delivered']
            );
        }

        if ($order->order_status == 'delivered') {
            return response()->json(['success' => 0, 'message' => 'order is already delivered.'], 200);
        }

        return response()->json(['message' => 'Status updated'], 200);
    }

    public function get_order_details(Request $request)
    {
        $d_man = $request['delivery_man'];
        $order = Order::with(['details'])->where(['delivery_man_id' => $d_man['id'], 'id' => $request['order_id']])->first();
        $details = $order->details;
        foreach ($details as $det) {
            $det['variation'] = json_decode($det['variation']);
            $det['product_details'] = Helpers::product_data_formatting(json_decode($det['product_details'], true));
        }
        return response()->json($details, 200);
    }


    public function get_all_orders(Request $request)
    {

        $token = $request->header('authorization');
        $result = substr($token,7);
        $d_man = DeliveryMan::where('auth_token', '=', $result)->first();

        $orders = Order::with(['shippingAddress', 'customer'])->whereIn('order_status', ['delivered', 'canceled','pending', 'processing', 'out_for_delivery', 'confirmed'])
        ->where(['delivery_man_id' => $d_man->id])->get();

        foreach($orders as $order) {

            if($order->payment_status == 'delayed') {

                if($order->payment_date == null) {

                    $get_date = $order->created_at->addDays(6);
                    $myDate = date('Y-m-d', strtotime($get_date)); 
    
                    $order['payment_date'] = $myDate;

                } else {


                    $order = $order;
                }

               
                
            } else {

                $order['payment_date'] = '';
            }
            
            
        }

        return response()->json($orders, 200);

    }

    public function get_last_location(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $last_data = DeliveryHistory::where(['order_id' => $request['order_id']])->latest()->first();
        return response()->json($last_data, 200);
    }

    // public function order_payment_status_update(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'order_id'=>'required',
    //         'payment_status' => 'in:paid,unpaid'
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['errors' => Helpers::error_processor($validator)], 403);
    //     }

    //     $d_man = $request['delivery_man'];
    //     if (Order::where(['delivery_man_id' => $d_man['id'], 'id' => $request['order_id']])->first()) {
    //         Order::where(['delivery_man_id' => $d_man['id'], 'id' => $request['order_id']])->update([
    //             'payment_status' => $request['payment_status']
    //         ]);
    //         return response()->json(['message' => translate('Payment status updated')], 200);
    //     }
    //     return response()->json([
    //         'errors' => [
    //             ['code' => 'order', 'message' => translate('not found!')]
    //         ]
    //     ], 404);
    // }

    public function update_fcm_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fcm_token'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $d_man = $request['delivery_man'];
        DeliveryMan::where(['id' => $d_man['id']])->update([
            'fcm_token' => $request['fcm_token']
        ]);

        return response()->json(['message' => 'successfully updated!'], 200);
    }
}
