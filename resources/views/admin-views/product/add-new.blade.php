@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Product Add'))

@push('css_or_js')
    <link href="{{asset('public/assets/back-end/css/tags-input.min.css')}}" rel="stylesheet">
    <link href="{{ asset('public/assets/select2/css/select2.min.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page"><a
                        href="{{route('admin.product.list', 'in_house')}}">{{\App\CPU\translate('Product')}}</a>
                </li>
                <li class="breadcrumb-item">{{\App\CPU\translate('Add')}} {{\App\CPU\translate('New')}} </li>
            </ol>
        </nav>

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
                <form class="product-form" action="{{route('admin.products.store')}}" method="POST"
                      enctype="multipart/form-data"
                      id="admin_add_product_form">
                    @csrf
                   

                    <div class="card mt-2 col-12 rest-part">
                        <div class="card-header">
                            <h4>{{\App\CPU\translate('General Info')}}</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">

                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Product Name')}}</label>
                                       <input type="text" class="form-control" name="name" placeholder="{{\App\CPU\translate('Product Name')}}">
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('brand')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="brand_id" id="brand_id"
                                            onchange="getRequest('{{url('/')}}/admin/product/get-categories?parent_id='+this.value,'sub-category-select','select')">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                           
                                            @foreach($br as $b)
                                                <option value="{{$b->id}}" class="{{$b->category_id}}">
                                                    {{$b->name}}
                                                </option>
                                            @endforeach
                                          
                                        </select>
                                    </div>

                                    
                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="category_id" id="category_id"
                                            onchange="getRequest('{{url('/')}}/admin/product/get-categories?parent_id='+this.value,'sub-category-select','select')">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                           
                                            @foreach($cat as $c)
                                                <option value="{{$c->id}}">
                                                    {{$c->name}}
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
                                                <option
                                                    value="{{$x}}" {{old('unit')==$x? 'selected':''}}>{{$x}}</option>
                                            @endforeach
                                        </select>
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{__('messages.quantity_in_unit')}}</label>
                                        <input type="number" min="0" step="0.01"
                                               placeholder="{{__('messages.quantity_in_unit')}}"
                                               name="unit_numbers" class="form-control"
                                               >
                                    </div>

                                    <div class="col-md-4">
                                        <label for="name">{{__('messages.quantity_in_carton')}}</label>
                                        <input type="number" min="0" step="0.01"
                                               placeholder="{{__('messages.quantity_in_carton')}}"
                                               name="carton_unit" class="form-control"
                                               >
                                    </div>


                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-md-4">
                                        <label for="name">{{__('messages.product_type')}}</label>
                                       <input type="text" class="form-control" name="product_type" placeholder="{{__('messages.product_type')}}">
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('sub_category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="sub_category_id" id="sub_category_id">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                           
                                            @foreach($sub as $c)
                                                <option value="{{$c->id}}" class="{{$c->id}}">
                                                    {{$c->name}}
                                                </option>
                                            @endforeach
                                           
                                        </select>
                                    </div>


                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('Sub Sub Category')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="sub_sub_category_id" id="sub_sub_category_id">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                           
                                            @foreach(\App\Model\sub_sub_category::all() as $c)
                                                <option value="{{$c->id}}">
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
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                            @foreach($Branche as $b)
                                                <option value="{{$b->id}}">
                                                    {{$b->branche_name}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="name">{{\App\CPU\translate('seller')}}</label>
                                        <select
                                            class="js-example-basic-multiple form-control"
                                            name="seller_id"
                                            onchange="getRequest('{{url('/')}}/admin/product/get-categories?parent_id='+this.value,'sub-category-select','select')">
                                            <option value="{{old('category_id')}}" selected disabled>---Select---</option>
                                            @foreach($seller as $s)
                                                <option value="{{$s->id}}">
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
                                               name="unit_price"  class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label
                                            class="control-label">{{\App\CPU\translate('Purchase price')}}</label>
                                        <input type="number" min="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Purchase price')}}"
                                               name="purchase_price" class="form-control">
                                    </div>
                                </div>
                                <div class="row pt-4">

                                    <div class="col-md-6">
                                        <label class="control-label">{{\App\CPU\translate('Tax')}}</label>
                                        <label class="badge badge-info">{{\App\CPU\translate('Percent')}} ( % )</label>
                                        <input type="number" min="0" value="0" step="0.01"
                                               placeholder="{{\App\CPU\translate('Tax')}}" name="tax"
                                               value="{{old('tax')}}"
                                               class="form-control">
                                        <input name="tax_type" value="percent" style="display: none">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="control-label">{{\App\CPU\translate('Discount')}}</label>
                                        <label class="badge badge-info">{{\App\CPU\translate('Percent')}} ( % )</label>
                                        <input type="number" min="0" value="{{old('discount')}}" step="0.01"
                                               placeholder="{{\App\CPU\translate('Discount')}}" name="discount"
                                               class="form-control">
                                    </div>
                                    
                                </div>
                                    
                                <div class="row pt-4">
                                  
                                    <div class="col-sm-6 col-md-6 col-lg-6" id="quantity">
                                        <label
                                            class="control-label">{{__('messages.quantity_in_store')}}</label>
                                        <input type="number" name="current_stock" min="0" value="0" step="1"
                                               placeholder="{{__('messages.quantity_in_store')}}"
                                               name="current_stock" class="form-control" required>
                                    </div>

                                    <div class="col-sm-6 col-md-6 col-lg-6" id="shipping_cost">
                                        <label
                                            class="control-label">{{\App\CPU\translate('shipping_cost')}} </label>
                                        <input type="number" name="shipping_cost" min="0" value="0" step="1"
                                               placeholder="{{\App\CPU\translate('shipping_cost')}}"
                                               name="shipping_cost" class="form-control" required>
                                    </div>

                                    
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="card mt-2 col-12 rest-part">
                        <div class="card-body">
                            <div class="row">


                                <div class="col-md-12 mb-4">
                                    <label class="control-label">{{\App\CPU\translate('Youtube video link')}}</label>
                                    <small class="badge badge-soft-danger"> ( {{\App\CPU\translate('optional, please provide embed link not direct link')}}. )</small>
                                    <input type="text" name="video_link" placeholder="{{\App\CPU\translate('EX')}} : https://www.youtube.com/embed/5R06LRdUCSE" class="form-control">
                                </div>

                                <div class="col-md-12 mb-4">
                                    <label>{{\App\CPU\translate('Upload product images')}}</label><small style="color: red">*
                                        ( {{\App\CPU\translate('ratio')}} 1:1 )</small>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" name="product_image"
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
                                        <input type="file" name="product_thumbnail"
                                               class="custom-file-input"
                                               accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*"
                                               >
                                        <label class="custom-file-label"
                                               for="customFileEg1">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>
                                </div>

                               
                            </div>
                        </div>
                    </div>

                   
                    <button type="submit mt-4" class="btn btn-primary float-right" style="margin-top:20px">{{\App\CPU\translate('Submit')}}</button>
                     
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="{{asset('public/assets/back-end')}}/js/tags-input.min.js"></script>
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

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload").change(function () {
            readURL(this);
        });


        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            // dir: "rtl",
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
                url: '{{route('admin.product.sku-combination')}}',
                data: $('#product_form').serialize(),
                success: function (data) {
                    $('#sku_combination').html(data.view);
                    if (data.length > 1) {
                        $('#quantity').hide();
                    } else {
                        $('#quantity').show();
                    }
                }
            });
        }

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
                title: '{{\App\CPU\translate('Are you sure')}}?',
                text: '',
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#377dff',
                cancelButtonText: 'No',
                confirmButtonText: 'Yes',
                reverseButtons: true
            }).then((result) => {
                for (instance in CKEDITOR.instances) {
                    CKEDITOR.instances[instance].updateElement();
                }
                var formData = new FormData(document.getElementById('product_form'));
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                
                $.post({
                    url: '{{route('admin.product.store')}}',
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
                            toastr.success('{{\App\CPU\translate('product added successfully')}}!', {
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
        $(".lang_link").click(function (e) {
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.split("-")[0];
            console.log(lang);
            $("#" + lang + "-form").removeClass('d-none');
          
        })
    </script>

    <script>

        $(document).ready(function(){

            $('#admin_add_product_form').submit(function(e){

                e.preventDefault();
                let formData = new FormData(this);

                $.ajax({
                        type:'POST',
                        url: "{{ route('admin.products.store') }}",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: (response) => {
                            if (response) {
                                this.reset();
                                Swal.fire(
                                    'تم اضافة المنتج',
                                    )
                                   location.reload();
                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });

            });



            $('#brand_id').on('change',function(){

                let brand_id = $('#brand_id option:selected').attr('class');
              
                $.ajax({
                        type:'GET',
                        url: '/admin/products/get_brand_category/'+ brand_id +'',
                        dataType: 'json',
                        success: (response) => {
                            if (response) {
                            //   console.log(response);

                            $('#category_id').append().empty();
                            $('#category_id').append('<option value="' + response.category.id +'">' + response.category.name +'</option>');

                            $('#sub_category_id').append().empty();

                            $('#sub_category_id').append('<option value="{{old('category_id')}}" selected disabled>---Select---</option>');
                            
                            $.each(response.sub_category,function(index,value){

                                $('#sub_category_id').append('<option value="' + value.id +'">'+ value.name +'</option>');
                                
                            });


                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });



                // console.log(brand_id);

            });



            $('#sub_category_id').on('change',function(){

                let sub_cate_id = $('#sub_category_id').val();


                $.ajax({
                        type:'GET',
                        url: '/admin/products/get_sub_category/'+ sub_cate_id +'',
                        dataType: 'json',
                        success: (response) => {
                            if (response) {
                            //   console.log(response);

                            $('#sub_sub_category_id').append().empty();

                            $('#sub_sub_category_id').append('<option value="{{old('category_id')}}" selected disabled>---Select---</option>');
                            
                            $.each(response.sub_sub_category,function(index,value){

                                $('#sub_sub_category_id').append('<option value="' + value.id +'">'+ value.name +'</option>');
                                
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
