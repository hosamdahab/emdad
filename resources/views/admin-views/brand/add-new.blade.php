@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Brand Add'))


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
            <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('brand')}}</li>
        </ol>
    </nav>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    {{ \App\CPU\translate('Add')}} {{ \App\CPU\translate('new')}} {{ \App\CPU\translate('brand')}}
                </div>
                <div class="card-body" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <form action="{{route('admin.brand.store')}}" id="admin_new_brands" method="post" enctype="multipart/form-data">
                      
                       
                        <div class="row">
                            <div class="col-md-6">
                               
                                    <div class="form-group lang_form"
                                            id="form">
                                        <label for="name">{{ \App\CPU\translate('name')}} </label>
                                        <input type="text" name="brand" class="form-control" id="name" value="{{old('name')}}" placeholder="العلامة التجارية">
                                    </div>
                                   
                                    @php
                                        $category =  App\Model\Category::all()
                                    @endphp

                                    <div class="form-group lang_form" id="form0">
                                        <select class="form-control" name="category_id" aria-label="Default select example">
                                        <option selected>{{__('messages.category')}}</option>
                                        @foreach($category as $val)
                                        <option value="{{$val->id}}">{{$val->name}}</option>
                                        @endforeach
                                        </select>
                                        
                                    </div>

                              
                                    <div class="form-group">
                                        <label for="name">{{ \App\CPU\translate('brand_logo')}}</label><span class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 1:1 )</span>
                                        <div class="custom-file" style="text-align: left" required>

                                        <div class="mb-3">
    
                                    <input class="form-control" name="imagebrand" type="file" id="customFileUpload">
                                    </div>
                                      
                                    </div>
                                </div
                                
                                >
                            </div>
                            <div class="col-md-6 mb-4">
                                <div class="text-center">
                                    <img style="border-radius: 10px; max-height:170px;" id="preview-image"
                                        src="{{asset('public\assets\back-end\img\400x400\img2.jpg')}}" alt="banner image"/>
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

<script type="text/javascript">

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
  
    $('#customFileUpload').change(function(){    
        let reader = new FileReader();
   
        reader.onload = (e) => { 
            $('#preview-image').attr('src', e.target.result); 
        }   
  
        reader.readAsDataURL(this.files[0]); 
     
    });
  
    $('#admin_new_brands').submit(function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        $('#image-input-error').text('');

        $.ajax({
            type:'POST',
            url: "{{ route('admin.brand.store') }}",
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    this.reset();
                    Swal.fire(
                        'تم اضافة العلامة التجارية',
                        )
                }
            },
            error: function(response){
                $('#image-input-error').text(response.responseJSON.message);
            }
       });
    });
      




</script>
@endpush
