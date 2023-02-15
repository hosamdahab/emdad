<div class="modal fade example-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row">
                <div class="col-12 p-3">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <form action="{{ route('seller.product.RequestProModel') }}" id="image-upload" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group pt-3">
                                       
                                    @php 

                                        $get_brand = \App\Model\Brand::where('id', '=', auth('seller')->id())->get();

                                        // $branches = DB::table('branche')->where('user_id', '=', auth('seller')->id())->get();

                                    @endphp


                                        {{-- <select name="branche_id" class="form-control rounded-pill" class="form-control">
                                            @foreach ($branches as $branche)
                                                <option value="{{ $branche->id }}">{{ $branche->branche_name }}</option>
                                            @endforeach
                                        </select> --}}

                                        @isset($get_brand->id)
                                        <select name="brand_id" id="" class="form-control">
                                            <option selected>{{__('messages.brand')}}</option>
                                            @foreach($get_brand as $val)
                                            <option value="{{$val->id}}">{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                        @endisset

                                        @empty($get_brand->id)

                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="brand_id" class="form-control rounded-pill"
                                                placeholder="العلامة التجارية">
                                        </div>

                                        @endempty


                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="product_name" class="form-control rounded-pill"
                                                placeholder="اسم المنتج">
                                        </div>

                                       

                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="product_type" class="form-control rounded-pill"
                                                placeholder="نوع المنتج">
                                        </div>


                                      

                                        <div class="pt-3" style="width: 100%">
                                            <select class="form-control rounded-pill" name="sub_sub_category_id" id="getSubSubCat" aria-label="Default select example">
                                                <option selected>القسم</option>
                                                @php 
                                                $sub_sub_category =  App\Model\sub_sub_category::all()
                                                @endphp

                                                @foreach($sub_sub_category as $val)
                                                <option value="{{$val->id}}">{{$val->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>


                                        <div class="pt-3" style="width: 100%">
                                            <select class="form-control rounded-pill" name="product_size">
                                                <option selected>وحدة المنتج</option>
                                                
                                                    <option value="غرام">غرام</option>
                                                    <option value="كيلو">كيلو</option>
                                                    <option value="ملي">ملي</option>
                                                    <option value="لتر">لتر</option>
                                                
                                            </select>
                                        </div>
                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="qty_in_unit" class="form-control rounded-pill"
                                                placeholder="الكمية فى كل وحدة">
                                        </div>

                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="qty_in_carton" class="form-control rounded-pill"
                                                placeholder="الكمية في كل كرتونة">
                                        </div>

                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="product_price" onkeyup="enableDiscount()" id="add_product_price" class="form-control rounded-pill"
                                                placeholder="سعر المنتج">
                                        </div>
                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="purchase_price" readonly id="purchase_price" class="form-control rounded-pill"
                                                placeholder="سعر الشراء">
                                                <span class="text-danger" id="price_error"></span>
                                        </div>

                                        {{-- <div class="pt-3" style="width: 100%">
                                            <input type="nubmer" onkeyup="calcDiscount()" readonly name="discount" id="discount" class="form-control rounded-pill"
                                                placeholder="الخصم">
                                                <span class="text-danger" id="price_error"></span>
                                        </div> --}}

                                        <div class="pt-3" style="width: 100%">
                                            <input type="text" name="qty_in_stock" class="form-control rounded-pill"
                                                placeholder="الكمية المتواجدة بالمستودع">
                                        </div>




                                        <div  class="p-2 border border-dashed mx-auto d-block mt-3"  style="width: 150px;max-width:430px;">
                                        <input type="file" name="image" class="form-control rounded-pill" multiple>
                                        </div>

                                        <span class="text-danger" id="image-input-error"></span>
                                    </div>
                                    <button type="submit" class="btn btn-primary rounded-pill"
                                        style="width: 100%;background: #645cb3;border:none">{{__('messages.send_re_add_product')}}</button>
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
