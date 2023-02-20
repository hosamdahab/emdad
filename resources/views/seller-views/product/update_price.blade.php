@extends('layouts.back-end.app-seller')



@section('title',\App\CPU\translate('update_price'))



@push('css_or_js')



<style>

    .top , .bottom{



        background-color:#fff;

    }





    .bottom {



        margin-top:3rem

    }



    /* .element {

  display: inline-flex;

  align-items: center;

} */

i.fa-camera {

  margin: 10px;

  cursor: pointer;

  font-size: 30px;

}

i:hover {

  opacity: 0.6;

}

input {

  display: none;

}

</style>





@endpush



@section('content')

    <div class="content container-fluid">

        <nav aria-label="breadcrumb">

            <ol class="breadcrumb">

                <li class="breadcrumb-item"><a href="{{route('seller.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>

                </li>

                <li class="breadcrumb-item" aria-current="page">{{__('messages.update_price')}}</li>



            </ol>

        </nav>



        <div class="top" style="padding:20px 0;border-radius:20px">

            <div class="row" style="align-items:center;justify-content:space-between">

                <div class="col-md-5" style="margin-right:2rem">

                    <h4>تحميل ملف المنتجات</h4>

                    <p>قم بتحميل ملف يحتوي علي كشف بجميع منتجاتك ثم قم بالتعديلات المطلوبة</p>

                </div>



                <div   class="col-md-5" style="display:flex;justify-content:end;margin-left:2rem">

                    <section style="background:#645cb3;width:8%;padding:10px;text-align:center;border-radius:50%;border:2px solid #645cb3">
                        
                    <a href="{{ Route('get_seller_prices') }}" target="-"><i class="fa-solid fa-upload fa-xl" style="color:#fff"></i></a>

                    </section>

                

                </div>

            </div>

        </div>



        <div class="bottom" style="padding:20px 0;border-radius:20px">

            <div class="row" style="margin-right:2rem">



                <div class="col-md-12">

                    <h4>رفع ملف التعديلات</h4>

                    <p>قم برفع الملف الذي يحتوي علي التعديلات الي قمت بها</p>

                </div>



                <div class="col-md-2" style="box-shadow:5px 5px 5px #ccc;text-align:center;margin:10px 0;padding:20px">

                    

                    <!-- Start Form Upload --> 

                    <form action="{{route('post_seller_prices')}}" id="excel_file" method="post" enctype="multipart/form-data">

                        @csrf

                        <div class="element">

                        <i id="file_new" class="fa-solid fa-upload fa-xl"></i><p class="name">ارفع ملف التعديلات</p>

                            <input type="file" name="file" id="file">

                        </div>

                    <button class="btn btn-primary" type="button"  id="excel_file_submit" >{{__('messages.save')}}</button>
                        

                    </form>

                    <!-- End Form Upload --> 

                </div>



                <div class="col-12"></div>

                <br>

                
                

            </div>

        </div>

       

    </div>

@endsection



@push('script')

    <!-- Page level plugins -->

    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/jquery.dataTables.min.js"></script>

    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js" crossorigin="anonymous"></script>

    <script>



$(document).ready(function() {



    

        $("#file_new").click(function () {

            $("input[type='file']").trigger('click');

            });



            $('input[type="file"]').on('change', function() {

            var val = $(this).val();

            $(this).siblings('span').text(val);



            $('#excel_file_submit').attr('type','submit');

        });





        $('#excel_file').submit(function(event){



            e.preventDefault();

           

           

            var formData = new FormData();

            

           



            $.ajax({

                type:'POST',

                url: "{{ route('seller.product.file.update') }}",

                data: formData,

                contentType: false,

                 processData: false,

                success:function(response){



                //    console.log(response.commission);



                location.reload();





                }, error:function(response) {



                    console.log('bad');



                }



            });



            

                

                

           



        });





});



        



    </script>

@endpush

