@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Brand Edit'))

@push('css_or_js')
    <link href="{{asset('public/assets/back-end')}}/css/select2.min.css" rel="stylesheet"/>
    <link href="{{asset('public/assets/back-end/css/croppie.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>

        #form7, #form8, #form9,#form10 {

            display:none
        }
</style>
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{ \App\CPU\translate('Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{ \App\CPU\translate('Brand')}} {{ \App\CPU\translate('Update')}}</li>
        </ol>
    </nav>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h1 class="h3 mb-0 text-black-50">{{ \App\CPU\translate('Brand')}} {{ \App\CPU\translate('Update')}}</h1>
                </div>
                <div class="card-body" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <form action="{{route('admin.brand.updated')}}" id="admin_edit_brands" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                               
                                    <div class="form-group lang_form"
                                            id="form">
                                        <label for="name">{{ \App\CPU\translate('name')}} </label>
                                        <input type="text" name="name" class="form-control" id="name" value="{{$b->name}}" placeholder="العلامة التجارية">
                                    </div>
                                   
                            

                                    @php
                                        $category =  App\Model\Category::all()
                                    @endphp

                                    <div class="form-group lang_form" id="form0">
                                        <select class="form-control" name="category_id" aria-label="Default select example">
                                        <option selected>{{__('messages.category')}}</option>
                                        @foreach($category as $val)
                                        <option {{ $val->id == $b->category_id ? 'selected' : '' }} value="{{$val->id}}">{{$val->name}}</option>
                                        @endforeach
                                        </select>
                                        <input type="hidden" name="brand_id" id="brand_id" value="{{$b->id}}">
                                        <input type="hidden" name="old_category" id="" value="{{$b->category_id}}">
                                        <input type="hidden" name="old_img" value="{{'brand/'.$b->image}}">
                                    </div>


                              
                                    <div class="form-group">
                                        <label for="name">{{ \App\CPU\translate('brand_logo')}}</label><span class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 1:1 )</span>
                                        <div class="custom-file" style="text-align: left" required>

                                        <div class="mb-3">
    
                                        <input class="form-control" name="editBrandImg" type="file" id="brandImgEdit">
                                    </div>
                                      
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6 mb-4">
                                <div class="text-center">
                                    <img style="border-radius: 10px; max-height:170px;" id="brand_edit_preview_image"
                                        src="{{asset('brand/'.$b->image)}}" alt="banner image"/>

                                    
                                </div>
                            </div>
                        </div>
                        <span class="text-danger" id="image-input-error"></span>

                        <div class="">
                            <button type="submit" class="btn btn-primary float-right">{{ \App\CPU\translate('submit')}}</button>
                        </div>
                    </form>

                    
                </div>
            </div>
        </div>
    </div>

    
</div>
@endsection

@push('script')
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
           
        });

        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>
    <script src="{{asset('public/assets/back-end')}}/js/select2.min.js"></script>
    <script>
        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });
    </script>

    <script>
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
    </script>



    <script type="text/javascript">

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $('#brandImgEdit').change(function(){    
        let reader = new FileReader();

        reader.onload = (e) => { 
            $('#brand_edit_preview_image').attr('src', e.target.result); 
        }   

        reader.readAsDataURL(this.files[0]); 
    
    });

        $('#admin_edit_brands').submit(function(e) {
            e.preventDefault();
            let formData = new FormData(this);
            $('#image-input-error').text('');


            let myId = $('#brand_id').val();

            $.ajax({
                type:'POST',
                url: "{{route('admin.brand.updated')}}",
                data: formData,
                contentType: false,
                processData: false,
                success: (response) => {
                    if (response) {
                        this.reset();
                        Swal.fire(
                            'تم تعديل العلامة التجارية',
                            )

                            window.location.href = '/admin/brand/list';
                    }
                },
                error: function(response){
                    $('#image-input-error').text(response.responseJSON.message);
                }
        });

    });
    


    </script>
@endpush
