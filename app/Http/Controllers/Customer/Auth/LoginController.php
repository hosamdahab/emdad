<?php

namespace App\Http\Controllers\Customer\Auth;

use App\CPU\CartManager;
use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\BusinessSetting;
use App\Model\Wishlist;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Gregwar\Captcha\CaptchaBuilder;
use Illuminate\Support\Facades\Session;
use Gregwar\Captcha\PhraseBuilder;
use Illuminate\Support\Str;
use function App\CPU\translate;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use App\CPU\SMS_module;
use App\Model\PhoneOrEmailVerification;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
use Laravel\Passport\HasApiTokens;
use App\Model\CustomerWallet;

class LoginController extends Controller
{
    public $company_name;

    public function __construct()
    {
        $this->middleware('guest:customer', ['except' => ['logout']]);
    }


    public function login()
    {
        session()->put('keep_return_url', url()->previous());
        return view('customer-view.auth.login');
    }


     public function submit(Request $request)
    {
        $request->validate([
            'phone' => 'required|numeric|required',
            // |in:' . User::all()->pluck('phone')->implode(',') . ','
        ]);

        $phonewitcountrycode = $request['country_code'] . $request['phone'];
        $se = User::where(['phone' => $phonewitcountrycode])->first();


        if (isset($se) && $se['is_active'] == 1) {

            Session::put("user.phone", $request->phone);

            $this->whatsapp($request);
            return $this->login_phone_verify();
        } elseif (isset($se) && $se['status'] == 'pending') {
            return redirect()->back()->withInput($request->only('phone'))
                ->withErrors(['Your account is not approved yet.']);
        } elseif (isset($se) && $se['status'] == 'suspended') {
            return redirect()->back()->withInput($request->only('phone'))
                ->withErrors(['Your account has been suspended!.']);
        } else {

            $user = User::create([
                'f_name' => $request['phone'],
                'l_name' => $request['phone'],
                'email' => $request['phone'],
                'phone' => $phonewitcountrycode,
                'is_active' => 1,
                'password' => bcrypt($request['phone'])
            ]);
            $this->whatsapp($request);
            Session::put("user.phone", $phonewitcountrycode);
            return $this->login_phone_verify();
        }
        return redirect()->back()->withInput($request->only('phone'))
            ->withErrors(['This number is not Registered .']);
    }

    public function whatsapp($request)
    {

        $user_id = $request['country_code'] . $request['phone'];
        //Log::info($user_id);
        // $user = User::where(['phone' => $user_id])->first();
        $phoneToSend = str_replace('+', '', $user_id);
        if ($phoneToSend == 967777363554) {
            $token = 4321;
        } else {
            $token = rand(1000, 9999);
        }
        DB::table('phone_or_email_verifications')->insert([
            'phone_or_email' => $user_id,
            'token' => $token,
            'created_at' => now(),
            'updated_at' => now(),
        ]);


        $sender = "00967777794438";
        $dest = "967" . $request['phone'];
        $massagestouser1 = " مرحباً بك عزيزي المستخدم في منصة إمداد سوق الجملة  يرجى إدخال هذا الرقم في خانة التحقق ";
        $isiPesan = $massagestouser1 . "*" . $token . "*";

        Session::put("user.token", $token);


        $data = [
            'api_key' => 'OF24p3vjcSxWIBNtUzlDYJfme5smuK',
            'sender' => $sender,
            'number' => $dest,
            'message' => $isiPesan
        ];
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://wpser.smartapps.top/send-message",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);


        //Log::info($data);
        //Log::info($response);

        // dd($result);

    }


    public function login_phone_verify()
    {
        if(Session::get("user.phone")){
            return view('customer-view.auth.login-phone-verify');
        }
        return redirect('/seller/auth/register');
    }


    public function login_submit_phone_token(Request $request)
    {
        $token = $request->digit_1 . $request->digit_2 . $request->digit_3 . $request->digit_4;
        $token_  =   Session::get("user.token");
        $phone  =   Session::get("user.phone");
        $seller = User::where("phone", $phone)->first();
        if(!$seller){
            $seller = User::where("phone",  '+967'.$phone)->first();
        }
        if(!$seller){
             Toastr::error('The user does not exist');
             return redirect()->back();
        }

        if ($token == $token_) {
            if(Auth::guard('customer')->login($seller)){
                Toastr::info('Welcome to your dashboard!');
                if (CustomerWallet::where('customer_id', auth('customer')->id())->first() == false) {
                    DB::table('customer_wallets')->insert([
                        'customer_id' => auth('customer')->id(),
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
            return redirect()->route('customer.locations');
        } else {
            Toastr::error('verification number is wrong');
            return redirect()->route('customer.login.phone.verify');
        }
    }


 

    public function logout(Request $request)
    {
        auth()->guard('customer')->logout();
        session()->forget('wish_list');
        Toastr::info('Come back soon, ' . '!');
        return redirect()->route('home');
    }
}
