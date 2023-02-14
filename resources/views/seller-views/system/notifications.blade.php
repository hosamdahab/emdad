@extends('layouts.back-end.app-seller')

@section('title',\App\CPU\translate('Notification'))

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
        @foreach($Banner as $val)
        <div class="col-md-3">

            <div class="card" style="width:100%;">
                <img src="{{asset('banner/'.$val->photo)}}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">{{$val->title}}</h5>
                    
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        
        </div>
        @endforeach
    </div>
</div>
@endsection

@push('script_2')
    <script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY') }}&libraries=places&callback=initialize&language=en&region=GB" async defer></script>
    <script src="{{asset('public/js/mapInput.js')}}"></script>
 
@endpush

