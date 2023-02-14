<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ReportsController extends Controller
{


    public function seller_sales() {

        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');


        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'paid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        

        if(count($sales) > 0) {

            foreach($sales as $val) {

                $quantity = $val->qty;
                $price = $val->price;
    
                $total[] = $val->qty * $val->price;
                
            }      
    
            $sales_of_month = array_sum($total);

        } else {

            $sales_of_month = 0;

        }
      
        
        $invoices = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'paid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');

            if(isset($invoices)) {

                $invoices = $invoices;

            } else {

                $invoices = 0;

            }


            $unpaid_invoices = DB::table('order_details')->where([
                ['seller_id', '=', auth('seller')->id()],
                ['payment_status', '=', 'unpaid']
                ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');
        

                if(isset($unpaid_invoices)) {

                    $unpaid_invoices = $unpaid_invoices;

                } else {

                    $unpaid_invoices = 0;
                    
                }



            $deffered_orders = DB::table('order_details')->where([
                ['seller_id', '=', auth('seller')->id()],
                ['deffered', '=', true]
                ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();



                if(count($deffered_orders) > 0) {

                    foreach($deffered_orders as $val) {
        
                        $quantity = $val->qty;
                        $price = $val->price;
            
                        $total[] = $val->qty * $val->price;
                        
                    }      
            
                    $sales_of_month_deffered = array_sum($total);
        
                } else {
        
                    $sales_of_month_deffered = 0;
        
                }



                $return_orders = DB::table('order_details')->where([
                    ['seller_id', '=', auth('seller')->id()],
                    ['delivery_status', '=', 'canceled']
                    ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();



                    if(count($return_orders) > 0) {

                        foreach($return_orders as $val) {
            
                            $quantity = $val->qty;
                            $price = $val->price;
                
                            $total[] = $val->qty * $val->price;
                            
                        }      
                
                        $sales_of_month_return = array_sum($total);
            
                    } else {
            
                        $sales_of_month_return = 0;
            
                    }

        return view('seller-views.reports.sales.index', compact('sales_of_month', 'invoices', 'unpaid_invoices', 'sales_of_month_deffered', 'sales_of_month_return'));

    }



    public function seller_sales_chart() {


        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');


        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'paid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        

        
        
       
        return response()->json(['sales' => $sales]);

    }

    
    public function sales_of_month_invoices() {


        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'paid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
            
        return view('seller-views.reports.sales.invoices', compact('sales'));
    }


    public function sales_of_month_unpaid_invoces() {

        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'unpaid']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
            
        return view('seller-views.reports.sales.unpaid_invoices', compact('sales'));

    }
   
    public function seller_sales_refund() {


        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');


        $sales_refund = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['delivery_status', '=', 'canceled']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        

        if(count($sales_refund) > 0) {

            foreach($sales_refund as $val) {

                $quantity = $val->qty;
                $price = $val->price;
    
                $total[] = $val->qty * $val->price;
                
            }      
    
            $sales_of_month = array_sum($total);

        } else {

            $sales_of_month = 0;

        }
      
        
        $invoices = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['delivery_status', '=', 'canceled']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');

            if(isset($invoices)) {

                $invoices = $invoices;

            } else {

                $invoices = 0;

            }



        return view('seller-views.reports.refund.index', compact('sales_of_month', 'invoices'));
    }



    public function seller_sales_refund_chart() {

        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');


        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['delivery_status', '=', 'canceled']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        

        
        
       
        return response()->json(['sales' => $sales]);


    }



    public function refund_invoices_sales_of_month() {

        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['delivery_status', '=', 'canceled']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();


        return view('seller-views.reports.refund.invoices', compact('sales'));
        
    }



    public function seller_deferred_sales_report() {

        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');


        $sales_refund = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'delayed']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        

        if(count($sales_refund) > 0) {

            foreach($sales_refund as $val) {

                $quantity = $val->qty;
                $price = $val->price;
    
                $total[] = $val->qty * $val->price;
                
            }      
    
            $sales_of_month = array_sum($total);

        } else {

            $sales_of_month = 0;

        }
      
        
        $invoices = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'deffered']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');

            if(isset($invoices)) {

                $invoices = $invoices;

            } else {

                $invoices = 0;

            }


        return view('seller-views.reports.delayed.index', compact('sales_of_month', 'invoices'));

    }



    public function seller_sales_deffered_chart() {

        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');


        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'delayed']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
        
        
       
        return response()->json(['sales' => $sales]);


    }



    public function delayed_sales_month_invoices() {

        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        $sales = DB::table('order_details')->where([
            ['seller_id', '=', auth('seller')->id()],
            ['payment_status', '=', 'delayed']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();


        return view('seller-views.reports.delayed.invoices', compact('sales'));

    }

    public function seller_stock_report() {

        return view('seller-views.reports.stock');

    }



    public function seller_delivery_report() {

        return view('seller-views.reports.delivery.index');

    }


    public function seller_sales_delivery_chart(Request $request) {

        $myDelivery = $request->myDelivery;

        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        $sales = DB::table('orders')->where([
            ['delivery_man_id', '=', $myDelivery],
            ['order_status', '=', 'delivered']
            ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();


            $sales_amount = DB::table('orders')->where([
                ['delivery_man_id', '=', $myDelivery],
                ['order_status', '=', 'delivered']
                ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->sum('order_amount');


                $sales_count = DB::table('orders')->where([
                    ['delivery_man_id', '=', $myDelivery],
                    ['order_status', '=', 'delivered']
                    ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->count('id');

        return response()->json(['sales' => $sales, 'sales_amount' => $sales_amount, 'sales_count' => $sales_count]);

    }



    public function seller_sales_month_delivery_invoices() {


            $first_day_of_month = date('Y-m-01');
            $get_current_date = date('Y-m-d');
    
            $sales = DB::table('orders')->where([
                ['delivery_man_id', '=', $myDelivery],
                ['order_status', '=', 'delivered']
                ])->whereBetween('created_at', [$first_day_of_month, $get_current_date])->get();
    
    
            return view('seller-views.reports.delayed.invoices', compact('sales'));

    }

    public function seller_branch_report() {

        return view('seller-views.reports.branch');

    }



    public function seller_sales_branch_chart(Request $request) {



        $first_day_of_last_month = date('Y-m-01', strtotime('last month'));
        $first_day_of_month = date('Y-m-01');
        $get_current_date = date('Y-m-d');

        
        $sales = DB::table('branche')->where('id', '=', $request->branch_report)->first();

        $check = DB::table('products')->where('branche_id', '=', $sales->id)->get();


        if(count($check) > 0) {

            foreach($check as $val) {

                $pro = DB::table('order_details')->where('product_id', '=', $val->id)->first();
     
             }

        } else {

            $pro = 0;
        }
      


        return response()->json(['pro' => $pro]);


    }

    public function seller_commissions_report() {

        return view('seller-views.reports.commissions');

    }


    public function seller_wallet() {


    }

    

}
