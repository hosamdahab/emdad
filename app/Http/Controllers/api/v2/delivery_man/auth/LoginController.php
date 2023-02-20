<?php

namespace App\Http\Controllers\api\v2\delivery_man\auth;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\DeliveryMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use function App\CPU\translate;
use DB;
use Illuminate\Support\Facades\Session;
use App\Model\PhoneOrEmailVerification;

class LoginController extends Controller
{
    // public function login(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'email' => 'required',
    //         'password' => 'required|min:6'
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['errors' => Helpers::error_processor($validator)], 403);
    //     }

    //     $d_man = DeliveryMan::where(['email' => $request['email']])->first();
    //     if (isset($d_man) && $d_man['is_active'] == 1 && Hash::check($request->password, $d_man->password)) {
    //         $token = Str::random(50);
    //         $d_man->auth_token = $token;
    //         $d_man->save();
    //         return response()->json(['token' => $token], 200);
    //     } else {
    //         $errors = [];
    //         array_push($errors, ['code' => 'auth-001', 'message' => translate('Invalid credential or account suspended')]);
    //         return response()->json([
    //             'errors' => $errors
    //         ], 401);
    //     }
    // }
    
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|numeric',
            'country_code' => 'required'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $d_man = DeliveryMan::where(['phone' => $request['phone'],'country_code'=>$request['country_code']])->first();
        if(!isset($d_man)){
            return response()->json(['errors' =>'User Not found'], 403);
        }
        $this->whatsapp($request);
        $code=rand(1111,9999);
        PhoneOrEmailVerification::create([
            'phone_or_email'=>'+'.$request['country_code'] . $request['phone'],
            'token'=>$code,
        ]);
        return response()->json(['success' =>'show input code to verify'], 200);

    }

    public function verfy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|numeric',
            'country_code' => 'required',
            'verify_code' => 'required|numeric',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $check=PhoneOrEmailVerification::where('phone_or_email','+'.$request['country_code'] . $request['phone'])->where('token',$request['verify_code'])->first();
        if(!isset($check)){
            return response()->json(['errors' =>'verify code is wrong'], 403);
        }

        $d_man = DeliveryMan::where(['phone' => $request['phone']])->first();
        $token = Str::random(50);
        $d_man->auth_token = $token;
        $d_man->save();
        return response()->json(['token' => $token], 200);

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
}
