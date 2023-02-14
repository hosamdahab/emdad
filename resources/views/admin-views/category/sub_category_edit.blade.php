@extends('layouts.back-end.app')
@section('title', 'تعديل قسم فرعي')


@push('css_or_js')
    <link href="{{asset('public/assets/back-end')}}/css/select2.min.css" rel="stylesheet"/>
    <link href="{{asset('public/assets/back-end/css/croppie.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

   
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('sub_category')}}</li>
        </ol>
    </nav>

     <!-- Content Row -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                    {{\App\CPU\translate('sub_category')}}
                    </div>
                    <div class="card-body" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                        <form action="{{route('admins.sub.category.update')}}" method="POST" enctype="multipart/form-data" id="subCategoryUpdate">
                            @csrf
                           
                           
                            <div class="row">


                                <div class="col-lg-6 col-md-5 col-12">
                                   
                                        <div class="form-group lang_form"
                                             id="form">
                                            <label class="input-label"
                                                   for="exampleFormControlInput1">{{\App\CPU\translate('sub_category')}} {{\App\CPU\translate('name')}}
                                                </label>
                                            <input type="text" value="{{$sub_categories->name}}" name="name" class="form-control"
                                                   placeholder="{{\App\CPU\translate('sub_category')}} {{\App\CPU\translate('name')}}">
                                        </div>
                                       
                                        <input type="hidden" name="old_icon" value="{{'sub_category/'.$sub_categories->icon}}">
                                        <input name="myId" id="myId" value="{{$sub_categories->id}}" type="hidden">
                                    <input name="position" value="0" style="display: none">
                                </div>


                                <div class="col-lg-6 col-md-5 col-12">
                                    <div class="form-group">
                                        <label class="input-label"
                                               for="exampleFormControlSelect1">{{\App\CPU\translate('main')}} {{\App\CPU\translate('category')}}
                                            <span class="input-label-secondary">*</span></label>
                                        <select id="exampleFormControlSelect1" name="parent_id"
                                                class="form-control" required>
                                            @foreach(\App\Model\Category::where(['position'=>0])->get() as $category)
                                                <option
                                                    value="{{$category['id']}}">{{$category['name']}}</option>
                                            @endforeach
                                        </select>
                                    </div>
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
                                                src="{{asset('sub_category/'.$sub_categories->icon)}}"
                                                alt="image"/>
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

<script type="text/javascript">

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
  
    $('#customFileEg1').change(function(){    
        let reader = new FileReader();
   
        reader.onload = (e) => { 
            $('#viewer').attr('src', e.target.result); 
        }   
  
        reader.readAsDataURL(this.files[0]); 
     
    });
  
    $('#subCategoryUpdate').submit(function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $('#image-input-error').text('');

        let myId = $('#myId').val();

        $.ajax({
            type:'POST',
            url: "{{route('admins.sub.category.update')}}",
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    this.reset();
                    Swal.fire(
                        'تم تعديل القسم الفرعي'
                        )
                        window.location.href = '/admin/sub-category/view'
                }
            },
            error: function(response){
                $('#image-input-error').text(response.responseJSON.message);
            }
       });
    });
      




</script>
@endpush
