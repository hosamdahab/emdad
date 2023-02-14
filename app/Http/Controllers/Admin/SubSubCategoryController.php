<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Model\sub_sub_category;

class SubSubCategoryController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $categories = Category::where(['position'=>2])->where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $categories = sub_sub_category::latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        }
        $categories = sub_sub_category::latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.category.sub-sub-category-view',compact('categories','search'));
    }


    public function add() {

        return view('admin-views.category.add_sub_sub_category');

    }

    public function store(Request $request)
    {
        $request->validate([
            'name'              => 'required',
            'category_id'       => 'required',
            'sub_category_id'   => 'required',
            
        ], [
            'name.required' => 'Category name is required!',
            'parent_id.required' => 'Sub Category field is required!',
        ]);


        

        $category = new sub_sub_category;
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        $category->category_id = $request->category_id;
        $category->sub_category_id = $request->sub_category_id;
        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('sub_sub_category'), $imageName);

            $category->icon = $imageName;

        }

        $category->save();
        
        Toastr::success('Sub Sub Category updated successfully!');
        return back();
    }

    public function edit($id)
    {

        $sub_categories = sub_sub_category::find($id);
        return view('admin-views.category.sub_sub_category_edit', compact('sub_categories'));

    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'category_id' => 'required',
            'sub_category_id' => 'required',
        ], [
            'name.required' => 'Category name is required!',
          
        ]);
        
        $category = sub_sub_category::where('id', '=', $request->myId)->first();

        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        $category->category_id = $request->category_id;
        $category->sub_category_id = $request->sub_category_id;

        if ($request->image) {

            $imageName = time().'.'.$request->image->extension();  
         
            $request->image->move(public_path('sub_sub_category'), $imageName);

            $category->icon = $imageName;


            $path = 'public/sub_sub_category/'.$request->old_icon;

            if(file_exists($path)) {

                unlink($path);

            }

            

        }
        $category->save();
        return response()->json();
    }


    public function delete(Request $request)
    {
        
        $getId = sub_sub_category::where('id', '=', $request->myId)->first();

        if(isset($getId->icon)) {

            if(file_exists(public_path('sub_sub_category/').$getId->icon)) {

                unlink(public_path('sub_sub_category/').$getId->icon);
        
                }

                

        }

        sub_sub_category::where('id', '=', $request->myId)->delete();

        Toastr::success('Sub Sub Category Deleted successfully!');
        return back();

    }


    public function fetch(Request $request){
        if($request->ajax())
        {
            $data = Category::where('position',2)->orderBy('id','desc')->get();
            return response()->json($data);
        }
    }

    public function getSubCategory(Request $request)
    {
        $data = Category::where("parent_id",$request->id)->get();
        $output="";
        foreach($data as $row)
        {
            $output .= '<option value="'.$row->id.'">'.$row->name.'</option>';
        }
        echo $output;
    }

    public function getCategoryId(Request $request)
    {
        $data= Category::where('id',$request->id)->first();
        return response()->json($data);
    }
}
