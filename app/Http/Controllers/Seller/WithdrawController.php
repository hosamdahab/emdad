<?php

namespace App\Http\Controllers\Seller;

use App\CPU\BackEndHelper;
use App\CPU\Convert;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\SellerWallet;
use App\Model\WithdrawRequest;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class WithdrawController extends Controller
{
    public function w_request(Request $request)
    {
        $wallet = SellerWallet::where('seller_id', auth()->guard('seller')->user()->id)->first();
        if (($wallet->total_earning) >= Convert::usd($request['amount']) && $request['amount'] > 1) {
            DB::table('withdraw_requests')->insert([
                'seller_id' => auth()->guard('seller')->user()->id,
                'amount' => Convert::usd($request['amount']),
                'transaction_note' => null,
                'approved' => 0,
                'created_at' => now(),
                'updated_at' => now()
            ]);
            $wallet->total_earning -= Convert::usd($request['amount']);
            $wallet->pending_withdraw += Convert::usd($request['amount']);
            $wallet->save();
            Toastr::success('Withdraw request has been sent.');
            return redirect()->back();
        }

        Toastr::error('invalid request.!');
        return redirect()->back();
    }

    public function close_request($id)
    {
        $withdraw_request = WithdrawRequest::find($id);
        $wallet = SellerWallet::where('seller_id', auth()->guard('seller')->user()->id)->first();
        
        if (isset($withdraw_request) && isset($wallet) && $withdraw_request->approved == 0) {
            $wallet->total_earning += Convert::usd($withdraw_request['amount']);
            $wallet->pending_withdraw -= Convert::usd($withdraw_request['amount']);
            $wallet->save();
            $withdraw_request->delete();
            Toastr::success('Request closed!');
        } else {
            Toastr::error('Invalid request');
        }

        return back();
    }

    public function status_filter(Request $request)
    {
        session()->put('withdraw_status_filter', $request['withdraw_status_filter']);
        return response()->json(session('withdraw_status_filter'));
    }

    public function list()
    {
        
        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'paid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        
        foreach($sales as $val) {

            $quantity = $val->qty;
            $price = $val->price;

            $total[] = $val->qty * $val->price;
            
        }      

        $sales_of_month = array_sum($total);
        
        $invoices = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'paid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');


        $unpaid_invoices = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'unpaid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');
       

        return view('seller-views.reports.sales', compact('sales_of_month', 'invoices', 'unpaid_invoices'));
    }


   
}
