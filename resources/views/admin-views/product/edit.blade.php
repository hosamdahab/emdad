@extends('layouts.back-end.app')

@section('title', 'تعديل المنتج')

@push('css_or_js')
    <link href="{{asset('public/assets/back-end/css/tags-input.min.css')}}" rel="stylesheet">
    <link href="{{ asset('public/assets/select2/css/select2.min.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <!-- Page Heading -->
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page"><a
                        href="{{route('admin.product.list', ['in_house', ''])}}">{{\App\CPU\translate('Product')}}</a></li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Edit')}}</li>
            </ol>
        </nav>

      <!-- Content Row -->
      <div class="row">
            <div class="col-md-12">
                <form class="product-form" action="{{route('admin.products.update')}}" method="POST"
                      enctype="multipart/form-data"
                      id="admin_update_product_form">
                    @csrf
                   
                     <input type="hidden" name="myId" id="myId" value="{{$product->id}}">
                    <div class="card mt-2 col-12 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('General Info')}}</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">

                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Product Name')}}</label>
                                       <input type="text" class="form-control" value="{{$product->name}}" name="name" placeholder="{{\App\CPU\translate('Product Name')}}">
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('brand')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="brand_id" id="brand_id_edit">
                                            <option value="{{old('brand_id')}}" selected disabled>---Select---</option>
                                            @foreach($br as $b)
                                                <option {{ $product->brand_id == $b->id ? 'selected' : NULL }} value="{{$b->id}}" class="{{$b->category_id}}">
                                                    {{$b->name}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    
                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="category_id" id="category_id_edit">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                            @foreach($cat as $c)
                                                <option {{ $product->category_ids == $c->id ? 'selected' : NULL }} value="{{$c->id}}">
                                                    {{$c['name']}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                  

                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Unit')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="unit">
                                            @foreach(\App\CPU\Helpers::units() as $x)
                                                <option {{ $product->unit == $x ? 'selected' : NULL }}
                                                    value="{{$x}}" {{old('unit')==$x? 'selected':''}}>{{$x}}</option>
                                            @endforeach
                                        </select>
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{__('messages.quantity_in_unit')}}</label>
                                        <input type="number" name="unit_number" min="0" step="0.01"
                                               placeholder="{{__('messages.quantity_in_unit')}}"
                                               name="unit_numbers" value="{{$product->unit_numbers}}" class="form-control"
                                               >
                                    </div>

                                    <div class="col-md-4">
                                        <label for="name">{{__('messages.quantity_in_carton')}}</label>
                                        <input type="number" name="carton_unit" min="0" step="0.01"
                                               placeholder="{{__('messages.quantity_in_carton')}}"
                                               name="carton_unit" value="{{$product->carton_unit}}" class="form-control"
                                               >
                                    </div>


                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-md-4">
                                        <label for="name">{{__('messages.product_type')}}</label>
                                       <input type="text" value="{{$product->product_type}}" class="form-control" name="product_type" placeholder="{{__('messages.product_type')}}">
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('sub_category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="sub_category_id" id="edit_sub_category_id">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                           
                                            @foreach(\App\Model\subsCategory::all() as $c)
                                                <option {{ $product->sub_category_id == $c->id ? 'selected' : NULL }} value="{{$c->id}}" class="{{$c->id}}">
                                                    {{$c->name}}
                                                </option>
                                            @endforeach
                                           
                                        </select>
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Sub Sub Category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="sub_sub_category_id" id="edit_sub_sub_category_id">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                           
                                            @foreach(\App\Model\sub_sub_category::all() as $c)
                                                <option {{ $product->sub_sub_category_id == $c->id ? 'selected' : NULL }} value="{{$c->id}}">
                                                    {{$c->name}}
                                                </option>
                                            @endforeach
                                           
                                        </select>
                                    </div>

                                    
                                    <div class="col-md-4 mb-4">
                                        <label for="name">{{__('messages.Branch')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="branche_id"
                                            onchange="getRequest('{{url('/')}}/admin/product/get-categories?parent_id='+this.value,'sub-category-select','select')">
                                            <option value="{{old('branche_id')}}" selected disabled>---Select---</option>
                                            @foreach($Branche as $b)
                                                <option {{ $product->branche_id == $b->id ? 'selected' : NULL }} value="{{$b->id}}">
                                                    {{$b->branche_name}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>


                                    <div class="col-md-4 mb-4">
                                        <label for="name">{{\App\CPU\translate('seller')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="seller_id"
                                            onchange="getRequest('{{url('/')}}/admin/product/get-categories?parent_id='+this.value,'sub-category-select','select')">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                            @foreach($seller as $s)
                                                <option {{ $product->child_seller_id == $s->id ? 'selected' : NULL }} value="{{$s->id}}">
                                                    {{$s->f_name}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                 

                    <div class="card mt-2 col-12 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('Product price & stock')}}</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">{{\App\CPU\translate('Unit price')}}</label>
                                        <input type="number" min="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Unit price')}}"
                                               name="unit_price" value="{{$product->unit_price}}"  class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label
                                            class="control-label">{{\App\CPU\translate('Purchase price')}}</label>
                                        <input type="number" min="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Purchase price')}}"
                                               name="purchase_price" value="{{$product->purchase_price}}" class="form-control">
                                    </div>
                                </div>
                                <div class="row pt-4">

                                    <div class="col-md-6">
                                        <label class="control-label">{{\App\CPU\translate('Tax')}}</label>
                                        <label class="badge badge-info">{{\App\CPU\translate('Percent')}} ( % )</label>
                                        <input type="number" min="0" step="0.01"
                                                name="tax"
                                               value="{{$product->tax}}"
                                               class="form-control">
                                        <input name="tax_type" value="percent" style="display: none">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="control-label">{{\App\CPU\translate('Discount')}}</label>
                                        <label class="badge badge-info">{{\App\CPU\translate('Percent')}} ( % )</label>
                                        <input type="number" min="0" value="{{$product->discount}}" step="0.01"
                                               placeholder="{{\App\CPU\translate('Discount')}}" name="discount"
                                               class="form-control">
                                    </div>
                                    
                                </div>
                                    
                                <div class="row pt-4">
                                  
                                    <div class="col-sm-6 col-md-6 col-lg-6" id="quantity">
                                        <label
                                            class="control-label">{{__('messages.quantity_in_store')}}</label>
                                        <input type="number" name="current_stock" min="0" step="1"
                                               placeholder="{{__('messages.quantity_in_store')}}"
                                               name="current_stock" value="{{$product->current_stock}}" class="form-control" required>
                                    </div>

                                    <div class="col-sm-6 col-md-6 col-lg-6" id="shipping_cost">
                                        <label
                                            class="control-label">{{\App\CPU\translate('shipping_cost')}} </label>
                                        <input type="number" name="shipping_cost" min="0" value="{{$product->shipping_cost}}" step="1"
                                               placeholder="{{\App\CPU\translate('shipping_cost')}}"
                                               name="shipping_cost" class="form-control" required>
                                    </div>

                                    
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="card col-12 mt-2 rest-part">
                        <div class="card-body">
                            <div class="row">


                            <div class="col-md-12 mb-4 d-flex justify-content-around">
                                <section>
                                    <img id="product_thumbnail_view" src="{{asset('product/thumbnail/'.$product->thumbnail)}}" draggable="false" width="300px">
                                    <p style="text-align:center;font-weight:700">{{\App\CPU\translate('Upload thumbnail')}}</p>
                                </section>

                                <section>
                                    <img id="product_image_view" src="{{asset('product/'.$product->images)}}" draggable="false" width="300px">
                                    <p style="text-align:center;font-weight:700">{{__('messages.product_img')}}</p>
                                </section>
                            </div>

                    

                                <div class="col-md-12 mb-4">
                                    <label class="control-label">{{\App\CPU\translate('Youtube video link')}}</label>
                                    <small class="badge badge-soft-danger"> ( {{\App\CPU\translate('optional, please provide embed link not direct link')}}. )</small>
                                    <input type="text" value="{{$product->video_link}}" name="video_link" placeholder="{{\App\CPU\translate('EX')}} : https://www.youtube.com/embed/5R06LRdUCSE" class="form-control">
                                </div>

                                <div class="col-md-12 mb-4">
                                    <label>{{\App\CPU\translate('Upload product images')}}</label><small style="color: red">*
                                        ( {{\App\CPU\translate('ratio')}} 1:1 )</small>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" id="product_image" name="product_image"
                                               class="custom-file-input"
                                               accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*"
                                               >
                                        <label class="custom-file-label"
                                               for="customFileEg1">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>
                                </div>

                                

                                <div class="col-md-12">
                                    <label>{{\App\CPU\translate('Upload thumbnail')}}</label><small style="color: red">*
                                        ( {{\App\CPU\translate('ratio')}} 1:1 )</small>
                                    <div class="custom-file" style="text-align: left">
                                        <input id="product_thumbnail" type="file" name="product_thumbnail"
                                               class="custom-file-input"
                                               accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*"
                                               >
                                        <label class="custom-file-label"
                                               for="customFileEg1">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>
                                </div>

                                
                                <input type="hidden" name="old_img" value="{{'product/'.$product->images}}">
                                <input type="hidden" name="old_thumbnail" value="{{'product/thumbnail/'.$product->thumbnail}}">


                               
                            </div>
                        </div>
                    </div>
                  

                 
                    <button type="submit mt-4" class="btn btn-primary float-right" style="margin-top:20px">{{\App\CPU\translate('Submit')}}</button>
                    
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
    <script src="{{asset('public/assets/back-end')}}/js/tags-input.min.js"></script>
    <script src="{{asset('public/assets/back-end/js/spartan-multi-image-picker.js')}}"></script>

     <script>
        $(document).ready(function(){


            $('#product_thumbnail').change(function(){    
                let reader = new FileReader();
        
                reader.onload = (e) => { 
                    $('#product_thumbnail_view').attr('src', e.target.result); 
                }   
        
                reader.readAsDataURL(this.files[0]); 
            
            });



            $('#product_image').change(function(){    
                let reader = new FileReader();
        
                reader.onload = (e) => { 
                    $('#product_image_view').attr('src', e.target.result); 
                }   
        
                reader.readAsDataURL(this.files[0]); 
            
            });


            $('#admin_update_product_form').submit(function(e){

                e.preventDefault();
                let formData = new FormData(this);

                let myId = $('#myId').attr('value');

                $.ajax({
                        type:'POST',
                        url: "{{route('admin.products.update')}}",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: (response) => {
                            if (response) {
                                this.reset();
                                Swal.fire(
                                    'تم تعديل المنتج',
                                    )
                                    window.location.href = '/admin/product/list/seller'
                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });

                // console.log(myId);
            })



            $('#brand_id_edit').on('change',function(){

                let brand_id = $('#brand_id_edit option:selected').attr('class');

                $.ajax({
                        type:'GET',
                        url: '/admin/products/get_brand_category/'+ brand_id +'',
                        dataType: 'json',
                        success: (response) => {
                            if (response) {
                            //   console.log(response);

                            $('#category_id_edit').append().empty();
                            $('#category_id_edit').append('<option value="' + response.category.id +'">' + response.category.name +'</option>');

                            $('#edit_sub_category_id').append().empty();

                            $('#edit_sub_category_id').append('<option value="{{old('category_id')}}" selected disabled>---Select---</option>');
                            
                            $.each(response.sub_category,function(index,value){

                                $('#edit_sub_category_id').append('<option value="' + value.id +'">'+ value.name +'</option>');
                                
                            });


                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });



                // console.log(brand_id);

            });



            $('#edit_sub_category_id').on('change',function(){

                let sub_cate_id = $('#edit_sub_category_id').val();


                $.ajax({
                        type:'GET',
                        url: '/admin/products/get_sub_category/'+ sub_cate_id +'',
                        dataType: 'json',
                        success: (response) => {
                            if (response) {
                            //   console.log(response);

                            $('#edit_sub_sub_category_id').append().empty();

                            $('#edit_sub_sub_category_id').append('<option value="{{old('category_id')}}" selected disabled>---Select---</option>');
                            
                            $.each(response.sub_sub_category,function(index,value){

                                $('#edit_sub_sub_category_id').append('<option value="' + value.id +'">'+ value.name +'</option>');
                                
                            });

                            // console.log(response);

                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }

                });

                // console.log(sub_cate_id);

            });

        });
     </script> 
    {{--ck editor--}}
    <script src="{{asset('/')}}vendor/ckeditor/ckeditor/ckeditor.js"></script>
    <script src="{{asset('/')}}vendor/ckeditor/ckeditor/adapters/jquery.js"></script>
    <script>
        $('.textarea').ckeditor({
            contentsLangDirection : '{{Session::get('direction')}}',
        });
    </script>
    {{--ck editor--}}
@endpush
