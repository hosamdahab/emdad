@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Sub Category'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('sub_category')}}</li>
            </ol>
        </nav>

        <!-- Content Row -->

        <div class="row" style="margin-top: 20px" id="cate-table">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">

                        <div class=" row flex-between justify-content-between align-items-center flex-grow-1">
                            <div class="col-12 col-md-7">
                                <h5>{{ \App\CPU\translate('sub_category_table')}} <span style="color: red;">({{ count($categories) }})</span></h5>
                            </div>
                            <div class="col-12 col-md-5" style="width: 40vw">
                                <!-- Search -->
                                <form action="{{ url()->current() }}" method="GET">
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch_" type="search" name="search" class="form-control"
                                            placeholder="{{\App\CPU\translate('Search_by_Sub_Category')}}" aria-label="Search orders" value="{{ $search }}" required>
                                        <button type="submit" class="btn btn-primary">{{\App\CPU\translate('search')}}</button>
                                    </div>
                                </form>
                                <!-- End Search -->
                            </div>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table style="text-align: center"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 100px">{{ \App\CPU\translate('ID')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('name')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('image')}}</th>
                                    <th scope="col">{{ \App\CPU\translate('slug')}}</th>
                                    <th scope="col">{{\App\CPU\translate('category')}}</th>
                                    <th scope="col" class="text-center" style="width: 80px">{{ \App\CPU\translate('action')}}</th>
                                </tr>
                                </thead>
                                <tbody>

                                @php 

                                $i = 1;

                                @endphp
                                @foreach($categories as $category)
                                    <tr>
                                        <td class="text-center">{{$i++}}</td>
                                        <td>{{$category->name}}</td>
                                        <td> <img class="rounded" width="64"
                                                 onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                 src="{{asset('sub_category/'.$category->icon)}}"></td>
                                        <td>{{$category->slug}}</td>
                                       

                                        @php

                                        $get_category = \App\Model\Category::where('id', '=', $category->parent_id)->first();

                                        @endphp

                                        <td>{{$get_category->name}}</td>
                                        <td>
                                            <a class="btn btn-primary btn-sm" style="cursor: pointer;"
                                                title="{{ \App\CPU\translate('Edit')}}"
                                               href="{{route('admins.sub.category.edit',['id' => $category->id])}}">
                                                <i class="tio-edit"></i> 
                                            </a>

                                            <form action="{{route('admins.sub.category.delete')}}" method="post" class="subCategoryDeleted" style="display:inline">
                                            @csrf
                                            <input type="hidden" name="myId" value="{{$category->id}}">
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
                        {{$categories->links()}}
                    </div>
                    @if(count($categories)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{\App\CPU\translate('No_data_to_show<')}}/p>
                        </div>
                    @endif
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
            // console.log(lang);
            $("#" + lang + "-form").removeClass('d-none');
            
        });

        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>

    <script>
        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: '{{\App\CPU\translate('Are_you_sure_to_delete_this_sub_category')}}?',
                text: "{{\App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
                showCancelButton: true,
                type: 'warning',
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{\App\CPU\translate('Yes')}}, {{\App\CPU\translate('delete_it')}}!',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.sub-category.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('{{\App\CPU\translate('Sub_Category_deleted_Successfully.')}}');
                            location.reload();
                        }
                    });
                }
            })
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

        $("#customFileEg1").change(function () {
            readURL(this);
        });
    </script>

    <script>
        $(document).ready(function(){

           $('.subCategoryDeleted').submit(function(e){
            let formData = new FormData(this);
            let myId = $(this).attr('name');

            $.ajax({
                        type:'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        url: "{{route('admins.sub.category.delete')}}",
                        success: (response) => {
                           
                        Swal.fire(
                        'تم حذف القسم بنجاح',
                        )

                        location.reload;
                           
                        }

                    });

            // console.log(myId);

           });
        })
    </script>
@endpush
