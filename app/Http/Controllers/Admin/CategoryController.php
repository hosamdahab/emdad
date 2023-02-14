<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Translation;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Brian2694\Toastr\Facades\Toastr;
use DB;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $categories = Category::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            
            $categories = Category::latest()->paginate(Helpers::pagination_limit())->appends($query_param);

        }

        $categories = Category::latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.category.view', compact('categories','search'));
    }


    public function add_new_category() {

        return view('admin-views.category.add-new');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'image' => 'required',
        ], [
            'name.required' => 'Category name is required!',
            'image.required' => 'Category image is required!',
        ]);

        $imageName = time().'.'.$request->image->extension();  
         
        $request->image->move(public_path('category'), $imageName);

        $category = new Category;
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);;
        $category->icon = $imageName;
        $category->save();

       
        Toastr::success('Category added successfully!');
        return redirect()->route('admin.category.view');
    }

    public function edit(Request $request, $id)
    {
        $category = category::withoutGlobalScopes()->find($id);
        return view('admin-views.category.category-edit', compact('category'));
    }

    public function update(Request $request,$id)
    {
        $category = Category::find($id);
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        
        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('sub_category'), $imageName);
            $category->icon = $imageName;

            unlink($request->old_img);
         }


        $category->priority = $request->priority;
        $category->save();

     

        Toastr::success('Category updated successfully!');
        return back();
    }
    

    public function delete(Request $request)
    {
        $categories = Category::where('parent_id', $request->id)->get();
        if (!empty($categories)) {
            foreach ($categories as $category) {
                $categories1 = Category::where('parent_id', $category->id)->get();
                if (!empty($categories1)) {
                    foreach ($categories1 as $category1) {
                        $translation = Translation::where('translationable_type','App\Model\Category')
                                    ->where('translationable_id',$category1->id);
                        $translation->delete();
                        Category::destroy($category1->id);

                    }
                }
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
            $data = Category::where('position', 0)->orderBy('id', 'desc')->get();
            return response()->json($data);
        }
    }

    public function status(Request $request)
    {
        $category = Category::find($request->id);
        $category->home_status = $request->home_status;
        $category->save();
        // Toastr::success('Service status updated!');
        // return back();
        return response()->json([
            'success' => 1,
        ], 200);
    }



    public function category_update(Request $request) {

        $categoryId = $request->categoryId;
        $category = Category::where('id', '=', $request->categoryId)->first();
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);;
        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('category'), $imageName);

            $category->icon = $imageName;

            if(file_exists($request->old_icon)) {

            unlink($request->old_icon); 

            }

        }

        $category->save();

        Toastr::success('Category updated successfully!');
        return back();

    }


    public function category_delete(Request $request) {


       

        $getId = Category::where('id', '=', $request->myId)->first();

            if(isset($getId->icon)) {

                if(file_exists(public_path('category/').$getId->icon)) {

                    unlink(public_path('category/').$getId->icon);
            
                    }
    
                    

            }

            $getId->delete();
            
        Toastr::success('Category Deleted successfully!');
        return back();

    }


   
}
