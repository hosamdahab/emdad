@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Category'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('category')}}</li>
            </ol>
        </nav>

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        {{ \App\CPU\translate('category_form')}}
                    </div>
                    <div class="card-body" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                        <form action="{{route('admin.category.update')}}" method="POST" enctype="multipart/form-data" id="categoryEdit">
                            @csrf
                           
                            <div class="row">


                                <div class="col-lg-6 col-md-5 col-12">
                                   
                                        <div class="form-group lang_form"
                                             id="form">
                                            <label class="input-label"
                                                   for="exampleFormControlInput1">{{\App\CPU\translate('name')}}
                                                </label>
                                            <input type="text" value="{{$category->name}}" name="name" class="form-control"
                                                   placeholder="{{\App\CPU\translate('New')}} {{\App\CPU\translate('Category')}}">
                                        </div>
                                        
                                   
                                    <input name="position" value="0" type="hidden">
                                    <input name="categoryId" id="categoryId" value="{{$category->id}}" type="hidden">
                                    <input type="hidden" name="old_icon" value="{{'category/'.$category->icon}}">
                                </div>


                             


                                <div class="col-lg-6 col-md-4 col-12 from_part_2">
                                    <label>{{\App\CPU\translate('image')}}</label><small style="color: red">*
                                        ( {{\App\CPU\translate('ratio')}} 1:1 )</small>
                                    <div class="custom-file" style="text-align: left">
                                        <input type="file" name="image" id="customFileEg1"
                                               class="custom-file-input"
                                               accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*"
                                               >
                                        <label class="custom-file-label"
                                               for="customFileEg1">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                    </div>
                                </div>
                              
                               <input name="position" value="0" style="display: none">
                          



                                <div class="col-12 from_part_2">
                                    <div class="form-group">
                                        <hr>
                                        <center>
                                            <img
                                                style="width: 200px;height:200px;border: 1px solid; border-radius: 10px;"
                                                id="viewer"
                                                src="{{asset('category/'.$category->icon)}}"
                                                alt="image" draggable="false"/>
                                        </center>
                                    </div>
                                </div>


                            </div>
                    
                            <button type="submit" class="btn btn-primary float-right">{{\App\CPU\translate('submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')

    

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

        $("#customFileEg1").change(function () {
            readURL(this);
        });

    </script>

    <script>

        $(document).ready(function(){


            $('#categoryEdit').submit(function(e){

                e.preventDefault();
                let formData = new FormData(this);
                $('#image-input-error').text('');

                let myId = $('#categoryId').val();

                $.ajax({
                type:'POST',
                url: "{{route('admin.category.update')}}",
                data: formData,
                contentType: false,
                processData: false,
                success: (response) => {
                    if (response) {
                        this.reset();
                        Swal.fire(
                            'تم تعديل القسم بنجاح',
                            )
                    }

                    window.location.href = '/admin/category/view'
                },
                error: function(response){
                    $('#image-input-error').text(response.responseJSON.message);
                }

                });


            });

           
        })
    </script>
@endpush
