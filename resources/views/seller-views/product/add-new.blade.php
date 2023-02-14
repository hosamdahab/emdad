@extends('layouts.back-end.app-seller')

@push('css_or_js')
    <link href="{{asset('public/assets/back-end/css/tags-input.min.css')}}" rel="stylesheet">
    <link href="{{ asset('public/assets/select2/css/select2.min.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('seller.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a></li>
                <li class="breadcrumb-item" aria-current="page"><a href="{{route('seller.product.list')}}">{{\App\CPU\translate('Product')}}</a></li>
                <li class="breadcrumb-item">{{\App\CPU\translate('Add_new')}}</li>
            </ol>
        </nav>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div style="display:flex;justify-content:space-between" >
                            <div class="col-6">


                           
                        <form action="{{route('get.seller.product')}}" method="get" class="col-12">
                            @csrf
                            <div class="form-group">
                                <input type="text" class="form-control" name="search_product" id="search_product" placeholder="{{\App\CPU\translate('Search Product')}}">
                            </div>
                        </form>

                        </div>

                        <div class="col-6" style="text-align:left">
                            <button class="btn btn-primary" data-toggle="modal" data-target=".example-modal">{{\App\CPU\translate('Add new product')}}</button>
                        </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card" id="searchresult">
                   <div class="card-body" >
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <th>{{\App\CPU\translate('Product Image')}}</th>
                                    <th>{{\App\CPU\translate('Product Name')}}</th>
                                    <th>{{\App\CPU\translate('Product Size')}}</th>
                                    <th>{{\App\CPU\translate('Product Add')}}</th>
                                    <th>{{\App\CPU\translate('Product Size')}}</th>
                                </thead>
                                <tbody>
                                    @foreach ($products as $product)

                                    @php($get_brand = DB::table('brands')->where('id', '=', $product->brand_id)->first())
                                    @php($get_sub = DB::table('subs_categories')->where('id', '=', $product->sub_category_id)->first())
                                    @php($sub_sub_categories = DB::table('sub_sub_categories')->where('id', '=', $product->sub_sub_category_id)->first())
                                    @php($category = DB::table('categories')->where('id', '=', $product->category_ids)->first())
                                        <tr>
                                            <td>
                                            <img src="{{asset('product/'.$product->images)}}" alt="" width="100" height="100">
                                            </td>
                                            
                                            @isset($product->name)
                                            <td>{{$get_brand->name}} @isset($sub_sub_categories->id) {{$sub_sub_categories->name}}  @endisset {{ $product->name }}</td>
                                            @endisset

                                            @empty($product->name)
                                                <td>{{$get_brand->name}} @isset($sub_sub_categories->id) {{$sub_sub_categories->name}}  @endisset {{$product->product_type}}</td>
                                            @endempty
                                            
                                            <td> {{ $product->unit }} {{$product->unit_numbers}} </td>
                                            <td>
                                                <button class="btn btn-primary" onclick="productView({{ $product->id }})" data-toggle="modal" data-target=".bd-example-modal-lg">{{\App\CPU\translate('Add')}}</button>
                                            </td>
                                            <td>
                                                <button class="btn btn-light" onclick="productSize({{ $product->id }})" data-toggle="modal" data-target=".bd-example-modal">{{\App\CPU\translate('Add Anather Size')}}</button>
                                            </td>
                                           
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div> 
                    </div>
                  <div class="card-footer">
                        {{$products->links()}}
                    </div>
                </div>
            </div>
        </div>

        @include('seller-views.product.partials.model-addPro')
        @include('seller-views.product.partials.model-changeSize')
        @include('seller-views.product.partials.model-request-new-product')


        <!-- Content Row -->
        {{-- <div class="row">
            <div class="col-md-12">

                <form class="product-form" action="{{route('seller.product.add-new')}}" method="post" enctype="multipart/form-data"
                      style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                      id="product_form">
                    @csrf
                    <div class="card">
                        <div class="card-header">
                            @php($language=\App\Model\BusinessSetting::where('type','pnc_language')->first())
                            @php($language = $language->value ?? null)
                            @php($default_lang = 'en')

                            @php($default_lang = json_decode($language)[0])
                            <ul class="nav nav-tabs mb-4">
                                @foreach(json_decode($language) as $lang)
                                    <li class="nav-item">
                                        <a class="nav-link lang_link {{$lang == $default_lang? 'active':''}}" href="#"
                                           id="{{$lang}}-link">{{\App\CPU\Helpers::get_language_name($lang).'('.strtoupper($lang).')'}}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>

                        <div class="card-body">
                            @foreach(json_decode($language) as $lang)
                                <div class="{{$lang != $default_lang ? 'd-none':''}} lang_form"
                                     id="{{$lang}}-form">
                                    <div class="form-group">
                                        <label class="input-label" for="{{$lang}}_name">{{\App\CPU\translate('name')}}
                                            ({{strtoupper($lang)}})</label>
                                        <input type="text" {{$lang == $default_lang? 'required':''}} name="name[]"
                                               id="{{$lang}}_name" class="form-control" placeholder="New Product" required>
                                    </div>
                                    <input type="hidden" name="lang[]" value="{{$lang}}">
                                    <div class="form-group pt-4">
                                        <label class="input-label"
                                               for="{{$lang}}_description">{{\App\CPU\translate('description')}}
                                            ({{strtoupper($lang)}})</label>
                                        <textarea name="description[]" class="editor textarea" cols="30"
                                                  rows="10" required>{{old('details')}}</textarea>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <div class="card mt-2 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('General_info')}}</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="name">{{\App\CPU\translate('Category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="category_id"
                                            onchange="getRequest('{{url('/')}}/seller/product/get-categories?parent_id='+this.value,'sub-category-select','select')"
                                            required>
                                            <option value="{{old('category_id')}}" selected disabled>---{{\App\CPU\translate('Select')}}---</option>
                                            @foreach($cat as $c)
                                                <option value="{{$c['id']}}" {{old('name')==$c['id']? 'selected': ''}}>
                                                    {{$c['name']}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name">{{\App\CPU\translate('Sub_category')}}</label>
                                        <select class="js-example-basic-multiple form-control"
                                                name="sub_category_id" id="sub-category-select"
                                                onchange="getRequest('{{url('/')}}/seller/product/get-categories?parent_id='+this.value,'sub-sub-category-select','select')">
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name">{{\App\CPU\translate('Sub_sub_category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="sub_sub_category_id" id="sub-sub-category-select">

                                        </select>
                                    </div>
                                     <div class="col-md-3">
                                        <label for="name">{{\App\CPU\translate('Brand')}}</label>
                                        <select
                                            class="js-example-basic-multiple js-states js-example-responsive form-control"
                                            name="brand_id" required>
                                            <option value="{{null}}" selected disabled>---{{\App\CPU\translate('Select')}}---</option>
                                            @foreach($br as $b)
                                                <option value="{{$b['id']}}">{{$b['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="card mt-2 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('Product_price_&_stock')}}</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label for="name">{{\App\CPU\translate('Unit')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="unit">
                                            @foreach(\App\CPU\Helpers::units() as $x)
                                                <option
                                                    value="{{$x}}" {{old('unit')==$x? 'selected':''}}>{{$x}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                     <div class="col-md-2">
                                        <label for="name">{{\App\CPU\translate('numbers')}}</label>
                                        <input type="number" min="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('numbers')}}"
                                               name="unit_numbers"  class="form-control"
                                               >
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label">{{\App\CPU\translate('Unit_price')}}</label>
                                        <input type="number" min="0" value="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Unit_price')}}"
                                               name="unit_price" value="{{old('unit_price')}}"  class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label
                                            class="control-label">{{\App\CPU\translate('Purchase_price')}}</label>
                                        <input type="number" min="0" value="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Purchase_price')}}"
                                               name="purchase_price" value="{{old('purchase_price')}}"  class="form-control" required>
                                    </div>
                                </div>

                                <div class="row pt-4">
                                    <div class="col-md-6">
                                        <label class="control-label">{{\App\CPU\translate('Tax')}}</label>
                                        <label class="badge badge-info">{{\App\CPU\translate('Percent')}} ( % )</label>
                                        <input type="number" min="0" value="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Tax')}}" name="tax" value="{{old('tax')}}"
                                               class="form-control">
                                        <input name="tax_type" value="percent" style="display: none">
                                    </div>

                                    <div class="col-md-2" >
                                        <label class="control-label">{{\App\CPU\translate('discount_type')}}</label>
                                        <select
                                            class="form-control js-select2-custom"
                                            name="discount_type">
                                            <option value="flat">{{\App\CPU\translate('Flat')}}</option>
                                            <option value="percent">{{\App\CPU\translate('Percent')}}</option>
                                        </select>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="control-label">{{\App\CPU\translate('Discount')}}</label>
                                        <input type="number" min="0" value="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Discount')}}" name="discount" value="{{old('discount')}}"
                                               class="form-control" required>
                                    </div>

                                </div>
                                <div class="row pt-4">
                                    <div class="col-sm-6 col-md-6 col-lg-4" id="quantity">
                                        <label class="control-label">{{\App\CPU\translate('total')}} {{\App\CPU\translate('Quantity')}}</label>
                                        <input type="number" min="0" value="0" step="1"
                                               placeholder="{{\App\CPU\translate('Quantity')}}"
                                               name="current_stock" value="{{old('current_stock')}}" class="form-control" required>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-4" id="shipping_cost">
                                        <label
                                            class="control-label">{{\App\CPU\translate('shipping_cost')}} </label>
                                        <input type="number" min="0" value="0" step="1"
                                               placeholder="{{\App\CPU\translate('shipping_cost')}}"
                                               name="shipping_cost" class="form-control" required>
                                    </div>
                                    <div class="col-md-6 col-lg-4 mt-sm-1" id="shipping_cost_multy">
                                        <div>
                                            <label
                                            class="control-label">{{\App\CPU\translate('shipping_cost_multiply_with_quantity')}} </label>

                                        </div>
                                        <div>
                                            <label class="switch">
                                                <input type="checkbox" name="multiplyQTY"
                                                       id="" >
                                                <span class="slider round"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>


                    <div class="card mt-2 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('Variations')}}</h4>
                        </div>
                        <div class="card-body">

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="colors">
                                            {{\App\CPU\translate('Colors')}} :
                                        </label>
                                        <label class="switch">
                                            <input type="checkbox" class="status" name="colors_active" value="{{old('colors_active')}}" >
                                            <span class="slider round"></span>
                                        </label>
                                        <select
                                            class="js-example-basic-multiple js-states js-example-responsive form-control color-var-select"
                                            name="colors[]" multiple="multiple" id="colors-selector" disabled>
                                            @foreach (\App\Model\Color::orderBy('name', 'asc')->get() as $key => $color)
                                                <option value="{{ $color->code }}">
                                                    {{$color['name']}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="attributes" style="padding-bottom: 3px">
                                            {{\App\CPU\translate('Attributes')}} :
                                        </label>
                                        <select
                                            class="js-example-basic-multiple js-states js-example-responsive form-control"
                                            name="choice_attributes[]" id="choice_attributes" multiple="multiple">
                                            @foreach (\App\Model\Attribute::orderBy('name', 'asc')->get() as $key => $a)
                                                <option value="{{ $a['id']}}">
                                                    {{$a['name']}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col-md-12 mt-2 mb-2">
                                        <div class="customer_choice_options" id="customer_choice_options">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="sku_combination" id="sku_combination">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="card mt-2 mb-2 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('seo_section')}}</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 mb-4">
                                    <label class="control-label">{{\App\CPU\translate('Meta_title')}}</label>
                                    <input type="text" name="meta_title" placeholder="" class="form-control">
                                </div>

                                <div class="col-md-8 mb-4">
                                    <label class="control-label">{{\App\CPU\translate('Meta_description')}}</label>
                                    <textarea rows="10" type="text" name="meta_description" class="form-control"></textarea>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group mb-0">
                                        <label>{{\App\CPU\translate('Meta_image')}}</label>
                                    </div>
                                    <div class="border border-dashed">
                                        <div class="row" id="meta_img"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mt-2 rest-part">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 mb-4">
                                    <label class="control-label">{{\App\CPU\translate('Youtube video link')}}</label>
                                    <small class="badge badge-soft-danger"> ( {{\App\CPU\translate('optional, please provide embed link not direct link')}}. )</small>
                                    <input type="text" name="video_link" placeholder="EX : https://www.youtube.com/embed/5R06LRdUCSE" class="form-control" required>
                                </div>

                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label>{{\App\CPU\translate('Upload_product_images')}}</label><small
                                            style="color: red">* ( {{\App\CPU\translate('ratio 1:1')}}  )</small>
                                    </div>
                                    <div  class="p-2 border border-dashed"  style="max-width:430px;">
                                        <div class="row" id="coba"></div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">{{\App\CPU\translate('Upload_thumbnail')}}</label><small
                                            style="color: red">* ( {{\App\CPU\translate('ratio 1:1')}} )</small>
                                    </div>
                                    <div style="max-width:200px;">
                                        <div class="row" id="thumbnail"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card ">
                        <div class="row">
                            <div class="col-md-12" style="padding-top: 20px">
                                <button type="button" onclick="check()" class="btn btn-primary">{{\App\CPU\translate('Submit')}}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div> --}}
    </div>
@endsection

@push('script')
    <script src="{{asset('public/assets/back-end')}}/js/tags-input.min.js"></script>
    <script src="{{ asset('public/assets/select2/js/select2.min.js')}}"></script>
    <script src="{{asset('public/assets/back-end/js/spartan-multi-image-picker.js')}}"></script>

    <script>
        $(function () {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'images[]',
                maxCount: 10,
                rowHeight: 'auto',
                groupClassName: 'col-6',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/back-end/img/400x400/img2.jpg')}}',
                    width: '100%',
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('Please only input png or jpg type file')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('File size too big')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });

            $("#thumbnail").spartanMultiImagePicker({
                fieldName: 'image',
                maxCount: 1,
                rowHeight: 'auto',
                groupClassName: 'col-12',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/back-end/img/file-upload.gif')}}',
                    width: '100%',
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('Please only input png or jpg type file')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('File size too big')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
            $("#thumbnail2").spartanMultiImagePicker({
                fieldName: 'image',
                maxCount: 1,
                rowHeight: 'auto',
                groupClassName: 'col-12',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/back-end/img/file-upload.gif')}}',
                    width: '100%',
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('Please only input png or jpg type file')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('File size too big')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });

            $("#meta_img").spartanMultiImagePicker({
                fieldName: 'meta_image',
                maxCount: 1,
                rowHeight: '280px',
                groupClassName: 'col-12',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/back-end/img/400x400/img2.jpg')}}',
                    width: '90%',
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('Please only input png or jpg type file')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('{{\App\CPU\translate('File size too big')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });

        });

        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });
    </script>

    <script>
        function getRequest(route, id, type) {
            $.get({
                url: route,
                dataType: 'json',
                success: function (data) {
                    if (type == 'select') {
                        $('#' + id).empty().append(data.select_tag);
                    }
                },
            });
        }

        $('input[name="colors_active"]').on('change', function () {
            if (!$('input[name="colors_active"]').is(':checked')) {
                $('#colors-selector').prop('disabled', true);
            } else {
                $('#colors-selector').prop('disabled', false);
            }
        });

        $('#choice_attributes').on('change', function () {
            $('#customer_choice_options').html(null);
            $.each($("#choice_attributes option:selected"), function () {
                //console.log($(this).val());
                add_more_customer_choice_option($(this).val(), $(this).text());
            });
        });

        function add_more_customer_choice_option(i, name) {
            let n = name.split(' ').join('');
            $('#customer_choice_options').append('<div class="row"><div class="col-md-3"><input type="hidden" name="choice_no[]" value="' + i + '"><input type="text" class="form-control" name="choice[]" value="' + n + '" placeholder="{{trans('Choice Title') }}" readonly></div><div class="col-lg-9"><input type="text" class="form-control" name="choice_options_' + i + '[]" placeholder="{{trans('Enter choice values') }}" data-role="tagsinput" onchange="update_sku()"></div></div>');

            $("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput();
        }
        $('#colors-selector').on('change', function () {
            update_sku();
        });

        $('input[name="unit_price"]').on('keyup', function () {
            update_sku();
        });


        function update_sku() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: '{{route('seller.product.sku-combination')}}',
                data: $('#product_form').serialize(),
                success: function (data) {
                    $('#sku_combination').html(data.view);
                    $('#sku_combination').addClass('pt-4');
                    if (data.length > 1) {
                        $('#quantity').hide();
                    } else {
                        $('#quantity').show();
                    }
                }
            });
        };

        $(document).ready(function () {
            // color select select2
            $('.color-var-select').select2({
                templateResult: colorCodeSelect,
                templateSelection: colorCodeSelect,
                escapeMarkup: function (m) {
                    return m;
                }
            });

            function colorCodeSelect(state) {
                var colorCode = $(state.element).val();
                if (!colorCode) return state.text;
                return "<span class='color-preview' style='background-color:" + colorCode + ";'></span>" + state.text;
            }
        });
    </script>

    <script>
        function check(){

            
            Swal.fire({
                title: 'تاكيد',
                text: "هل انت متاكد من اضافة المنتج الي قائمة منتجاتك",
                showCancelButton: true,
                confirmButtonColor: '#5446cd',
                cancelButtonColor: '#ff5f5f',
                confirmButtonText: 'نعم',
                cancelButtonText: 'لا',
            }).then((result) => {
                for ( instance in CKEDITOR.instances ) {
                    CKEDITOR.instances[instance].updateElement();
                }
                var formData = new FormData(document.getElementById('product_form'));
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.post({
                    url: '{{ route('seller.product.addProductModel') }}',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data.errors) {
                            for (var i = 0; i < data.errors.length; i++) {
                                toastr.error(data.errors[i].message, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        } else {
                            toastr.success('{{\App\CPU\translate('product updated successfully!')}}', {
                                CloseButton: true,
                                ProgressBar: true
                            });
                            $('#product_form').submit();
                        }
                    }
                });
            })
        };
    </script>
    <script>
        function checkPro(){
            Swal.fire({
                title: 'تاكيد',
                text: "هل انت متاكد من اضافة المنتج الي قائمة منتجاتك",
                showCancelButton: true,
                confirmButtonColor: '#5446cd',
                cancelButtonColor: '#ff5f5f',
                confirmButtonText: 'نعم',
                cancelButtonText: 'لا',
            }).then((result) => {
                for ( instance in CKEDITOR.instances ) {
                    CKEDITOR.instances[instance].updateElement();
                }
                var formData = new FormData(document.getElementById('product_form2'));
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.post({
                    url: '{{ route('seller.product.addMultiPriceProductModel') }}',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data.errors) {
                            for (var i = 0; i < data.errors.length; i++) {
                                toastr.error(data.errors[i].message, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        } else {
                            toastr.success('{{\App\CPU\translate('product updated successfully!')}}', {
                                CloseButton: true,
                                ProgressBar: true
                            });
                            $('#product_form2').submit();
                        }
                    }
                });
            })
        };
    </script>
    {{-- <script>
        function sendReq(){
            Swal.fire({
                title: 'تاكيد',
                text: "هل انت متاكد من اضافة المنتج الي قائمة منتجاتك",
                showCancelButton: true,
                confirmButtonColor: '#5446cd',
                cancelButtonColor: '#ff5f5f',
                confirmButtonText: 'نعم',
                cancelButtonText: 'لا',
            }).then((result) => {
                for ( instance in CKEDITOR.instances ) {
                    CKEDITOR.instances[instance].updateElement();
                }
                var formData = new FormData(document.getElementById('send_request_form'));
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.post({
                    url: '{{ route("seller.product.sendRequestModel") }}',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if (data.errors) {
                            for (var i = 0; i < data.errors.length; i++) {
                                toastr.error(data.errors[i].message, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        } else {
                            toastr.success('{{\App\CPU\translate('product updated successfully!')}}', {
                                CloseButton: true,
                                ProgressBar: true
                            });
                            $('#send_request_form').submit();
                        }
                    }
                });
            })
        };
    </script> --}}
    {{-- <script>
        $(".lang_link").click(function (e) {
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.split("-")[0];
            console.log(lang);
            $("#" + lang + "-form").removeClass('d-none');
            if (lang == '{{$default_lang}}') {
                $(".rest-part").removeClass('d-none');
            } else {
                $(".rest-part").addClass('d-none');
            }
        })
    </script> --}}

    <!-- <script>
        $(document).ready(function(){
            $("#search_product").on('keyup',function(){
                let text = $('#search_product').val();

                if(text.length > 0){
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                            url: "search",
                            data: {
                                search:text
                            },
                            method: 'post',
                            success: function(result){
                                $('#searchresult').html(result)
                                // console.log(result);
                            }
                        });
                }
                if(text.length < 1){
                    $('#searchresult').html("")
                }
            });
        });
    </script> -->

    <script>
        function productView(id){
            $.ajax({
                type: 'GET',
                url: 'view/model/'+id,
                dataType: 'json',
                success: function(data){
                    $('#product_name').text(data.name);
                    $('#unit_num').text(data.unit + '*' + data.unit_numbers);
                    $('#product_image').attr('src','/product/'+ data.thumbnail);
                    $('#product_image').attr('alt',data.name);
                    $('#product_price').attr('value', data.unit_price.toFixed(2));
                    $('#product_id').attr('value', data.id);
                    $('#product_id2').attr('value', data.id);
                    $('#unit_price2').attr('value', data.unit_price.toFixed(2));
                }
            });
        }  //// ///////  End Of Product Modal
    </script>


    <script>
        function productSize(id){
            $.ajax({
                type: 'GET',
                url: 'view/model/'+id,
                dataType: 'json',
                success: function(data){
                    $('#brand').val(data.brand.name);
                    $('#product_name3').val(data.name);
                    $('#pro_id').val(data.id);
                }
            });
        }  //// ///////  End Of Product Modal

    </script>


    <script>
        $(function(){
            $(document).on('click','#submit',function(e){
                e.preventDefault();
                var link = $(this).attr("href");

                
                    Swal.fire({
                    title: 'هل انت متامد من اضافة المنتج?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'نعم!'
                    cancelButtonText: 'الغاء'
                    }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = link
                        Swal.fire(
                        'تم بنجاح',
                        )
                    }
                    });

                    
            });
        });
    </script>


        <script>


            function getPrice() {

                var product_price = document.getElementById('add_product_price').value;

                var purchase_price = document.getElementById('purchase_price').value;
                
                
                if(product_price -  purchase_price >= 50) {

                    console.log(purchase_price);

                    document.getElementById('price_error').textContent = '';

                } else {

                    document.getElementById('purchase_price').value = '';

                    document.getElementById('price_error').textContent = 'سعر الشراء يجب ان يكون اقل من سعر المنتج ب 50 ريال علي الاقل';

                } 


            }

            function getPrice2() {

                var product_price2 = document.getElementById('add_product_price2').value;

                var purchase_price2 = document.getElementById('purchase_price2').value;


                if(product_price2 -  purchase_price2 >= 50) {

                    console.log(purchase_price2);

                    document.getElementById('price_error2').textContent = '';

                } else {

                    document.getElementById('purchase_price2').value = '';

                    document.getElementById('price_error2').textContent = 'سعر الشراء يجب ان يكون اقل من سعر المنتج ب 50 ريال علي الاقل';

                } 


                }


                function enableDiscount() {

                    var price = document.getElementById('product_price').value;

                    if(price != null) {

                        $('#discount').attr('readonly', null);

                    } else {

                        $('#discount').attr('readonly', 'readonly');

                    }

                    var purchase_price2 = document.getElementById('purchase_price2').value;


                }



                function calcDiscount() {

                    var discount = document.getElementById('discount').value;

                    var price = document.getElementById('product_price').value;

                    var purchase_price = document.getElementById('purchase_price').value;

                    var getDiscount = price * discount / 100;

                    var dis = price - getDiscount;
                    

                    console.log(dis);
                }


            $(document).ready(function(){


               


                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $('#image-upload').submit(function(e) {


                    e.preventDefault();
                    let formData = new FormData(this);
                    $('#image-input-error').text('');

                    $.ajax({
                        type:'POST',
                        url: "{{ route('seller.product.RequestProModel') }}",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: (response) => {
                            if (response) {
                                this.reset();
                                Swal.fire(
                                    'تم اضافة المنتج بنجاح',
                                    'success'
                                    )
                            }

                            location.reload();
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });
                });


                $('#getCat').on('change', function(){

                    console.log($(this).val());

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
