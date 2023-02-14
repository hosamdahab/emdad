
@extends('layouts.back-end.app-seller')

@section('title', 'الاعدادات')

@push('css_or_js')

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
                <div class="card">
                <div class="card-header">
                        <h3>التنبيهات</h3>
                        
                    </div>
                    <div class="card-body" id="alert_card_body">
                    <div>
                                                <label class="switch">
                                                    <input type="checkbox" class="status" id="sound">
                                                    <span class="slider round"></span>
                                                </label>
                                                <span class="pr-3">تفعيل التنبيهات الصوتية</span>
                                            </div>
                                            <div>
                                                <label class="switch">
                                                    <input type="checkbox" class="status">
                                                    <span class="slider round"></span>
                                                </label>
                                                <span class="pr-3">تلقي اشعارات واتس اب عند الطلبات</span>
                                            </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

@endsection
