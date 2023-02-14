@extends('layouts.back-end.app-seller')

@section('title', 'اعدادات المنشاة')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
@endpush

@section('content')
    <!-- Content -->
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-end">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{__('messages.building')}}</h1>
                </div>

                <div class="col-sm-auto">
                    <a class="btn btn-primary" href="{{ route('seller.dashboard.index') }}">
                        <i class="tio-home mr-1"></i> {{ \App\CPU\translate('Dashboard') }}
                    </a>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->

        <div class="row">
            <div class="col-lg-3">
                <!-- Navbar -->
                <div class="navbar-vertical navbar-expand-lg mb-3 mb-lg-5">
                    <!-- Navbar Toggle -->
                    <button type="button" class="navbar-toggler btn btn-block btn-white mb-3"
                        aria-label="Toggle navigation" aria-expanded="false" aria-controls="navbarVerticalNavMenu"
                        data-toggle="collapse" data-target="#navbarVerticalNavMenu">
                        <span class="d-flex justify-content-between align-items-center">
                            <span class="h5 mb-0">{{ \App\CPU\translate('Nav menu') }}</span>

                            <span class="navbar-toggle-default">
                                <i class="tio-menu-hamburger"></i>
                            </span>

                            <span class="navbar-toggle-toggled">
                                <i class="tio-clear"></i>
                            </span>
                        </span>
                    </button>
                    <!-- End Navbar Toggle -->
                </div>
                <!-- End Navbar -->
            </div>

            <div class="col-12">

                
                <div class="row">

                    <div class="col-md-6 col-md m-auto col-12">
                        <form action="{{ route('seller.branche.updated') }}" method="post"
                            enctype="multipart/form-data" id="seller-branche-updated">
                            @csrf

                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <div class="card-header">
                                    <h2 class="card-title h4">{{__('messages.building')}}</h2>
                                </div>

                                
                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form -->
                                    <!-- Form Group -->
                                    <div class="row form-group">
                                       

                                        <div class="col-sm-12 row">
                                            <div class="col-md-12">
                                                <label for="name">
                                                    {{ \App\CPU\translate('Name') }}</label>
                                                <input type="text" name="branche_name" 
                                                    class="form-control" value="{{$get_branche->branche_name}}" id="branche_name" required>
                                            </div>
                                           
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="row form-group">
                                       
                                        <div class="col-sm-12">
                                        <label for="name">
                                                    {{ __('messages.company_email') }}</label>
                                            <input type="email" value="{{$get_branche->email}}" class="js-masked-input form-control" name="email"
                                                id="phoneLabel">
                                        </div>
                                    </div>
                                    <!-- End Form Group -->





                                      <!-- Form Group -->
                                      <div class="row form-group">
                                       
                                       <div class="col-sm-6">
                                       <label for="name">
                                            {{ __('messages.business_type') }}</label>
                                            <select name="business_type" id="" class="form-control">
                                            <option value="البقالات">{{__('messages.markets')}}</option>
                                            <option value="المطاعم">{{__('messages.resutrans')}}</option>
                                            <option value="المقاهي">{{__('messages.coffe')}}</option>
                                            <option value="الفنادق">{{__('messages.hotels')}}</option>
                                            <option value="القاعات">{{__('messages.halls')}}</option>
                                            <option value="الكفتيريا">{{__('messages.sub_coffe')}}</option>
                                            <option value="المدارس">{{__('messages.schools')}}</option>
                                            <option value="المكاتب">{{__('messages.libary')}}</option>
                                           </select>
                                       </div>

                                       <div class="col-sm-6">
                                       <label for="name">
                                                   {{ __('messages.business_size') }}</label>
                                            <select name="business_size" id="" class="form-control">
                                            <option value="1">{{__('messages.one_branche')}}</option>
                                            <option value="2">{{__('messages.two_branch')}}</option>
                                            <option value="3">{{__('messages.three_branch')}}</option>

                                           </select>
                                       </div>
                                   </div>
                                   <!-- End Form Group -->


                                    
                                    <div class="row form-group">
                                        <label for="newEmailLabel"
                                            class="col-sm-3 col-form-label input-label">{{ __('messages.tax_no') }}</label>

                                        <div class="col-sm-12">
                                            <input type="text"  class="form-control" name="tax_no" id="newEmailLabel"
                                                
                                                placeholder="{{ __('messages.tax_no') }}"
                                                aria-label="Enter new email address">
                                        </div>
                                    </div>


                                

                                    <div class="row form-group">
                                        <label for="newEmailLabel"
                                            class="col-sm-3 col-form-label input-label">{{ __('messages.tax_no_res') }}</label>

                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name="commercial_no" id="newEmailLabel"
                                                
                                                placeholder="{{ __('messages.tax_no_res') }}"
                                                aria-label="Enter new email address">
                                        </div>
                                    </div>
                                    
                                 
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Save changes') }}
                                        </button>
                                    </div>

                                    <!-- End Form -->
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </form>
                    </div>

               
                </div>
               
            </div>
            <!-- Sticky Block End Point -->
            <div id="stickyBlockEndPoint"></div>
        </div>
    </div>
    <!-- End Row -->
    </div>
    <!-- End Content -->
@endsection

@push('script')
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('public/assets/back-end') }}/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script
        src="{{ asset('public/assets/back-end') }}/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js">
    </script>

<script>
     

$(document).ready(function(){



        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

    $('#seller-branche-updated').submit(function(e) {


        e.preventDefault();
        let formData = new FormData(this);
        $('#image-input-error').text('');

        $.ajax({
            type:'POST',
            url: "{{ route('seller.branche.updated') }}",
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    this.reset();
                    Swal.fire(
                        'تم تعديل بيانات المنشاة بنجاح',
                        'success'
                        )
                }
            },
            error: function(response){
               
                Swal.fire(
                        'لم يتم تعديل بيانات المنشاة بنجاح',
                        'danger'
                    )
            }
        }); 

    });

});

      
</script>
@endpush
@push('script_2')
   


   

    
   

  
@endpush

@push('script')
@endpush
