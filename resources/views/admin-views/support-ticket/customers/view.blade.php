@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('customers_messages'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header mb-1">
            <div class="flex-between align-items-center">
                <div>
                    <h1 class="page-header-title">{{\App\CPU\translate('customers_messages')}}<span
                            class="badge badge-soft-dark mx-2"></span></h1>
                </div>
                <div>
                    <i class="tio-shopping-cart" style="font-size: 30px"></i>
                </div>
            </div>
            <!-- End Row -->

            <!-- Nav Scroller -->
            <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <span class="hs-nav-scroller-arrow-prev" style="display: none;">
              <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                <i class="tio-chevron-left"></i>
              </a>
            </span>

                <span class="hs-nav-scroller-arrow-next" style="display: none;">
              <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                <i class="tio-chevron-right"></i>
              </a>
            </span>

              
            </div>
            <!-- End Nav Scroller -->
        </div>
        <!-- End Page Header -->

        <!-- Card -->
        <div class="card">
          

            <!-- Table -->
            <div class="table-responsive datatable-custom" style="width: 100%; text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}}">
               <form action="{{route('admin.customer.message.store')}}" method="post">
                @csrf
               @php($get_customer = DB::table('users')->where('id', '=', $Customers_Chat->user_id)->first())
                <div class="card-header" style="background:#ddd;padding:0">
                <p style="margin:1rem;font-weight:700">{{\App\CPU\translate('Customer Name')}} : {{$get_customer->f_name . ' ' . $get_customer->l_name}}</p>
                </div>
                       
                @php($myDate = date('Y-m-d', strtotime($Customers_Chat->created_at))) 
                <textarea class="form-control" disabled style="min-height:25rem;max-height:25rem">
                {{$get_customer->f_name . ' ' . $get_customer->l_name}} :{{$Customers_Chat->message}}</textarea>     
                <div style="display:flex">

                <textarea name="message" class="form-control"  id="message" required style="margin-top:1rem;position:relative;min-height:1rem;max-height:1rem;background:#fff;padding:1rem 0 1rem 1rem;max-height:1rem;width:100%"></textarea>
                <button style="position:absolute;bottom:2.3rem;left:0.5rem;border:none;background:inherit" type="submit"><i class="fa-solid fa-plus"></i></button>
                </div>
                </form>   
            </div>
            <!-- End Table -->

            <!-- Footer -->
            <div class="card-footer">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-sm-auto">
                        <div class="d-flex justify-content-center justify-content-sm-end">
                            <!-- Pagination -->
                            
                        </div>
                    </div>
                </div>
                <!-- End Pagination -->
            </div>
            <!-- End Footer -->
        </div>
        <!-- End Card -->
    </div>
@endsection

@push('script_2')
    <script>
        function filter_order() {
            $.get({
                url: '{{route('admin.orders.inhouse-order-filter')}}',
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    toastr.success('{{\App\CPU\translate('order_filter_success')}}');
                    location.reload();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        };
    </script>

<script>
            $(document).ready(function(){


                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $('.pending_del').click(function(e) {
                    e.preventDefault();

                   var myId =  $(this).attr('id');

                   $.ajax({
                        type:'GET',
                        url: '/admin/pending-products/delete/'+ myId + "",
                        success: (response) => {
                           
                        Swal.fire(
                        'تم بنجاح',
                        )
                        window.location.reload;
                           
                        }

                    });

                   
                });



            
                $('#adminPendingProEdit').submit(function(e) {
                    e.preventDefault();
                    let formData = new FormData(this);
                    $('#image-input-error').text('');
                    var myId =  $('#myId').attr('id');

                    $.ajax({
                        type:'POST',
                        url: '/admin/pending-product/update/' + myId + '',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: (response) => {
                            if (response) {
                                this.reset();
                                alert('Product Updated successfully');
                            }
                        },
                        error: function(response){
                            $('#image-input-error').text(response.responseJSON.message);
                        }
                });
                });

            });

        


        </script>
        

@endpush
