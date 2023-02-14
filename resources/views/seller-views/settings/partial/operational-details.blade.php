
@extends('layouts.back-end.app-seller')

@section('title', 'الاعدادات')

@push('css_or_js')

<style>

    #delivery_select {

        display:none;

    }


    #seller_delivery_man {

        display:none;
    }
</style>

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">الاعدادات</h1>
                </div>
                @php($shop=\App\Model\Shop::where(['seller_id'=>auth('seller')->id()])->first())

                @isset($shop)
                <strong>{{$shop->name}}</strong>
                @endisset
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-12">
                @include('seller-views.settings.sidebar')
            </div>
            <div class="col-md-8 col-12">
            <table class="table table-hover text-center">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">الاسم</th>
                    <th scope="col">رقم الهاتف</th>
                    <th scope="col">مناطق التغطية</th>
                    <th scope="col">الحالة</th>
                    </tr>
                </thead>
                @php($i = 1)
                <tbody>
                    @foreach($delviery as $val)
                    <tr>
                    <th scope="row">{{$i++}}</th>
                    <td>{{$val->f_name.' '.$val->l_name}}</td>
                    <td>{{$val->phone}}</td>
                    @php($first = json_decode($val->zone_id,true))
                    <td>
                        @foreach($first as $f)

                        @php($city = DB::table('cities')->where('id', '=', $f)->first())
                        <span style="padding:0 2px">{{$city->name}},</span>
                        @endforeach
                    </td>
                    
                    @php($branch=DB::table('branche')->where(['seller_id'=>auth('seller')->id()])->first())
                    <td> 
                    <div>
                        @isset($branch->default_delivery)
                        <input type="checkbox" class="status automaticOrdersDelete" name="automaticOrders"  id="{{$val->id}}" checked>
                        @endisset

                        @empty($branch->default_delivery)
                        <input type="checkbox" class="status automaticOrders" name="automaticOrders" id="{{$val->id}}">
                        @endempty
                       
                        </td>
                        </div>
                    </tr>
                    @endforeach
                  
                </tbody>
            </table>
            
            </div>
        </div>

    </div>

@endsection
