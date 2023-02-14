
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
            <div class="col-md-4 col-12">
                @include('seller-views.settings.sidebar')
            </div>
            <div class="col-md-8 col-12">
                <div class="card">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">تعديل بيانات موظف</h5>
                </div>
                    <div class="card-body">
                    <form action="{{route('seller.update.employees')}}" method="post" id="seller_edit_employees">
                @csrf

                <input type="hidden" name="myId" value="{{$employees->id}}">
                <div class="form-group">
                    <input type="text" class="form-control rounded-pill" name="name" value="{{$employees->name}}" placeholder="اسم الموظف">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control rounded-pill" name="phone" value="{{$employees->phone}}" placeholder="رقم الموظف">
                </div>

                <div class="form-group">
                    <input type="email" class="form-control rounded-pill" name="email" value="{{$employees->email}}" placeholder="البريد الالكتروني">
                </div>

                <div class="form-group">
                    <select name="branch_id" id="" class="form-control rounded-pill">
                        <option value="الفرع الرئيسي">الفرع الرئيسي</option>
                        @foreach($branche as $b) 
                            <option value="{{$b->id}}">{{$b->branche_name}}</option>
                        @endforeach
                    </select>
                </div>


                <div class="form-group">
                    <select name="position" class="form-control rounded-pill">
                        <option selected>اختر الصلاحية</option>
                        <option value="مالك">مالك</option>
                        <option value="مدير">مدير</option>
                        <option value="مراجع">مراجع</option>
                        <option value="محاسب">محاسب</option>
                    </select>
                </div>
               
                <div class="modal-footer">
                <button type="submit" class="btn btn-primary">حفظ</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
            </div>
            </form>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">اضافة موظف</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
            <form action="{{route('seller.store.employees')}}" method="post" id="seller_add_employees">
                @csrf
            <input type="hidden" name="branch_id" id="branch_id_add_employees">
                <div class="form-group">
                    <input type="text" class="form-control rounded-pill" name="name" placeholder="اسم الموظف">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control rounded-pill" name="phone" placeholder="رقم الموظف">
                </div>

                <div class="form-group">
                    <input type="email" class="form-control rounded-pill" name="email" placeholder="البريد الالكتروني">
                </div>

                <div class="form-group">
                    <select name="position" class="form-control rounded-pill">
                        <option selected>اختر الصلاحية</option>
                        <option value="مالك">مالك</option>
                        <option value="مدير">مدير</option>
                        <option value="مراجع">مراجع</option>
                        <option value="محاسب">محاسب</option>
                    </select>
                </div>
               
                <div class="modal-footer">
                <button type="submit" class="btn btn-primary">حفظ</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
            </div>
            </form>
            </div>
           
        </div>
        </div>
    </div>

@endsection

@push('script_2')
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.min.js"></script>

<script>
    $('.select2').select2({
        data: ["فرع صنعاء", "فرع شبوة"],
        tags: true,
        maximumSelectionLength: 10,
        tokenSeparators: [',', ' '],
        placeholder: "اختر الفروع",
        //minimumInputLength: 1,
        //ajax: {
       //   url: "you url to data",
       //   dataType: 'json',
        //  quietMillis: 250,
        //  data: function (term, page) {
        //     return {
        //         q: term, // search term
        //    };
       //  },
       //  results: function (data, page) {
       //  return { results: data.items };
      //   },
      //   cache: true
       // }
    });
</script>

@endpush
