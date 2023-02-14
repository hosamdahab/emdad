
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
                <strong>{{$shop->name}}</strong>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 col-12">
                @include('seller-views.settings.sidebar')
            </div>
            <div class="col-md-8 col-12">
                <form action="{{route('seller.work.time.update')}}" method="post" id="workTime_update">
                    @csrf
                <div class="card">
                    <div class="card-header">
                        <h3>اوقات العمل</h3>
                     
                    </div>
                    <div class="card-body">
                        <div class="form-group d-flex justify-content-around">
                            <span>السبت</span>
                            <label class="switch">
                                @if(isset($saturday))
                                <input type="checkbox" class="status" id="saturday" checked>
                                @else
                                <input type="checkbox" class="status" id="saturday">
                                @endif
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" name="saturday" id="saturdayInput">
                            <span>مفتوح من</span>
                            @if(isset($saturday))
                            <input type="time" class="form-control w-25" name="saturday_from_time" id="saturday_from_time" value="{{$saturday->from_hours.':'.$saturday->from_minutes}}">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="saturday_to_time" id="saturday_to_time" value="{{$saturday->to_hours.':'.$saturday->to_minutes}}">
                            @else
                            <input type="time" class="form-control w-25" name="saturday_from_time" id="saturday_from_time">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="saturday_to_time" id="saturday_to_time">
                            @endif
                        </div>

                        <div class="form-group d-flex justify-content-around">
                            <span>الاحد</span>
                            <label class="switch">
                                @if(isset($sunday))
                                <input type="checkbox" class="status" id="sunday" checked>
                                @else
                                <input type="checkbox" class="status" id="sunday">
                                @endif
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" name="sunday" id="sundayInput">
                            <span>مفتوح من</span>
                            @if(isset($sunday))
                            <input type="time" class="form-control w-25" name="sunday_from_time" id="sunday_from_time" value="{{$sunday->from_hours.':'.$sunday->from_minutes}}">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="sunday_to_time" id="sunday_to_time" value="{{$sunday->to_hours.':'.$sunday->to_minutes}}">
                            @else
                            <input type="time" class="form-control w-25" name="sunday_from_time" id="sunday_from_time">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="sunday_to_time" id="sunday_to_time">
                            @endif
                        </div>

                        <div class="form-group d-flex justify-content-around">
                            <span>الاثنين</span>
                            <label class="switch">
                                @if(isset($monday))
                                <input type="checkbox" class="status" id="monday" checked>
                                @else
                                <input type="checkbox" class="status" id="monday">
                                @endif
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" name="monday" id="mondayInput">
                            <span>مفتوح من</span>
                            @if(isset($monday))
                            <input type="time" class="form-control w-25" name="monday_from_time" id="monday_from_time" value="{{$monday->from_hours.':'.$monday->from_minutes}}">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="monday_to_time" id="monday_to_time" value="{{$monday->to_hours.':'.$monday->to_minutes}}">
                            @else
                            <input type="time" class="form-control w-25" name="monday_from_time" id="monday_from_time">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="monday_to_time" id="monday_to_time">
                            @endif
                        </div>

                        <div class="form-group d-flex justify-content-around">
                            <span>الثلاثاء</span>
                            <label class="switch">
                                @if(isset($tuesday))
                                <input type="checkbox" class="status" id="tuesday" checked>
                                @else
                                <input type="checkbox" class="status" id="tuesday">
                                @endif
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" name="tuesday" id="tuesdayInput">
                            <span>مفتوح من</span>
                            @if(isset($tuesday))
                            <input type="time" class="form-control w-25" name="tuesday_from_time" id="tuesday_from_time" value="{{$tuesday->from_hours.':'.$tuesday->from_minutes}}">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="tuesday_to_time" id="tuesday_to_time" value="{{$tuesday->to_hours.':'.$tuesday->to_minutes}}">
                            @else
                            <input type="time" class="form-control w-25" name="tuesday_from_time" id="tuesday_from_time">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="tuesday_to_time" id="tuesday_to_time">
                            @endif
                        </div>

                        <div class="form-group d-flex justify-content-around">
                            <span>الاربعاء</span>
                            <label class="switch">
                                @if(isset($wednesday))
                                <input type="checkbox" class="status" id="wednesday" checked>
                                @else
                                <input type="checkbox" class="status" id="wednesday">
                                @endif
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" name="wednesday" id="wednesdayInput">
                            @if(isset($wednesday))
                            <span>مفتوح من</span>
                            <input type="time" class="form-control w-25" name="wednesday_from_time" id="wednesday_from_time" value="{{$wednesday->from_hours.':'.$wednesday->from_minutes}}">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="wednesday_to_time" id="wednesday_to_time" value="{{$wednesday->to_hours.':'.$wednesday->to_minutes}}">
                            @else

                            <span>مفتوح من</span>
                            <input type="time" class="form-control w-25" name="wednesday_from_time" id="wednesday_from_time">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="wednesday_to_time" id="wednesday_to_time">

                            @endif
                        </div>

                        <div class="form-group d-flex justify-content-around">
                            <span>الخميس</span>
                            <label class="switch">
                                @if(isset($thursday))
                                <input type="checkbox" class="status" id="thursday" checked>
                                @else
                                <input type="checkbox" class="status" id="thursday">
                                @endif
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" name="thursday" id="thursdayInput">
                            @if(isset($thursday))
                            <span>مفتوح من</span>
                            <input type="time" class="form-control w-25" name="thursday_from_time" id="thursday_from_time"  value="{{$thursday->from_hours.':'.$thursday->from_minutes}}">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="thursday_to_time" id="thursday_to_time" value="{{$thursday->to_hours.':'.$thursday->to_minutes}}">
                            @else
                            <span>مفتوح من</span>
                            <input type="time" class="form-control w-25" name="thursday_from_time" id="thursday_from_time">
                            <span>الى</span>
                            <input type="time" class="form-control w-25" name="thursday_to_time" id="thursday_to_time">
                            @endif
                        </div>
                        <button type="submit" class="btn btn-primary">حفظ</button>
                    </div>
                   
                </div>
                
                </form>
            </div>
        </div>

    </div>

@endsection
