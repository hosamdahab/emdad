<?php

namespace App\Http\Controllers\api\v1;

use App\CPU\CustomerManager;
use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\OrderDetail;
use App\Model\ShippingAddress;
use App\Model\SupportTicket;
use App\Model\SupportTicketConv;
use App\Model\Wishlist;
use App\Model\CustomerWallet;
use App\Model\CustomerWalletHistory;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use function App\CPU\translate;

class CustomerController extends Controller
{
    public function info(Request $request)
    {
        return response()->json($request->user(), 200);
    }

    public function create_support_ticket(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject' => 'required',
            'type' => 'required',
            'description' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $request['customer_id'] = $request->user()->id;
        $request['priority'] = 'low';
        $request['status'] = 'pending';

        try {
            CustomerManager::create_support_ticket($request);
        } catch (\Exception $e) {
            return response()->json([
                'errors' => [
                    'code' => 'failed',
                    'message' => 'Something went wrong',
                ],
            ], 422);
        }
        return response()->json(['message' => 'Support ticket created successfully.'], 200);
    }

    public function reply_support_ticket(Request $request, $ticket_id)
    {
        $support = new SupportTicketConv();
        $support->support_ticket_id = $ticket_id;
        $support->admin_id = 1;
        $support->customer_message = $request['message'];
        $support->save();
        return response()->json(['message' => 'Support ticket reply sent.'], 200);
    }

    public function get_support_tickets(Request $request)
    {
        return response()->json(SupportTicket::where('customer_id', $request->user()->id)->get(), 200);
    }

    public function get_support_ticket_conv($ticket_id)
    {
        return response()->json(SupportTicketConv::where('support_ticket_id', $ticket_id)->get(), 200);
    }

    public function add_to_wishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $wishlist = Wishlist::where('customer_id', $request->user()->id)->where('product_id', $request->product_id)->first();

        if (empty($wishlist)) {
            $wishlist = new Wishlist;
            $wishlist->customer_id = $request->user()->id;
            $wishlist->product_id = $request->product_id;
            $wishlist->save();
            return response()->json(['message' => translate('successfully added!')], 200);
        }

        return response()->json(['message' => translate('Already in your wishlist')], 409);
    }

    public function remove_from_wishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $wishlist = Wishlist::where('customer_id', $request->user()->id)->where('product_id', $request->product_id)->first();

        if (!empty($wishlist)) {
            Wishlist::where(['customer_id' => $request->user()->id, 'product_id' => $request->product_id])->delete();
            return response()->json(['message' => translate('successfully removed!')], 200);

        }
        return response()->json(['message' => translate('No such data found!')], 404);
    }

    public function wish_list(Request $request)
    {
        return response()->json(Wishlist::whereHas('product')->with(['product'])->where('customer_id', $request->user()->id)->get(), 200);
    }

    public function address_list(Request $request)
    {
        return response()->json(ShippingAddress::where('customer_id', $request->user()->id)->get(), 200);
    }

    public function add_new_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address_type' => 'required',
            'address' => 'required',
            'city' => 'required',
            'zip' => 'required',
            'phone' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'is_billing' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $address = [
            'customer_id' => $request->user()->id,
            'contact_person_name' => $request->contact_person_name,
            'address_type' => $request->address_type,
            'address' => $request->address,
            'city' => $request->city,
            'zip' => $request->zip,
            'phone' => $request->phone,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'is_billing' => $request->is_billing,
            'created_at' => now(),
            'updated_at' => now(),
        ];
        DB::table('shipping_addresses')->insert($address);
        return response()->json(['message' => translate('successfully added!')], 200);
    }

    public function delete_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        if (DB::table('shipping_addresses')->where(['id' => $request['address_id'], 'customer_id' => $request->user()->id])->first()) {
            DB::table('shipping_addresses')->where(['id' => $request['address_id'], 'customer_id' => $request->user()->id])->delete();
            return response()->json(['message' => 'successfully removed!'], 200);
        }
        return response()->json(['message' => translate('No such data found!')], 404);
    }

    public function get_order_list(Request $request)
    {
        $token = $request->header('authorization');
        $result = substr($token,7);

        $check = DB::table('users')->where('temporary_token', '=', $result)->first();
        if(isset($check)) {


            $orders = Order::with('delivery_man')->where(['customer_id' => $check->id])->get();
            $orders->map(function ($data) {
                $data['shipping_address_data'] = json_decode($data['shipping_address_data']);
                $data['billing_address_data'] = json_decode($data['billing_address_data']);
                return $orders;
            });

        } else {

            return response()->json($check, 200);

        }
       
      
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $details = OrderDetail::where(['order_id' => $request['order_id']])->get();
        $details->map(function ($query) {
            $query['variation'] = json_decode($query['variation'], true);
            $query['product_details'] = Helpers::product_data_formatting(json_decode($query['product_details'], true));
            return $query;
        });
        return response()->json($details, 200);
    }
    
    public function update_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'phone' => 'required',
        ], [
            'f_name.required' => translate('First name is required!'),
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        
        if ($request->has('l_name')) {
            $lname = $request['l_name'];
        } else {
            $lname = $request->user()->l_name;
        }

        if ($request->has('image')) {
            $imageName = ImageManager::update('profile/', $request->user()->image, 'png', $request->file('image'));
        } else {
            $imageName = $request->user()->image;
        }
        
        if ($request->has('imageDoc1')) {
            $imageName = ImageManager::update('profile/', $request->user()->imageDoc1, 'png', $request->file('imageDoc1'));
        } else {
            $imageName = $request->user()->imageDoc1;
        }
        
        if ($request->has('imageDoc2')) {
            $imageName = ImageManager::update('profile/', $request->user()->imageDoc2, 'png', $request->file('imageDoc2'));
        } else {
            $imageName = $request->user()->imageDoc2;
        }

        if ($request['password'] != null && strlen($request['password']) > 5) {
            $pass = bcrypt($request['password']);
        } else {
            $pass = $request->user()->password;
        }

        if ($request['isComplete'] == 1) {
            $isComplete = 1;
        } else {
            $isComplete = $request->user()->isComplete;
        }
        
        if ($request->has('treadType')) {
            $treadTypes = $request['treadType'];
        } else {
            $treadTypes = $request->user()->treadType;
        }
        
        if ($request->has('categorySelected')) {
            $categorySelecteds = $request['categorySelected'];
        } else {
            $categorySelecteds = $request->user()->categorySelected;
        }
                
        if ($request->has('saleAmount')) {
            $saleAmounts = $request['saleAmount'];
        } else {
            $saleAmounts = $request->user()->sale_amount;
        }
        
        $userDetails = [
            'f_name' => $request->f_name,
            'l_name' => $lname,
            'phone' => $request->phone,
            'image' => $imageName,
            'password' => $pass,
            'treadType' => $treadTypes,
            'categorySelected' => $categorySelecteds,
            'sale_amount' => $saleAmounts,
            'updated_at' => now(),
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);

        return response()->json(['message' => translate('successfully updated!')], 200);
    }

    public function update_profile_doc(Request $request)
    {

        if ($request->has('imageDoc1')) {
            $imageDoc1 = ImageManager::update('profile/', $request->user()->imageDoc1, 'png', $request->file('imageDoc1'));
        } else {
            $imageDoc1 = $request->user()->imageDoc1;
        }
        
        if ($request['isComplete'] == 1) {
            $isComplete = 1;
        } else {
            $isComplete = $request->user()->isComplete;
        }
        
        if ($request['isDoc'] == 1) {
            $isDoc = 1;
        } else {
            $isDoc = $request->user()->isDoc;
        }
        
        if ($request->has('imageDoc1') || $imageDoc1 != "def.png") {
            $isDocRequest = 1;
        } else {
            $isDocRequest = 0;
        }
        
        $userDetails = [
            'imageDoc1' => $imageDoc1,
            'isComplete' => $isComplete,
            'isDoc' => $isDoc,
            'isDocReq' => $isDocRequest,
            'updated_at' => now(),
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);

        return response()->json(['message' => translate('successfully updated!')], 200);
    }

    public function update_cm_firebase_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cm_firebase_token' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        DB::table('users')->where('id', $request->user()->id)->update([
            'cm_firebase_token' => $request['cm_firebase_token'],
        ]);

        return response()->json(['message' => translate('successfully updated!')], 200);
    }


    public function customer_wallet(Request $request) {

        $token = $request->header('authorization');
        $result = substr($token,7);

        $user = User::where('temporary_token', '=', $result)->first();

        if(isset($user)) {

            $wallet = CustomerWallet::where('customer_id', '=', $user->id)->first();

            if(isset($wallet)) {
    
                $wallet = (integer)$wallet->balance;
    
            } else {
    
                $wallet = (integer)null;
            }
    

            return response()->json(['cash' => $wallet], 200);

        }

    

    }


    public function customer_wallet_history(Request $request) {

        $token = $request->header('authorization');
        $result = substr($token,7);

        $user = User::where('temporary_token', '=', $result)->first();

        $history = CustomerWalletHistory::where('customer_id', '=', $user->id)->get();
        
        return response()->json(['history' => $history], 200);

    }


}
