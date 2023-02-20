@extends('layouts.back-end.app-seller')

@section('title', \App\CPU\translate('Edit Shipping'))

@push('css_or_js')



<link href="{{ asset('assets/back-end') }}/css/select2.min.css" rel="stylesheet" />

@endpush



@section('content')

<div class="content container-fluid">

    <!-- Page Heading -->

    <div class="d-sm-flex align-items-center justify-content-between mb-2">

        <h1 class="h3 mb-0 text-black-50">{{\App\CPU\translate('shipping_method')}} {{\App\CPU\translate('update')}}</h1>

    </div>



    <!-- Content Row -->

    <div class="row">

        <div class="col-md-12">

            <div class="card">

                <div class="card-header text-capitalize">

                    {{__('messages.add_delivery_man')}}

                </div>

                <div class="card-body">

                    <form action="{{route('seller.store.delivery')}}" id="store_delivery" method="post"

                          style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">

                        @csrf

                      

                        <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="title">{{\App\CPU\translate('first_name')}}</label>

                                    <input type="text" name="f_name"  class="form-control" placeholder="{{\App\CPU\translate('first_name')}}">

                                </div>

                            </div>

                        </div>





                        {{-- <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="title">{{\App\CPU\translate('last_name')}}</label>

                                    <input type="text" name="l_name"  class="form-control" placeholder="{{\App\CPU\translate('last_name')}}">

                                </div>

                            </div>

                        </div> --}}





                        {{-- <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="title">{{\App\CPU\translate('password')}}</label>

                                    <input type="password" name="password"  class="form-control" placeholder="{{\App\CPU\translate('password')}}">

                                </div>

                            </div>

                        </div> --}}





                        <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="duration">{{__('messages.mobile')}}</label>

                                    <input type="text" name="phone"  class="form-control" placeholder="{{__('messages.mobile')}}">

                                </div>

                            </div>

                        </div>



                        @php 



                        $getCity = \App\Model\City::all();



                        @endphp



        



                            <div class="form-group">

                                <div class="form-group p-0 m-0">

                                        <label class="input-label js-example-responsive"

                                        for="places">{{ __('messages.States') }}</label>

                                        <select class="form-control places" name="zone_id[]" id="places" multiple="multiple">

                                        @foreach($getCity as $val)

                                        <option value="{{$val->id}}">{{$val->name}}</option>

                                        @endforeach

                                        </select>

                                </div>

                            </div>





                        <div class="card-footer">

                            <button type="submit" class="btn btn-primary float-{{Session::get('direction') === "rtl" ? 'left' : 'right'}}">{{\App\CPU\translate('Save')}}</button>

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



$(document).ready(function(){





    $('.places').select2({



        placeholder: 'Select',

        allowClear: true



    });



    $('.places').change(function(){



        console.log('good');



    });

})

</script>

@endpush

