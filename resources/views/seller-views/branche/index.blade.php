@extends('layouts.back-end.app-seller')

@section('title',\App\CPU\translate('Add new branche'))

@push('css_or_js')
    <link href="{{asset('public/assets/back-end/css/tags-input.min.css')}}" rel="stylesheet">
    <link href="{{ asset('public/assets/select2/css/select2.min.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
  
    <div class="content container-fluid">
    <!-- Page Heading -->
    

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title" style="padding:20px"><i class="tio-add-circle-outlined"></i> إضافة فرع جديد</h1>
                </div>
                <div class="card-body">
                    <form action="{{route('seller.branches.store')}}" method="post" id="seller_branch_store"
                          style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                        @csrf
                            
                                <div class="col-md-12 col-12">
                                <div class="form-group">
                                    <label class="input-label" for="exampleFormControlInput1">{{\App\CPU\translate('manager_name')}}</label>
                                    <input type="text" name="manager_name" class="form-control" placeholder="Ex : manager_name" 
                                        required>
                                </div>
                           
                        </div>

                        <div class="col-md-12 col-12">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{\App\CPU\translate('phone_mobile')}}</label>
                                <input type="text" name="phone_mobile" class="form-control" placeholder="********967"   maxlength="9"
                                    required>
                            </div>
                        </div>

                    


                       
                       
                            <div class="col-md-12 col-12">
                                <div class="form-group">
                                    <label class="input-label"  for="exampleFormControlInput1">{{\App\CPU\translate('manager_phone')}}</label>
                                    <input type="text" name="manager_phone" class="form-control" maxlength="9"
                                        placeholder="********967"
                                        required>
                                </div>
                            </div>



                        @php 

                        $get_area = \App\Model\States::all();

                        @endphp
                       

                        <div class="col-md-12 col-12">
                        <div class="form-group">
                          
                                
                                    <label for="duration">المحافظة</label>
                                    <select name="states" class="form-control" id="">
                                   
                                    @foreach($get_area as $val)
                                    <option value="{{$val->name}}">{{$val->name}}</option>
                                    @endforeach
                                    </select>
                                    
                              
                            
                        </div>
                        </div>

                        

                     

                                    <hr>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary float-{{Session::get('direction') === "rtl" ? 'left' : 'right'}}">{{\App\CPU\translate('Save')}}</button>
                        </div>
                    </form>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script_2')
    <script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY') }}&libraries=places&callback=initialize&language=en&region=GB" async defer></script>
    <script src="{{asset('public/js/mapInput.js')}}"></script>
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

    <script src="{{asset('public/assets/back-end/js/spartan-multi-image-picker.js')}}"></script>
    <script type="text/javascript">
        $(function () {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'identity_image[]',
                maxCount: 5,
                rowHeight: '120px',
                groupClassName: 'col-2',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/back-end/img/400x400/img2.jpg')}}',
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('Please only input png or jpg type file', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('File size too big', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>
@endpush

