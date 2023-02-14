<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\SupportTicket;
use App\Model\SupportTicketConv;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Brian2694\Toastr\Facades\Toastr;
use App\Model\Customers_Chat;

class SupportTicketController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $tickets = SupportTicket::orderBy('id','desc')
                                        ->where(function ($q) use ($key) {
                                            foreach ($key as $value) {
                                                $q->Where('subject', 'like', "%{$value}%");
                                            }
                                        });
            $query_param = ['search' => $request['search']];
        }else{
            $tickets=SupportTicket::orderBy('id','desc');
        }
        $tickets = $tickets->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.support-ticket.view',compact('tickets','search'));
    }

    public function status(Request $request){
        //return response()->json($request);
        
            $currency = SupportTicket::find($request->id);
            $currency->status = $request->status;
            $currency->save();


            return response()->json([
                $currency
            ],200);
        
    }
    public function single_ticket($id){
        $supportTicket = SupportTicket::where('id',$id)->get();
        return view('admin-views.support-ticket.singleView',compact('supportTicket'));
    }
    public function replay_submit(Request $request){

        $reply=[
            'admin_message'=>$request->replay,
            'admin_id'=>$request->adminId,
            'support_ticket_id'=>$request->id,
            'created_at' => now(),
            'updated_at' => now()
        ];
        SupportTicketConv::insert($reply);
        return redirect()->back();
    }


    public function admin_customers_messages() {

        $Customers_Chat = Customers_Chat::all();
        return view('admin-views.support-ticket.customers.index', compact('Customers_Chat'));
    }


    public function admin_customer_chat_view($id) {

        $Customers_Chat = Customers_Chat::find($id);
        $Customers_Chat->seen_by_admin = 1;
        $Customers_Chat->save();
        return view('admin-views.support-ticket.customers.view', compact('Customers_Chat'));

    }


    public function admin_customer_chat_delete(Request $request) {

        Customers_Chat::where('id','=',$request->myId)->delete();
        Toastr::success('Message Deleted successfully!');
        return redirect()->back();

    }

    public function admin_sellers_messages() {

      
        return view('admin-views.support-ticket.sellers.index');

    }

}
