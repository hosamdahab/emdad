<?php

namespace App\Http\Controllers\Seller;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Branche;
use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Model\DeliveryMan;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Storage;
use function App\CPU\translate;
use App\Model\Day;
use App\Model\DayShop;
use Auth;
use App\Models\User;
use App\Model\Seller;
use App\Model\Shop;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\SellerWithdrawRequest;

class BrancheController extends Controller
{
  public function index()
    {
        $days = Day::all();
        return view('seller-views.branche.index', compact('days'));
    }

    public function list(Request $request)
    {
        $query_param = [];
        //$sellerId = auth('seller')->id(); auth('seller')->id()
        $sellerId = auth('seller')->id();
        $search = $request['search'];
        if ($request->has('search')) {
            $key = explode(' ', $request['search']);
            $branche = Branche::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('branche_name', 'like', "%{$value}%")
                        ->orWhere('branche_address', 'like', "%{$value}%")
                        ->orWhere('main_branche_id', '=', $sellerId)
                        ->orWhere('manager_phone', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        } else {
            $branche = Branche::where('user_id','=', $sellerId)->latest()->paginate(25)->appends($query_param);
             // $branche = new Branche();
       }

        $branche = DB::table('branche')->where('user_id','=', $sellerId)->latest()->paginate(25)->appends($query_param);
        return view('seller-views.branche.list', compact('branche', 'search'));
    }

    public function search(Request $request)
    {
        $key = explode(' ', $request['search']);
        $branche = Branche::where(['seller_id' => 0])->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('branche_name', 'like', "%{$value}%")
                    ->orWhere('branche_address', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('manager_phone', 'like', "%{$value}%")
                    ->orWhere('identity_number', 'like', "%{$value}%");
            }
        })->get();
        return response()->json([
            'view' => view('seller-views.branche.partials._table', compact('branche'))->render()
        ]);
    }

    public function preview($id)
    {
        $dm = Branche::with(['reviews'])->where(['id' => $id])->first();
        return view('seller-views.branche.view', compact('dm'));
    }

    public function store(Request $request)
    {
        

        $request->validate([
            'manager_name'  => 'required',
            'phone_mobile'  => 'required',
            'states'        => 'required',
            'manager_phone' => 'required|unique:branche',
        ]);


        $sellerId = auth('seller')->id();
        $shop = Shop::where(['seller_id'=>auth('seller')->id()])->first();
        $states_id = DB::table('states')->where('name', '=', $request->states)->first();

        $branch_name = 'فرع ' .$request->states ;
        
        DB::table('branche')->insert([

            'main_branche_id'       => $sellerId,
            'seller_id'             => $sellerId,
            'user_id'               => $sellerId,
            'manager_name'          => $request->manager_name,
            'branche_name'          => $branch_name,
            'phone_mobile'          => '+967'.$request->phone_mobile,
            'manager_phone'         => '+967'.$request->manager_phone,
            'state_name'            => $request->States,
            'state_id'              => $states_id->id,
            'shop_id'               => $shop->id,
            'shop_name'             => $shop->name
        ]);
            
        Toastr::success('تم اضافة الفرع بنجاح');
        // return redirect('seller/branches/list');
        return back();
    }

    public function edit($id)
    {
      $days = Day::all();
      $branche = DB::table('branche')->find($id);
        return view('seller-views.branche.edit', compact('branche', 'days'));
    }

    public function status(Request $request)
    {
        $branche = Branche::find($request->id);
        $branche->is_active = $request->status;
        $branche->save();
        return response()->json([], 200);
    }

    public function update(Request $request)
    {
        
        $request->validate([
            'manager_name'  => 'required',
            'phone_mobile'  => 'required',
            'states'        => 'required',
        ]);

        $states_id = DB::table('states')->where('name', '=', $request->states)->first();
        $shop = Shop::where(['seller_id'=>auth('seller')->id()])->first();
        
        $branch_name = 'فرع ' .$request->states ;

        DB::table('branche')->where('id', '=', $request->myId)->update([

            'manager_name'          => $request->manager_name,
            'branche_name'          => $branch_name,
            'phone_mobile'          => '+967'.$request->phone_mobile,
            'state_name'            => $request->States,
            'state_id'              => $states_id->id,

        ]);
      
    

        Toastr::success('Branche updated successfully!');
        return redirect('seller/branches/list');
    }

    public function delete(Request $request)
    {

     
        DB::table('branche')->where('id', '=', $request->id)->delete();
        Toastr::success(translate('Branche removed!'));
        return back();
    }


    public function seller_branche_details() {

        $get_branche = DB::table('branches')->where('user_id', '=', auth('seller')->id())->first();
        return view('seller-views.branche.details', compact('get_branche'));

    //    return $get_branche->id;

    }


    public function seller_branche_updated(Request $request) {

        $request->validate([
            
            'branche_name' => 'required',

        ]);

        $get_seller = auth('seller')->id();

        $get_branche = Branche::where('user_id', '=', $get_seller)->first();

        $get_branche->branche_name = $request->branche_name;

        $get_branche->email = $request->email;

        $get_branche->business_type = $request->business_type;

        $get_branche->business_size = $request->business_size;

        $get_branche->tax_no = $request->tax_no;

        $get_branche->commercial_no = $request->commercial_no;

        $get_branche->save();

        return response()->json('Branch Updated successfully');
    }


    public function seller_branche_location() {

        return view('seller-views.branche.location');

    }



    public function seller_branche_location_updated(Request $request) {

    
        $get_seller = auth('seller')->id();

        $get_branche = Branche::where('user_id', '=', $get_seller)->first();

        if($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('branche'), $imageName);

        }

        $get_branche->address_longitude = $request->address_longitude;

        $get_branche->address_latitude = $request->address_latitude;

        $get_branche->business_type = $request->business_type;

        $get_branche->building_no = $request->building_no;

        $get_branche->floor_no = $request->floor_no;

        $get_branche->address_details = $request->address_details;

        $get_branche->phone_mobile = $request->phone_mobile;

        $get_branche->image = $imageName;

        $get_branche->save();

    
    
            $field = new DayShop;

            $field->shop_id = $get_branche->shop_id;
            $field->from_hours = $request->start_time;
            $field->am_pm = 'صباحا';
            $field->from_minutes = '00';
            $field->to_hours = $request->end_time;
            $field->to_minutes = '00';
            $field->pm_am = 'مساءا';
            $field->save();
        

        return response()->json('Branch Updated successfully');

    }
}
