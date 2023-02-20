@extends('layouts.back-end.app-seller')

@section('title', \App\CPU\translate('Edit Shipping'))

@push('css_or_js')



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

                    {{__('messages.edit_delivery_man')}}

                </div>

                <div class="card-body">

                    <form action="{{route('seller.delivery.update')}}" id="update_delivery" method="post"

                          style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">

                        @csrf

                      

                        <input type="hidden" name="myId" value="{{$delivery->id}}">

                        <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="title">{{\App\CPU\translate('name')}}</label>

                                    <input type="text" name="f_name"  class="form-control" value="{{$delivery->f_name}}" placeholder="{{\App\CPU\translate('first_name')}}">

                                </div>

                            </div>

                        </div>





                        {{-- <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="title">{{\App\CPU\translate('name')}}</label>

                                    <input type="text" name="l_name"  class="form-control" value="{{$delivery->l_name}}" placeholder="{{\App\CPU\translate('last_name')}}">

                                </div>

                            </div>

                        </div> --}}





                        <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="duration">{{__('messages.mobile')}}</label>

                                    <input type="text" name="phone" value="{{$delivery->phone}}" class="form-control" placeholder="{{__('messages.mobile')}}">

                                </div>

                            </div>

                        </div>



                        @php 



                        $get_area = \App\Model\City::all();



                        @endphp

                        <div class="form-group">

                            <div class="row ">

                                <div class="col-md-12">

                                    <label for="duration">{{__('messages.areas')}}</label>

                                    <select name="zone_id" class="form-control" id="">

                                

                                    @foreach($get_area as $val)

                                    <option value="{{$val->id}}">{{$val->name}}</option>

                                    @endforeach

                                    </select>

                                    

                                </div>

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



  

@endpush

