<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Brand;
use Carbon\Carbon;
use App\Model\Category;
use App\CPU\ImageManager;
use Brian2694\Toastr\Facades\Toastr;
use File;


class BrandsController extends Controller
{
    
    public function admin_brands_store(Request $request) {


        $imageName = time().'.'.$request->imagebrand->extension();  
         
        $request->imagebrand->move(public_path('brand'), $imageName);

        $brand = new Brand;
        $brand->name = $request->brand;
        $brand->image = $imageName;
        $brand->status = 1;
        $brand->category_id = $request->category_id;
        $brand->save();


        Toastr::success('Brand added successfully!');
        return back();

    }



    public function admin_brands_edit($id) {

        $b = Brand::find($id);

        return view('admin-views.brand.edit', compact('b'));
       
    }


    public function admin_brand_updated(Request $request) {

        $myId = $request->brand_id;

        $brand = Brand::where('id', '=', $myId)->first();
        $brand->name = $request->name;

        if($request->category_id) {

            $brand->category_id = $request->category_id;

        }
       
        if ($request->editBrandImg) {

            $imageName = time().'.'.$request->editBrandImg->extension();  
            $request->editBrandImg->move(public_path('brand'), $imageName);
            $brand->image = $imageName;

            unlink($request->old_img);
         }

        $brand->save();
       

        Toastr::success('Brand updated successfully!');
        return back();

    }



    public function admin_brands_delete(Request $request) {

        // $myId = $request->myId;
        // $getId = Brand::where('id', '=', $myId)->first();

        // if(file_exists(public_path('brand/').$getId->image)) {


        //     unlink(public_path('brand/').$getId->image);
        // }
       

        // Brand::find($myId)->delete();
        $row=Brand::find($request->myId);
         if(file_exists(public_path('brand/').$row->image)) {


            File::delete(public_path('brand/').$row->image);
        }
        $row->delete();
        Toastr::success('Brand Deleted successfully!');
        return back();
    }
}
