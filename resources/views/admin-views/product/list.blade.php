@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Product List'))

@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid">  <!-- Page Heading -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{\App\CPU\translate('Products')}}</li>
        </ol>
    </nav>

    <div class="row" style="margin-top: 20px">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="row flex-between justify-content-between align-items-center flex-grow-1">
                        <div class="col-12 mb-1 col-md-4">
                            <h5 class="flex-between">
                                <div>{{\App\CPU\translate('product_table')}} ({{ $pro->total() }})</div>
                            </h5>
                        </div>
                        <div class="col-12 mb-1 col-md-5" style="width: 40vw">
                            <!-- Search -->
                            <form action="{{ url()->current() }}" method="GET">
                                <div class="input-group input-group-merge input-group-flush">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="tio-search"></i>
                                        </div>
                                    </div>
                                    <input id="datatableSearch_" type="search" name="search" class="form-control"
                                           placeholder="{{\App\CPU\translate('Search Product Name')}}" aria-label="Search orders"
                                           value="" required>
                                    <input type="hidden" value="" name="status">
                                    <button type="submit" class="btn btn-primary">{{\App\CPU\translate('search')}}</button>
                                </div>
                            </form>
                            <!-- End Search -->
                        </div>
                        <div class="col-12 col-md-3">
                            <a href="{{route('admin.product.add-new')}}" class="btn btn-primary  float-right">
                                <i class="tio-add-circle"></i>
                                <span class="text">{{\App\CPU\translate('Add new product')}}</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body" style="padding: 0">
                    <div class="table-responsive">
                        <table id="datatable" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                               class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               style="width: 100%">
                            <thead class="thead-light">
                            <tr>
                                <th>{{\App\CPU\translate('SL#')}}</th>
                                <th>{{\App\CPU\translate('Product Name')}}</th>
                                <th>{{\App\CPU\translate('category')}}</th>
                                <th>{{\App\CPU\translate('purchase_price')}}</th>
                                <th>{{\App\CPU\translate('selling_price')}}</th>
                                <th>{{\App\CPU\translate('seller')}}</th>
                                <th>{{\App\CPU\translate('featured')}}</th>
                                <th>{{\App\CPU\translate('Active')}} {{\App\CPU\translate('status')}}</th>
                                <th style="width: 5px" class="text-center">{{\App\CPU\translate('Action')}}</th>
                            </tr>
                            </thead>
                            <tbody>

                            @php 
                               $i = 1
                            @endphp

                            @foreach($pro as $p)

                            @php
                                $seller = App\Model\Seller::where('id', '=', $p->user_id)->first()
                            @endphp

                                <tr>
                                    <th scope="row">{{$i++}}</th>
                                    <td>
                                        <a href="{{route('admin.product.view',['id' => $p->id])}}">
                                            @isset($p->name)
                                            {{$p->name}}
                                            @endisset

                                            @empty($p->name)

                                            @php($brand = App\Model\Brand::where('id', '=', $p->brand_id)->first())

                                           {{$brand->name}} {{$p->product_type}}
                                            @endempty
                                        </a>
                                    </td>
                                    @php($category = App\Model\Category::where('id', '=', $p->category_ids)->first())
                                    <td>{{$category->name}}</td>
                                    <td>
                                       {{$p->purchase_price.'.00 ريال'}}
                                    </td>
                                    <td>
                                    {{$p->unit_price.'.00 ريال'}}
                                    </td>

                                    <td>
                                    @isset($seller->f_name)
                                    {{$seller->f_name}} {{$seller->l_name}}
                                    @endisset
                                    
                                    @empty($seller->f_name)
                                        الادارة
                                    @endempty
                                    </td>
                                    <td>
                                        <label class="switch">
                                            <input type="checkbox"
                                                   onclick="featured_status('{{$p['id']}}')" {{$p->featured == 1?'checked':''}}>
                                            <span class="slider round"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="switch switch-status">
                                            <input type="checkbox" class="status"
                                                   id="{{$p['id']}}" {{$p->status == 1?'checked':''}}>
                                            <span class="slider round"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <a class="btn btn-info btn-sm"
                                            title="{{\App\CPU\translate('view')}}"
                                           href="{{route('admin.product.view',[$p['id']])}}">
                                            <i class="tio-visible"></i>
                                        </a>
                                        <a class="btn btn-primary btn-sm"
                                            title="{{\App\CPU\translate('Edit')}}"
                                            href="{{route('admin.product.edit',[$p['id']])}}">
                                            <i class="tio-edit"></i>
                                        </a>
                                    

                                        <form action="{{route('admin.products.delete')}}" method="post" class="productDeleted" style="display:inline">
                                            @csrf
                                            <input type="hidden" name="myId" value="{{$p->id}}">
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
                    {{$pro->links()}}
                </div>
                @if(count($pro)==0)
                    <div class="text-center p-4">
                        <img class="mb-3" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
                        <p class="mb-0">{{\App\CPU\translate('No data to show')}}</p>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
    <!-- Page level plugins -->
    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Page level custom scripts -->
    <script>
        // Call the dataTables jQuery plugin
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });

        $(document).on('change', '.status', function () {
            var id = $(this).attr("id");
            if ($(this).prop("checked") == true) {
                var status = 1;
            } else if ($(this).prop("checked") == false) {
                var status = 0;
            }
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.product.status-update')}}",
                method: 'POST',
                data: {
                    id: id,
                    status: status
                },
                success: function (data) {
                    if(data.success == true) {
                        toastr.success('{{\App\CPU\translate('Status updated successfully')}}');
                    }
                    else if(data.success == false) {
                        toastr.error('{{\App\CPU\translate('Status updated failed. Product must be approved')}}');
                        setTimeout(function(){
                            location.reload();
                        }, 2000);
                    }
                }
            });
        });

        function featured_status(id) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.product.featured-status')}}",
                method: 'POST',
                data: {
                    id: id
                },
                success: function () {
                    toastr.success('{{\App\CPU\translate('Featured status updated successfully')}}');
                }
            });
        }


        $(document).ready(function(){

            $('.productDeleted').click(function(e){
                e.preventDefault();
                let formData = new FormData(this);
                let myId = $(this).attr('id');

                $.ajax({
                        type:'POST',
                        data: formData,
                        contentType: false,
                        processData: false,
                        url: "{{route('admin.products.delete')}}",
                        success: (response) => {
                            if (response) {
                                Swal.fire(
                                    'تم حذف المنتج',
                                    )

                                    window.location.href = '/admin/product/list/seller'
                                    
                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });

                // console.log(myId);

            });

        });

    </script>
@endpush
