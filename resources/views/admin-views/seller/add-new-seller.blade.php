@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('add_new_seller'))

@push('css_or_js')


@endpush

@section('content')
<div class="content container-fluid main-card rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('add_new_seller')}}</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-12">
            <div class="card o-hidden border-0 shadow-lg my-4">
                <div class="card-body ">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="p-5">
                                <div class="text-center mb-2 ">
                                    <h3 class="" > {{\App\CPU\translate('Shop')}} {{\App\CPU\translate('Application')}}</h3>
                                    <hr>
                                </div>
                                <form class="user" action="{{route('shop.apply')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="status" value="approved">
                                    <h5 class="black">{{\App\CPU\translate('Info')}} {{\App\CPU\translate('Seller')}} </h5>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user" id="exampleFirstName" name="user_name" value="{{old('f_name')}}" placeholder="{{\App\CPU\translate('user_name')}}" required>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="email" class="form-control form-control-user" id="exampleLastName" name="email" value="{{old('l_name')}}" placeholder="{{\App\CPU\translate('email')}}" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control form-control-user" id="exampleInputPhone" name="phone" value="{{old('phone')}}" placeholder="( * {{\App\CPU\translate('country_code_is_must')}} {{\App\CPU\translate('like_for_BD_880')}} )" required>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user" id="exampleLastName" name="company_name_ar" value="{{old('l_name')}}" placeholder="{{\App\CPU\translate('company_name')}} (عربيـ)" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user" id="exampleInputEmail" name="company_name_en" value="{{old('email')}}" placeholder="{{ \App\CPU\translate('company_name') }} (en)" required>
                                        </div>
                                        <div class="col-sm-6">
                                       
                                                <select name="company_type" id="company_type" class="form-control"
                                                    value="{{ Session::get('company_type') }}">
                                                    <option value="" selected disabled>{{ \App\CPU\translate('company type') }}</option>
                                                    <option value="factory">{{ \App\CPU\translate('factory') }}</option>
                                                    <option value="supplier">{{ \App\CPU\translate('supplier') }}</option>
                                                    <option value="trader">{{ \App\CPU\translate('trader') }}</option>

                                                </select>
                                        </div>
                                    </div>


                                    <div class="form-group row">

                                        <div class="col-6">
                                            <label class="input-label fw-bolder "
                                            for="exampleFormControlInput1">{{ \App\CPU\translate('company_email') }}</label>
                                            <input type="email" name="email" value="{{old('certificate_number')}}" class="form-control" placeholder="{{\App\CPU\translate('email')}}" id="email" required>
                                        </div>

                                        <?php
                                       $getState =  \App\Model\States::all();
                                       ?>

                                        <div class="col-6">
                                        <label class="input-label fw-bolder "
                                                    for="exampleFormControlInput1">{{ \App\CPU\translate('City_State') }}</label>
                                                <select value="{{ Session::get('city_id') }}"
                                                    class="js-example-basic-multiple form-control" name="city_id"
                                                    id="city_id"
                                                    onchange="getRequest('{{ url('/') }}/seller/auth/get-places?city_id='+this.value,'places','select')"
                                                    required>
                                                    <option value="{{ old('city_id') }}" selected disabled>---Select---
                                                    </option>
                                                  
                                                    @foreach ($getState as $c)
                                                        <option value="{{ $c['id'] }}"
                                                            {{ old('name') == $c['id'] ? 'selected' : '' }}>
                                                            {{ $c['name'] }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                        </div>


                                    </div>



                                    <div class="form-group">

                                      
                                        <div class="col-6">
                                        <?php
                                        $getCity =  \App\Model\City::all();
                                        ?>
                                        <label class="input-label fw-bolder js-example-responsive"
                                                    for="places">{{ __('messages.States') }}</label>
                                                <select class="form-control places" name="places[]" id="places" multiple="multiple">
                                                @foreach($getCity as $val)
                                                <option value="{{$val->id}}">{{$val->name}}</option>
                                                @endforeach
                                                </select>

                                        </div>

                                        <div class="col-6">

                                                <label class="input-label fw-bolder" for="regiseration_number"> {{\App\CPU\translate('tax_no_res')}}</label>
                                                <input type="number" value="{{old('regiseration_number')}}" name="regiseration_number" class="form-control" placeholder="{{\App\CPU\translate('tax_no_res')}}"
                                                required>

                                        </div>
                                    </div>

                                  
                                  

                                    

                                   

                                        <div class="row">

                                            <div class="col-md-6 col-12">
                                                <div class="form-group p-0 m-0">
                                                    <label class="input-label fw-bolder" for="start_date"> {{\App\CPU\translate('start_date')}}</label>
                                                    <input type="text" name="start_date" value="{{old('start_date')}}" class="form-control" placeholder="{{\App\CPU\translate('start_date')}}" id="start_date" required>
                                                </div>
                                            </div>


                                            <div class="col-md-6 col-12">
                                                <div class="form-group p-0 m-0">
                                                    <label class="input-label fw-bolder" for="end_date"> {{\App\CPU\translate('end_date')}}</label>
                                                    <input type="text" name="end_date" value="{{old('end_date')}}" class="form-control" placeholder="{{\App\CPU\translate('end_date')}}" id="end_date" required>
                                                </div>
                                            </div>

                                            <div class="col-md-12 col-12">
                                                <div class="form-group p-0 m-0">
                                                    <label  class="input-label fw-bolder" for="regist_image"></label>
                                                    <input type="file" name="regist_image" value="{{old('regist_image')}}" class="form-control" id="regist_image" required>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="form-group">
                                        <form class="needs-validation digit-group mt-4" data-group-name="digits"
                                    data-autosubmit="false" autocomplete="off" action="{{{route('seller.auth.seller-info-3')}}}"
                                    method="post"
                                    enctype="multipart/form-data"
                                    id="form-id"style="flex-direction: {{ Session::get('direction') === 'rtl' ? 'row-reverse' : 'row' }};">
                                    @csrf

                                    <div class="row justify-content-center gap-3">
                                        @php($all_cats= \App\Model\Category::all())
                                        <div class="row justify-content-center gap-3">
                                        @foreach ($all_cats as $key => $val)
                                            <div class="col col-5 rounded p-2" style="background: #eee">
                                                <h3 class="">{{ $val->name }}</h3>

                                                @php($sub= \App\Model\subsCategory::where('parent_id', '=', $val->id)->get())
                                                <div class=" me-2 row row-cols-3 ">
                                                    @foreach ($sub as $item)
                                                        <span class="fom-check p-0 m-0 ">
                                                            <input class="p-0 m-0  form-check-input"
                                                                   type="checkbox"
                                                                   name="categories[]"
                                                                   @if ( in_array( $item->id , Session::get("seller.categories") ))
                                                                        checked
                                                                   @endif --}}

                                                                   multiple="multiple"
                                                                   value="{{ $item->id }}"
                                                                   id="{{ $item->id }}"
                                                            >
                                                            <label class="p-0 m-0  form-check-label me-4"
                                                                   for="{{ $item->id }}">
                                                                   {{ $item->name }}
                                                            </label>
                                                        </span>
                                                    @endforeach
                                                </div>
                                            </div>
                                        @endforeach
                                        </div>

<hr>

<div class="col-md-12 col-12">

    <div class="form-group p-0 m-0">
        <label style="font-size: 1.3rem" class="input-label fw-bolder" for="products_file">قم بتحميل قائمة المنتجات الخاصة بك </label>
        <input type="file" name="products_file" class="form-control"id="products_file" required>
    </div>

</div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">{{\App\CPU\translate('Apply')}} {{\App\CPU\translate('Shop')}} </button>
                                </form>
                                <hr>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')

@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif
<script>
    $('#inputCheckd').change(function () {
            // console.log('jell');
            if ($(this).is(':checked')) {
                $('#apply').removeAttr('disabled');
            } else {
                $('#apply').attr('disabled', 'disabled');
            }

        });

    $('#exampleInputPassword ,#exampleRepeatPassword').on('keyup',function () {
        var pass = $("#exampleInputPassword").val();
        var passRepeat = $("#exampleRepeatPassword").val();
        if (pass==passRepeat){
            $('.pass').hide();
        }
        else{
            $('.pass').show();
        }
    });
    $('#apply').on('click',function () {

        var image = $("#image-set").val();
        if (image=="")
        {
            $('.image').show();
            return false;
        }
        var pass = $("#exampleInputPassword").val();
        var passRepeat = $("#exampleRepeatPassword").val();
        if (pass!=passRepeat){
            $('.pass').show();
            return false;
        }


    });
    function Validate(file) {
        var x;
        var le = file.length;
        var poin = file.lastIndexOf(".");
        var accu1 = file.substring(poin, le);
        var accu = accu1.toLowerCase();
        if ((accu != '.png') && (accu != '.jpg') && (accu != '.jpeg')) {
            x = 1;
            return x;
        } else {
            x = 0;
            return x;
        }
    }

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

    function readlogoURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#viewerLogo').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    function readBannerURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#viewerBanner').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#LogoUpload").change(function () {
        readlogoURL(this);
    });
    $("#BannerUpload").change(function () {
        readBannerURL(this);
    });
</script>

<script>

        $(document).ready(function(){

            $('.places').select2({

                placeholder: 'Select',
                allowClear: true

            });

            $('.places').change(function(){

                console.log('good');

            });
        })
    </script>

<script>

const elem = document.getElementById('start_date');
const elem2 = document.getElementById('end_date');

const datepicker = new Datepicker(elem, {
    autohide: true,
});
const datepicker2 = new Datepicker(elem2, {
    autohide: true,
});





</script>
@endpush
