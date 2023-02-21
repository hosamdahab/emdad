<?php



namespace App\Http\Controllers\Seller;



use App\Http\Controllers\Controller;

use App\Model\Branche;

use Illuminate\Http\Request;

use App\Model\Product;

use App\Model\Shop;

use App\Model\DayShop;

use Carbon\Carbon;

use App\Model\employees;

use App\Model\DeliveryMan;

use Illuminate\Support\Facades\Auth;

use Brian2694\Toastr\Facades\Toastr;

use DB;
use App\Model\Seller;



class SettingController extends Controller

{

    public function index()

    {

        

        return view('seller-views.settings.index');



    }



    public function alerts()

    {

        $branches = DB::table('branche')->where('user_id', '=', \auth('seller')->id())->get();

        return view('seller-views.settings.partial.alerts', compact('branches'));

    }



    public function operational_details()

    {

        $branches = DB::table('branche')->where('user_id', '=', \auth('seller')->id())->get();

        $delviery = DeliveryMan::where(['seller_id'=>auth('seller')->id()])->get();

        return view('seller-views.settings.partial.operational-details', compact('branches', 'delviery'));

    }





    public function seller_branch_automatic_orders_select(Request $request) {





        $branch_id = $request->branch_id;



        $branch = DB::table('branche')->where('id', '=', $branch_id)->first();



        return response()->json(['branch' => $branch]);



    }





    public function workTime()

    {



        $saturday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '6']

            ])->first();





        $sunday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '7']

            ])->first();





        $monday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '1']

            ])->first();





        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '2']

            ])->first();





        $wednesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '3']

            ])->first();





        $thursday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '4']

            ])->first();



        // $branches = DB::table('branche')->where('user_id', '=', \auth('seller')->id())->get();

        return view('seller-views.settings.partial.workTime',compact('saturday', 'sunday', 'monday', 'tuesday', 'wednesday', 'thursday'));

    }





    public function employees()

    {

       

        $seller = auth('seller')->id();



        $employees = employees::where('parent_id', '=', $seller)->get();

        

        $branche = DB::table('branche')->where('user_id', '=', $seller)->get();



        

        return view('seller-views.settings.partial.employees',compact('employees', 'branche'));

    }





    public function financial_settings() {



        $branches = DB::table('branche')->where('user_id', '=', \auth('seller')->id())->get();

        return view('seller-views.settings.financial',compact('branches'));



    }





    public function seller_deferred_sale_pro() {



        $data = Product::where([



            ['added_by' ,'!=', 'Admin'],

            ['user_id', '=', \auth('seller')->id()]



        ])->latest()->paginate(10);



        return view('seller-views.settings.deferred_products', compact('data'));

    }





    public function seller_automatic_orders(Request $request) {



        $automaticOrders = $request->automaticOrders;



        $Shop = DB::table('branche')->where('user_id', '=', \auth('seller')->id())->update([



            'default_delivery' => $automaticOrders



        ]);





        return response()->json('Automatic Request Update successfully');

        // return 'good';

    }





    public function seller_automatic_orders_delete(Request $request) {



        $automaticOrdersDelete = $request->automaticOrdersDelete;



        $branch = DB::table('branche')->where('default_delivery', '=', $automaticOrdersDelete)->update([



            'default_delivery' => null

        ]);



        return response()->json(['branch' => $branch]);



    }





    public function seller_product_deferred_store(Request $request) {



        $validated = $request->validate([

            'payment_in'    => 'required',

        

        ]);





        $product_id = $request->product_id;





        $Product = Product::where('id', '=', $product_id)->update([



            'deferred'      => 1,

            'branche_id'    => $request->branche_id,

            'payment_in'    => $request->payment_in



        ]);





        Toastr::success('تم تفعيل البيع بالاجل');

        return redirect()->back();



    }





    public function seller_product_deferred_delete(Request $request) {





        $product_id = $request->product_id;





        $Product = Product::where('id', '=', $product_id)->update([



            'deferred'      => null,

            'payment_in'    => null



        ]);



        Toastr::success('تم الغاء البيع بالاجل');

        return redirect()->back();

    }





    public function seller_commissions_sale_pro() {



        $data = Product::where([



            ['added_by' ,'!=', 'Admin'],

            ['user_id', '=', \auth('seller')->id()]



        ])->latest()->paginate(10);

        return view('seller-views.settings.products_commissions.index', compact('data'));

    }





    public function seller_commissions_sale_pro_store(Request $request) {





        $validated = $request->validate([

            'commissions_min_purchasing'        => 'required',

            'commissions_purchasing_percent'    => 'required',

        ]);



        $product_id = $request->product_id;



        $Product = Product::where('id', '=', $product_id)->update([



            'sales_commissions'         => $request->commissions_purchasing_percent,

            'min_qty_sales_commissions' => $request->commissions_min_purchasing



        ]);



        return redirect()->back();



    }



    



    public function seller_product_commissions_delete(Request $request) {



        $product_id = $request->product_id;



        $Product = Product::where('id', '=', $product_id)->update([



            'sales_commissions'         => null,

            'min_qty_sales_commissions' => null



        ]);



        return redirect()->back();



    }







    public function seller_delivery_product_commissions() {

        $seller=Seller::find(auth('seller')->id())->update(['enable_commissions'=>1]);
        $data = Product::where([



            ['added_by' ,'!=', 'Admin'],

            ['user_id', '=', \auth('seller')->id()]



        ])->latest()->paginate(10);

        return view('seller-views.settings.delivery_commissions.index', compact('data'));



    }





    public function seller_delivery_product_commissions_store(Request $request) {



        $validated = $request->validate([

            'commissions_min_delivery'          => 'required',

            'commissions_delivery_percent'      => 'required',
            'commissions_end_date'=>'required|date',
            'commissions_start_date'=>'required|date',

            // 'branche_id'                        => 'required'
        ]);



        $product_id = $request->product_id;
        


        $Product = Product::where('id', '=', $product_id)->update([



            'commissions_min_delivery'      => $request->commissions_min_delivery,

            'commissions_delivery_percent'  => $request->commissions_delivery_percent,

            'commissions_end_date'=>$request->commissions_end_date,
            'commissions_start_date'=>$request->commissions_start_date,

            // 'branche_id'                    => $request->branche_id



        ]);



        return redirect()->back();



    }







    public function seller_product_delivery_commissions_delete(Request $request) {



        $product_id = $request->product_id;



        $Product = Product::where('id', '=', $product_id)->update([



            'commissions_min_delivery'         => null,

            'commissions_delivery_percent'     => null



        ]);



        return redirect()->back();



    }







    public function seller_work_time_update(Request $request) {



        if($request->saturday != null) {



           

             $get_from_hours = substr($request->saturday_from_time,0,2);

             $get_from_minutes = substr($request->saturday_from_time,3);





             $get_to_hours = substr($request->saturday_to_time,0,2);

             $get_to_minutes = substr($request->saturday_to_time,3);



             $day_check = DayShop::where([



                ['day_id', '=', 6],

                ['user_id', '=', auth('seller')->id()]

                

             ])->first();





             if(isset($day_check)) {





                $day_check = DayShop::where([



                    ['day_id', '=', 6],

                    ['user_id', '=', auth('seller')->id()]

                    

                 ])->update([



                    'day_id'        => 6,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()





                 ]);



             } else {



                $validated = $request->validate([

                    'saturday_from_time'    => 'required',

                    'saturday_to_time'      => 'required',

                    

    

                ]);

        



                DayShop::create([



                    'day_id'        => 6,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()

    

                ]);







             }



           



        } elseif($request->saturday == null) {



            DayShop::where([



                ['day_id', '=', 6],

                ['user_id', '=', auth('seller')->id()]

                

             ])->delete();



        }





        if($request->sunday != null) {



            $validated = $request->validate([

                'sunday_from_time'    => 'required',

                'sunday_to_time'      => 'required',



            ]);

    

             $get_from_hours = substr($request->sunday_from_time,0,2);

             $get_from_minutes = substr($request->sunday_from_time,3);





             $get_to_hours = substr($request->sunday_to_time,0,2);

             $get_to_minutes = substr($request->sunday_to_time,3);



             $day_check = DayShop::where([



                ['day_id', '=', 7],

                ['user_id', '=', auth('seller')->id()]

                

             ])->first();





             if(isset($day_check->id)) { 





                $day_check = DayShop::where([



                    ['day_id', '=', 7],

                    ['user_id', '=', auth('seller')->id()]

                    

                 ])->update([



                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()



                 ]);



             } else {





                DayShop::create([



                    'day_id'        => 7,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()

    

                ]);





             }



           





        } else if($request->sunday == null) {



            $day_check = DayShop::where([



                ['day_id', '=', 7],

                ['user_id', '=', auth('seller')->id()]

                

             ])->delete();



        }

        

        if($request->monday != null) {



            $validated = $request->validate([

                'monday_from_time'    => 'required',

                'monday_to_time'      => 'required',



            ]);

    

             $get_from_hours = substr($request->monday_from_time,0,2);

             $get_from_minutes = substr($request->monday_from_time,3);





             $get_to_hours = substr($request->monday_to_time,0,2);

             $get_to_minutes = substr($request->monday_to_time,3);





             $day_check = DayShop::where([



                ['day_id', '=', 1],

                ['user_id', '=', auth('seller')->id()]

                

             ])->first();





             if(isset($day_check->id)) {  



                $day_check = DayShop::where([



                    ['day_id', '=', 1],

                    ['user_id', '=', auth('seller')->id()]

                    

                 ])->update([



                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()



                 ]);





             } else {





                DayShop::create([



                    'day_id'        => 1,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()

    

                ]);





             }



           





        } else if($request->monday == null) {





            $day_check = DayShop::where([



                ['day_id', '=', 1],

                ['user_id', '=', auth('seller')->id()]

                

             ])->delete();



        }



       if($request->tuesday != null) {



            $validated = $request->validate([

                'tuesday_from_time'    => 'required',

                'tuesday_to_time'      => 'required',



            ]);

    

             $get_from_hours = substr($request->tuesday_from_time,0,2);

             $get_from_minutes = substr($request->tuesday_from_time,3);





             $get_to_hours = substr($request->tuesday_to_time,0,2);

             $get_to_minutes = substr($request->tuesday_to_time,3);



             $day_check = DB::table('day_shop')->where([



                ['day_id', '=', $request->tuesday],

                ['user_id', '=', auth('seller')->id()]

                

             ])->first();





             if(isset($day_check->id)) {  





                $day_check = DB::table('day_shop')->where([



                    ['day_id', '=', $request->tuesday],

                    ['user_id', '=', auth('seller')->id()]

                    

                 ])->update([



                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()



                 ]);





             } else {





                DB::table('day_shop')->insert([



                    'day_id'        => $request->tuesday,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()

    

                ]);





             }



           





        } else if($request->tuesday == null) {



            $day_check = DB::table('day_shop')->where([



                ['day_id', '=', 2],

                ['user_id', '=', auth('seller')->id()]

                

             ])->delete();



        }





       if($request->wednesday != null) {



            $validated = $request->validate([

                'wednesday_from_time'    => 'required',

                'wednesday_to_time'      => 'required',



            ]);

    

             $get_from_hours = substr($request->wednesday_from_time,0,2);

             $get_from_minutes = substr($request->wednesday_from_time,3);





             $get_to_hours = substr($request->wednesday_to_time,0,2);

             $get_to_minutes = substr($request->wednesday_to_time,3);



             $day_check = DB::table('day_shop')->where([



                ['day_id', '=', $request->wednesday],

                ['user_id', '=', auth('seller')->id()]

                

             ])->first();





             if(isset($day_check->id)) {  



                $day_check = DB::table('day_shop')->where([



                    ['day_id', '=', $request->wednesday],

                    ['user_id', '=', auth('seller')->id()]

                    

                 ])->update([



                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()



                 ]);





             } else {





                DB::table('day_shop')->insert([



                    'day_id'        => $request->wednesday,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()

    

                ]);



             }



            





        } else if($request->wednesday == null) {



            $day_check = DB::table('day_shop')->where([



                ['day_id', '=', 3],

                ['user_id', '=', auth('seller')->id()]

                

             ])->delete();



        }





        if($request->thursday != null) {



            $validated = $request->validate([

                'thursday_from_time'    => 'required',

                'thursday_to_time'      => 'required',



            ]);

    

             $get_from_hours = substr($request->thursday_from_time,0,2);

             $get_from_minutes = substr($request->thursday_from_time,3);





             $get_to_hours = substr($request->thursday_to_time,0,2);

             $get_to_minutes = substr($request->thursday_to_time,3);



             $day_check = DB::table('day_shop')->where([



                ['day_id', '=', $request->thursday],

                ['user_id', '=', auth('seller')->id()]

                

             ])->first();





             if(isset($day_check->id)) {   



                $day_check = DB::table('day_shop')->where([



                    ['day_id', '=', $request->thursday],

                    ['user_id', '=', auth('seller')->id()]

                    

                 ])->update([



                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()



                 ]);



             } else {



                DB::table('day_shop')->insert([



                    'day_id'        => $request->thursday,

                    'from_hours'    => $get_from_hours,

                    'am_pm'         => 'صباحا',

                    'from_minutes'  => $get_from_minutes,

                    'to_hours'      => $get_to_hours,

                    'to_minutes'    => $get_to_minutes,

                    'pm_am'         => 'مساءا',

                    'user_id'       => auth('seller')->id(),

                    'created_at'    => Carbon::now(),

                    'updated_at'    => Carbon::now()

    

                ]);





             }



           



        } elseif($request->thursday == null) {



            $day_check = DB::table('day_shop')->where([



                ['day_id', '=', 4],

                ['user_id', '=', auth('seller')->id()]

                

             ])->delete();



        }





        return response()->json('Work Time Updated successfully');





    }







    public function seller_branche_work_time_select() {



        // $branch_id = $request->branch_id;



        $saturday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '6']

            ])->first();





        $sunday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '7']

            ])->first();





        $monday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '1']

            ])->first();





        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '2']

            ])->first();





        $wednesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '3']

            ])->first();





        $thursday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '4']

            ])->first();



        

        return response()->json(['saturday' => $saturday, 'sunday' => $sunday, 'monday' => $monday, 'tuesday' => $tuesday, 'wednesday' => $wednesday, 'thursday' => $thursday]);

    }





    public function seller_branche_work_time_remove_saturday(Request $request) {



        $branch_id = $request->branch_id;



        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '6']

            ])->delete();





            return response()->json('Work Time Updated successfully');

    }







    public function seller_work_time_sunday_delete(Request $request) {





        $branch_id = $request->branch_id;



        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '7']

            ])->delete();





            return response()->json('Work Time Updated successfully');



    }





    public function seller_work_time_monday_delete(Request $request) {





        $branch_id = $request->branch_id;



        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '1']

            ])->delete();





            return response()->json('Work Time Updated successfully');



    }





    public function seller_work_time_tuesday_delete(Request $request) {

        

        $branch_id = $request->branch_id;



        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '2']

            ])->delete();





            return response()->json('Work Time Updated successfully');



    }







    public function seller_work_time_wednesday_delete(Request $request) {





        $branch_id = $request->branch_id;



        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '3']

            ])->delete();





            return response()->json('Work Time Updated successfully');



    }







    public function seller_work_time_thursday_delete(Request $request) {





        $branch_id = $request->branch_id;



        $tuesday = DB::table('day_shop')->where([

            ['user_id', '=', auth('seller')->id()],

            ['day_id', '=', '4']

            ])->delete();





            return response()->json('Work Time Updated successfully');



    }





    public function seller_branch_employees_select(Request $request) {



        $branch_id = $request->branch_id;



        $employees = employees::where('user_id', '=', $branch_id)->get();



        if(isset($employees)) {



            return response()->json(['employees' => $employees]);



        }

        



    }







    public function seller_add_employees(Request $request) {



        $validated = $request->validate([

            'name'          => 'required',

            'phone'         => 'required',

            'position'      => 'required',

            'email'         => 'email',

            'branch_id'     => 'required'



        ]);



        $employees = new employees;



        $employees->name = $request->name;



        $employees->phone = $request->phone;



        $employees->position = $request->position;



        $employees->email = $request->email;



        $employees->parent_id = auth('seller')->id();



        $employees->branch_id = $request->branch_id;



        $employees->save();



        return response()->json('Employees Add successfully');



    }







    public function seller_edit_employees($id) {



        $seller = auth('seller')->id();

        $employees = employees::find($id);

        $branche = DB::table('branche')->where('user_id', '=', $seller)->get();

        return view('seller-views.settings.partial.employees_edit', compact('employees','branche'));

     

        

    }







    public function seller_update_employees(Request $request) {



        $validated = $request->validate([

            'name'          => 'required',

            'phone'         => 'required',

            'position'      => 'required',

            'email'         => 'email',



        ]);



        $myId = $request->myId; 



        employees::where('id', '=', $myId)->update([



            'name' => $request->name,

            'phone' => $request->phone,

            'position' => $request->position,

            'branch_id' => $request->branch_id,

            'email' => $request->email



        ]);





        return response()->json('Employees Update successfully');



    }





    public function seller_delete_employees(Request $request) {



        $myId = $request->myId; 



        employees::where('id', '=', $myId)->delete();



        return redirect()->back();



    }





    public function seller_branch_alert_select(Request $request) {





        $branch_id = $request->branch_id;



        $check = DB::table('branche')->where('id', '=', $branch_id)->first();



        return response()->json(['check' => $check]);



    }





    public function seller_branch_automatic_orders_unactive(Request $request) {



        $branch_id = $request->branch_id;



        $check = DB::table('branche')->where('id', '=', $branch_id)->update([

            

            'default_delivery' => null



        ]);



        return response()->json(['check' => $check]);



    

    }



    

}

