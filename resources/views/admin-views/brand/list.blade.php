@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Brand List'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-2">
            <h1 class="h3 mb-0 text-black-50">{{\App\CPU\translate('brand_list')}} <span style="color: rgb(252, 59, 10);">({{ $br->total() }})</span></h1>
        </div>

        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <!-- Search -->
                        <form action="{{ url()->current() }}" method="GET">
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control"
                                    placeholder="{{ \App\CPU\translate('Search')}} {{ \App\CPU\translate('Brands')}}" aria-label="Search orders" value="{{ $search }}" required>
                                <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Search')}}</button>
                            </div>
                        </form>
                        <!-- End Search -->
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 100px">
                                        {{ \App\CPU\translate('ID')}}
                                    </th>
                                    <th scope="col">{{ \App\CPU\translate('name')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('category')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('image')}}</th>
                                    <th scope="col" style="width: 100px" class="text-center">
                                        {{ \App\CPU\translate('action')}}
                                    </th>
                                </tr>
                                </thead>
                                <tbody>

                                @php 

                                $i = 1;
                                @endphp

                                @foreach($br as $b)

                                    @php
                                        $category =  App\Model\Category::where('id', '=', $b->category_id)->first();
                                        $category_check =  App\Model\Category::where('id', '=', $b->category_id)->get();

                                       
                                    @endphp

                                    <tr>
                                        <td class="text-center">{{$i++}}</td>
                                        <td>{{$b['name']}}</td>
                                        @if(count($category_check) > 0)
                                        <td>{{$category->name}}</td>
                                        @else 
                                        <td>غير محدد</td>
                                        @endif
                                        <td>
                                          
                                                 <img src="{{asset('brand/'.$b->image)}}" alt="" class="rounded" style="width: 60px;height: 60px;"
                                                 onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'" >
                                        </td>
                                        <td>
                                            <a class="btn btn-primary btn-sm" title="{{ \App\CPU\translate('Edit')}}"
                                               href="{{route('admin.brand.update',[$b['id']])}}">
                                                <i class="tio-edit"></i> 
                                            </a>
                                           
                                            <form action="{{route('admin.brands.delete')}}" method="post" class="deleted" style="display:inline">
                                            @csrf
                                            <input type="hidden" name="myId" value="{{$b->id}}">
                                            <button type="submit" class="btn btn-danger btn-sm "><i class="tio-add-to-trash"></i> </button>
                                            </form>

                                        </td>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="card-footer">
                        {{$br->links()}}
                    </div>
                    @if(count($br)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{ \App\CPU\translate('No_data_to_show')}}</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
      
        $(document).ready(function(){

            $('.deleted').submit(function(e){

                var myId = $(this).attr('id');

                Swal.fire({
                title: '{{ \App\CPU\translate('Are_you_sure_delete_this_brand')}}?',
                text: "{{ \App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{ \App\CPU\translate('Yes')}}, {{ \App\CPU\translate('delete_it')}}!',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: '/admin/brands/delete/' + myId +'',
                        method: 'GET',
                        success: (response) => {
                           
                           Swal.fire(
                           'تم حذف القسم بنجاح',
                           )
   
                           location.reload;
                              
                           }
                    });
                }
            })

            })


        });
    </script>

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
                alert('Image has been uploaded successfully');
            }
        },
        error: function(response){
            $('#image-input-error').text(response.responseJSON.message);
        }
   });
});
  
</script>
@endpush
