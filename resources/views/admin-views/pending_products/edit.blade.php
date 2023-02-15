<div class="modal fade example-modal{{$order->id}}" id="exampleModal{{$order->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row">
                <div class="col-12 p-3">
                    <div class="card">
                        <div class="card-body">
                            <div>
    <form  action="{{route('admin.product.RequestProSave', ['id' =>$order->id])}}" method="post" id="adminPendingProEdit" enctype="multipart/form-data">
    @csrf
    <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>{{__('messages.brand')}}</strong></label>

        @php 

        $get_brands = \App\Model\Brand::all();

        $get_branche = DB::table('branche')->where('id', '=', $order->branche_id)->first()
        
        @endphp 
        

      <select name="brand_id" id="" class="form-control">
      <option selected>{{__('messages.brand')}}</option>
        @foreach($get_brands as $val)
        <option value="{{$val->id}}">{{$val->name}}</option>
        @endforeach
      </select>
    </div>

    {{-- @isset($get_branche)
    <div class="pt-3" style="width: 100%">
        <label for="inputPassword4" class="form-label"><strong>الفرع</strong> </label>
        <input type="text" name="branche_id" value="{{$get_branche->id}}" class="form-control" id="inputPassword4">
    </div>
    @endisset --}}

    {{-- <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>{{__('messages.category')}}</strong></label>

        @php 

        $get_brands = \App\Model\Category::all();

        @endphp 

      <select name="category_id" id="" class="form-control">
      <option selected>{{__('messages.category')}}</option>
        @foreach($get_brands as $val)
        <option value="{{$val->id}}">{{$val->name}}</option>
        @endforeach
      </select>
    </div> --}}


    {{-- <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>{{__('messages.sub_category')}}</strong></label>

        @php 

        $get_brands = \App\Model\subsCategory::all();

        @endphp 

      <select name="sub_category_id" id="" class="form-control">
      <option selected>{{__('messages.sub_category')}}</option>
        @foreach($get_brands as $val)
        <option value="{{$val->id}}">{{$val->name}}</option>
        @endforeach
      </select>
    </div> --}}


    <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>{{__('messages.sub_sub_category')}}</strong></label>

        @php 

        $sub_sub_category = \App\Model\sub_sub_category::all();

        @endphp 

      <select name="sub_sub_category_id" id="" class="form-control">
      <option selected>{{__('messages.sub_sub_category')}}</option>
        @foreach($sub_sub_category as $val)
        <option {{ $order->sub_sub_category_id == $val->id ? 'selected' : ''}} value="{{$val->id}}">{{$val->name}}</option>
        @endforeach
      </select>
    </div>

    <div class="pt-3" style="width: 100%">
        <label for="inputPassword4" class="form-label"><strong>اسم المنتج</strong> </label>
        <input type="text" name="product_name" value="{{$order->product_name}}" class="form-control" id="inputPassword4">
    </div>


    <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>نوع المنتج</strong> </label>
        <input type="text" name="product_type" value="{{$order->product_type}}" class="form-control" id="inputEmail4">
    </div>
    
    <div class="pt-3" style="width: 100%">
        <label for="inputPassword4" class="form-label"><strong>وحدة المنتج</strong> </label>
            <select class="form-control rounded-pill" name="product_size">
                
                <option value="غرام">غرام</option>
                <option value="كيلو">كيلو</option>
                <option value="ملي">ملي</option>
                <option value="لتر">لتر</option>
            </select>
    </div>
   

    <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>الكمية في كل وحدة </strong></label>
        <input type="text" name="qty_in_unit" value="{{$order->qty_in_unit}}" class="form-control" id="inputEmail4">
    </div>


    <div class="pt-3" style="width: 100%">
        <label for="inputPassword4" class="form-label"><strong>الكمية في كل كرتونة </strong></label>
        <input type="text" name="qty_in_carton" value="{{$order->carton_unit}}" class="form-control" id="inputPassword4">
    </div>


    <div class="pt-3" style="width: 100%">
        <label for="inputEmail4" class="form-label"><strong>سعر المنتج </strong></label>
        <input type="text" name="product_price" value="{{$order->product_price}}" class="form-control" id="inputEmail4">
    </div>


    
    <div class="pt-3" style="width: 100%">
        <label for="inputPassword4" class="form-label"><strong>سعر الشراء </strong></label>
        <input type="text" name="purchase_price" value="{{$order->purchase_price}}" class="form-control" id="inputPassword4">
    </div>


    <div class="pt-3" style="width: 100%">
        <label for="inputPassword4" class="form-label"><strong>الكمية في المستودع </strong></label>
        <input type="text" name="qty_in_stock" value="{{$order->qty_in_stock}}" class="form-control" id="inputPassword4">
    </div>
   

    <div class="pt-3" style="width: 100%">
        <label for="exampleInputPassword1" class="form-label"><strong>صورة المنتج </strong></label>
        <input type="file" name="image" class="form-control" id="exampleInputPassword1">
    </div>

    <input type="hidden" id="myId"  value="{{$order->id}}">
    <input type="hidden" id="selerId" name="selerId" value="{{$order->seller_id}}">
    <input type="hidden" id="oldImage" name="oldImage" value="{{$order->product_image}}">

    <div class="col-12">
        <button type="submit" class="btn btn-primary">تفعيل</button>
    </div>
    
    </form>

    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
