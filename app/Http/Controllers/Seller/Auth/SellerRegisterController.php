<?php

namespace App\Http\Controllers\Seller\Auth;

use App\Model\City;
use App\CityPlaces;
use App\Model\Seller;
use App\SellerReqProductFile;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Model\Category;
use App\Model\SellerWallet;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Auth\Authenticatable;


class SellerRegisterController extends Controller
{
    public function __construct()
    {
        // $this->middleware('guest:seller', ['except' => [""]]);
    }


    public function new_login()
    {
        return view('seller-views.auth.new-login');
    }

    public function submit_login(Request $request)
    {
        $request->validate([
            'phone' => 'required|numeric|required|in:' . Seller::all()->pluck('phone')->implode(',') . ','
        ]);

        $se = Seller::where(['phone' => $request['phone']])->first(['status']);

        if (isset($se) && $se['status'] == 'approved') {

            Session::put("seller.phone", $request->phone);

            $this->whatsapp($request);
            return $this->login_phone_verify();
        } elseif (isset($se) && $se['status'] == 'pending') {
            return redirect()->back()->withInput($request->only('phone'))
                ->withErrors(['Your account is not approved yet.']);
        } elseif (isset($se) && $se['status'] == 'suspended') {
            return redirect()->back()->withInput($request->only('phone'))
                ->withErrors(['Your account has been suspended!.']);
        }
        return redirect()->back()->withInput($request->only('phone'))
            ->withErrors(['This number is not Registered .']);
    }



    public function create()
    {
        return view('seller-views.auth.register');
    }


    public function submit_email(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'full_name' => 'required|max:30',
            'email' => 'required|email',
            'phone' => 'required|numeric|required'
        ]);


        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withInput($request->all())
                ->withErrors($validator);
        }

        session()->put("seller", [
            "name" => $request->full_name,
            "email" => $request->email,
            "phone" => $request->phone,
        ]);


        $this->whatsapp($request);

        return $this->phone_verify();
    }

    public $token = "";

    public function whatsapp($request)
    {
        $token = '1111';
        $this->token = $token;

        $sender = "967777794438";
        $dest = "967" . $request->phone;
        $massagestouser1 = " حياك الله في امــداد، تفضل رمز الدخول: ";
        $isiPesan = $massagestouser1 . "" . $token . "";


        Session::put("seller.token", $token);

        // masukan data pengiriman pesan ke log
        $curl = curl_init();
        $data = [
            'number' => $sender, // number sender
            'message' => $isiPesan, // message content
            'to' => $dest, // number receiver
        ];

        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($curl, CURLOPT_URL, 'https://api.stiker-label.com/send');
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        $result = curl_exec($curl);
        curl_close($curl);

        // dd($result);

    }



    public function login_phone_verify()
    {
        if(Session::get("seller.phone")){
            return view('seller-views.auth.login-phone-verify');
        }
        return redirect()->route("seller.auth.register");
    }

    public function login_submit_phone_token(Request $request)
    {
        $token = $request->digit_1 . $request->digit_2 . $request->digit_3 . $request->digit_4;
        $token_  =   Session::get("seller.token");
        $phone  =   Session::get("seller.phone");
        $seller = Seller::where("phone", $phone)->first();


        if ($token == $token_) {
            if(Auth::guard('seller')->login($seller)){
                Toastr::info('Welcome to your dashboard!');
                if (SellerWallet::where('seller_id', auth('seller')->id())->first() == false) {
                    DB::table('seller_wallets')->insert([
                        'seller_id' => auth('seller')->id(),
                        'withdrawn' => 0,
                        'commission_given' => 0,
                        'total_earning' => 0,
                        'pending_withdraw' => 0,
                        'delivery_charge_earned' => 0,
                        'collected_cash' => 0,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
            return redirect()->route('seller.dashboard.index');
        } else {
            Toastr::error('verification number is wrong');
            return redirect()->route('seller.auth.login-phone-verify');
        }
    }


    public function phone_verify()
    {
        // if(Session::get("seller.phone")){
            return view('seller-views.auth.phone-verify');
        // }
        return redirect()->route("seller.auth.register");
    }


    public function submit_phone_token(Request $request)
    {
        $token = $request->digit_1 . $request->digit_2 . $request->digit_3 . $request->digit_4;
        $token_  =   Session::get("seller.token");

        if ($token == $token_) {
            return redirect()->route('seller.auth.seller-info-1');
        } else {
            Toastr::error('verification number is wrong');
            return redirect()->route('seller.auth.phone-verify');
        }
    }


    public function seller_info_1()
    {
        $cat = City::all();
        if(Session::get("seller.email")){
            return view('seller-views.auth.seller-info-1', compact("cat"));
        }
        return redirect()->route("seller.auth.register");
    }


    public function submit_seller_info_1(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'company_name_en' => 'required|regex:/^[a-zA-ZÑñ\s]+$/',
            'company_name_ar' => 'required|max:255',
            'company_type' => 'required',
            'country' => 'required',
            'city_id' => 'required',
            'places' => 'required',
        ]);


        if (!$validator->fails()) {
            Session::put('seller.company_name_en', $request->company_name_en);
            Session::put('seller.company_name_ar', $request->company_name_ar);
            Session::put('seller.company_type', $request->company_type);
            Session::put('seller.country', $request->country);
            Session::put('seller.city_id', $request->city_id);
            Session::put('seller.places', $request->places);
        }



        return ["errors" => $validator->errors()->all()];
    }


    public function seller_info_2()
    {
        if(Session::get("seller.country")){
            return view('seller-views.auth.seller-info-2');
        }
        return redirect()->route("seller.auth.register");
    }


    public function submit_seller_info_2(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'regiseration_number' => 'required|regex:/^[0-9]{1}/',
            'start_date' => 'required',
            'end_date' => 'required',
            'regist_image' => 'required',
            
        ]);


        if ($validator->fails()) {

            return redirect()
                ->back()
                ->withInput($request->all())
                ->withErrors($validator);
        }

        $file = $request->file('regist_image');
        $regist_image = date('YmdHi') . $file->getClientOriginalName();
        $file->move(public_path('assets/images/seller'), $regist_image);

        
        Session::put('seller.start_date', $request->start_date);
        Session::put('seller.end_date', $request->end_date);
        Session::put('seller.regist_image', $regist_image);
    

        return redirect()->route('seller.auth.seller-info-3');
    }



    public function seller_info_3()
    {
        // if(Session::get("seller.regiseration_number")){

            if (Session::get("seller.categories") == null) {
                Session::put("seller.categories", []);
            }
            $all_cats = Category::where("parent_id", 0)->get();
            return view('seller-views.auth.seller-info-3', compact("all_cats"));

        // }
        // return redirect()->route("seller.auth.register");
        
    }



    public function submit_seller_info_3(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'categories' => 'required|array',
            'categories[].*' => 'required|exists:categories,id',
        ]);

        Session::put("seller.categories", $request->categories);

        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withInput($request->all())
                ->withErrors($validator);
        }

        try {
            $collections = (new FastExcel)->import($request->file('products_file'));
        } catch (\Exception $exception) {
            Toastr::error('You have uploaded a wrong format file, please upload the right file.');
            return back();
        }

        $data = [];
        $skip = ['youtube_video_url', 'details', 'thumbnail'];

        foreach ($collections as $collection) {
            foreach ($collection as $key => $value) {
                if ($key != "" && $value === "") {
                    Toastr::error('Please fill ' . $key . ' fields');
                    return back();
                }
            }
        }

        $file_name = Carbon::now()->toDateString() . "-" . uniqid() . ".xlsx";
        if (!Storage::disk('public')->exists('products_file')) {
            Storage::disk('public')->makeDirectory('products_file');
        }

      $seller = DB::table('sellers')->insert([
            'f_name' => Session::get("seller.company_name_ar"),
            'email' => Session::get("seller.email"),
            'phone' => Session::get("seller.phone"),
            'company_name_en' => Session::get("seller.company_name_en"),
            'company_name_ar' => Session::get("seller.company_name_ar"),
            'company_type' => Session::get("seller.company_type"),
            'country' => Session::get("seller.country"),
            'city_id' => Session::get("seller.city_id"),
            'places' => json_encode(Session::get("seller.places")),    /// array
            'regiseration_number' => Session::get("seller.regiseration_number"),
            'start_date' => Session::get("seller.start_date"),
            'end_date' => Session::get("seller.end_date"),
            'regist_image' => Session::get("seller.regist_image"),
            'categories' => json_encode(Session::get("seller.categories")), ///  array
            'created_at' => Carbon::now()
        ]);


        $imageName = time().'.'.$request->products_file->extension();  
         
        $request->products_file->move(public_path('products_file'), $imageName);

        DB::table('products')->insert($data);


        // $states = DB::table('states')->where('id', '=', json_decode($seller->city_id))->first();
        $city = DB::table('cities')->where('id', '=', Session::get("seller.city_id"))->first();


        DB::table('branche')->insert([
            
            'user_id'           => Seller::where("phone", Session::get("seller.phone"))->first()->id,
            'branche_name'      => 'الفرع الرئيسي',
            'shop_name'         => Session::get("seller.company_name_ar"),
            'store_id'          => Seller::where("phone", Session::get("seller.phone"))->first()->id,
            'shop_id'           => Seller::where("phone", Session::get("seller.phone"))->first()->id,
            'city_id'           => Session::get("seller.city_id"),
            // 'city_name'         => $city->name,
            // 'state_id'       => $state_id,
            'country_id'        => 243,
            'seller_id'         => Seller::where("phone", Session::get("seller.phone"))->first()->id,
            'phone_mobile'      => Session::get("seller.phone"),

        ]);

        $ip = getenv('REMOTE_ADDR'); // your ip address here
        $query = @unserialize(file_get_contents('http://ip-api.com/php/'.$ip));
        if($query && $query['status'] == 'success')
        {

            $shop = DB::table('shops')->insert([

                'seller_id' => Seller::where("phone", Session::get("seller.phone"))->first()->id,
                'seller_parent' => Seller::where("phone", Session::get("seller.phone"))->first()->id,
                'name'  => Session::get("seller.company_name_ar"),
                'address' => $query['city'],
    
            ]);

        }

       


        SellerReqProductFile::create([
            'seller_id' => Seller::where("phone", Session::get("seller.phone"))->first()->id,
            'file_name' => $file_name
        ]);

        Toastr::success('تم ارسال الملف بنجاح!');
        return redirect()->route("seller.auth.new-login");
    }



    public function get_places(Request $request)
    {
        $cat = CityPlaces::where(['city_id' => $request->city_id])->get();
        $res = '';
        foreach ($cat as $row) {
            if ($row->id == $request->city_id) {
                $res .= '<option value="' . $row->id . '" selected >' . $row->name . '</option>';
            } else {
                $res .= '<option value="' . $row->id . '">' . $row->name . '</option>';
            }
        }
        return response()->json([
            'select_tag' => $res,
        ]);
    }
}
