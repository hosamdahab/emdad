<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Model\subsCategory;

class SubCategoryController extends Controller
{
    public function index( Request $request )
    {
        $query_param = [];
        $search = $request['search'];
        if($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $categories = subsCategory::where(['position'=>1])->where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $categories=subsCategory::where(['position'=>1]);
        }
        $categories = subsCategory::latest()->paginate(10);
        return view('admin-views.category.sub-category-view',compact('categories','search'));
    }

    public function store(Request $request)
    {

        $request->validate([
            'name' => 'required|unique:subCategory|max:255',
            'image' => 'required',
        ]);

        $category = new subCategory;
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        $category->parent_id = $request->parent_id;
        $category->position = 1;
        $category->home_status = 1;
        $category->priority = $request->priority;
        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('sub_category'), $imageName);

        }

        $category->icon = $imageName;

        $category->save();

      
        Toastr::success('Sub Category Added successfully!');
        return back();
    }

    public function edit($id)
    {
        $sub_categories = subCategory::find($id);

        return view('admin-views.category.sub_category_edit',compact('sub_categories'));
    }

    public function update(Request $request)
    {
        $category = Category::find($request->id);
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        $category->parent_id = $request->parent_id;
        $category->position = 1;
        $category->priority = $request->priority;
        $category->save();
        return response()->json();
    }

    public function delete(Request $request)
    {
        $categories = Category::where('parent_id', $request->id)->get();
        if (!empty($categories)) {

            foreach ($categories as $category) {
                $translation = Translation::where('translationable_type','App\Model\Category')
                                    ->where('translationable_id',$category->id);
                $translation->delete();
                Category::destroy($category->id);
            }
        }
        $translation = Translation::where('translationable_type','App\Model\Category')
                                    ->where('translationable_id',$request->id);
        $translation->delete();
        Category::destroy($request->id);
        return response()->json();
    }

    public function fetch(Request $request)
    {
        if ($request->ajax()) {
            $data = Category::where('position', 1)->orderBy('id', 'desc')->get();
            return response()->json($data);
        }
    }


    public function admin_sub_category_add() {

        return view('admin-views.category.add_sub_category');
        
    }


    public function admin_sub_category_store(Request $request)
    {

        $request->validate([
            'name' => 'required|unique:subs_categories|max:255',
            'image' => 'required',
        ]);

        $sub_category = new subsCategory;
        $sub_category->name = $request->name;
        $sub_category->slug = Str::slug($request->name);
        $sub_category->parent_id = $request->parent_id;
        $sub_category->position = 1;
        $sub_category->priority = $request->priority;
        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('sub_category'), $imageName);

            $sub_category->icon = $imageName;
        }

       

        $sub_category->save();

      
        Toastr::success('Sub Category Added successfully!');
        return back();
    }

    public function admin_sub_category_edit($id) {

        $sub_categories = subsCategory::find($id);

        return view('admin-views.category.sub_category_edit',compact('sub_categories'));

    }


    public function admin_sub_category_update(Request $request) {

        $myId = $request->myId;

        $sub_categories = subsCategory::where('id', '=', $myId)->first();

        $sub_categories->name = $request->name;

        $sub_categories->slug =  Str::slug($request->name);

        $sub_categories->parent_id = $request->parent_id;
        

        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('sub_category'), $imageName);

            $sub_categories->icon = $imageName;


            $path = 'public/sub_category/'.$request->oldImage;

            if(file_exists($path)) {

                unlink($path);

            }

            

        }

        $sub_categories->save();

        return response()->json('Sub Category Updated successfully');

    }


    public function admin_sub_category_delete(Request $request) {

      
        $getId = subsCategory::where('id', '=', $request->myId)->first();

            if(isset($getId->icon)) {

                if(file_exists(public_path('sub_category/').$getId->icon)) {

                    unlink(public_path('sub_category/').$getId->icon);
            
                    }
    
                    

            }

            subsCategory::where('id', '=', $request->myId)->delete();

        Toastr::success('Sub Category Deleted successfully!');
        return back();

    }
}
