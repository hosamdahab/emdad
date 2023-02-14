@extends('layouts.back-end.app-seller')

@section('title', 'الاعدادات')

@push('css_or_js')

<style>
  /* Set height of body and the document to 100% to enable "full page tabs" */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 25%;
  border-radius:20px
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  display: none;
  padding: 30px 20px;
  height: 100%;
  background-color:#fdfdff;
  margin-top:50px
}

#tabsParent {

    display:flex;
    background-color:#fdfdff;
    padding:20px;
    display:flex;
    justify-content:space-around;
    box-shadow:5px 5px 5px -7px #000;
    border-radius:20px;


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

            <div class="col-12" id="tabsParent">
            <button id="tablink1" class="tablink" onclick="openPage('Home', this, '#fdfdff')" id="defaultOpen">الخدمات المفعلة</button>
            <button id="tablink2" class="tablink" onclick="openPage('News', this, '#fdfdff')">الخدمات</button>
            </div>

            <div id="Home" class="tabcontent">
            <h3>الخدمات المفعلة</h3>
    
           
            </div>

            <div id="News" class="tabcontent">
          
        
                <div class="row">
                    <section style="display:flex;justify-content:space-between;align-items:center" class="col-12">
                        <div>
                            <strong>هل تريد منح الموصلين عمولات</strong>
                        </div>

                    <div>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">نعم</button>
                    <button class="btn btn-danger">لا</button>
                    </div>
                    </section>


                    <!-- Modal 1 -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">هل تريد منح الموصلين عمولات</h1>
                        </div>
                        <div class="modal-body">
                        هل تريد منح الموصلين عمولات
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">الغاء</button>
                            <a href="{{route('seller.delivery.product.commissions')}}" class="btn btn-primary">عرض المنتجات</a>
                        </div>
                        </div>
                    </div>
                    </div>
                    <!-- Modal 1 -->
                </div>


                <br>

                <div class="row">
                    <section style="display:flex;justify-content:space-between;align-items:center" class="col-12">
                        <div>
                            <strong>هل تريد بيع المنتجات بالاجل</strong>
                        </div>

                    <div>
                    <button data-bs-toggle="modal" data-bs-target="#exampleModal1" class="btn btn-primary">نعم</button>
                    <button class="btn btn-danger">لا</button>
                    </div>
                    </section>

                      <!-- Modal 1 -->
                      <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel" style="text-decoration:underline">سياسة منصة امداد للبيع الاجل</h1>
                        </div>
                        <div class="modal-body">
                            <p style="font-size:17px">
                                لا يتم عرض البيع بالاجل لاي عميل ليس مطبق الاجراءات اللازمة للشراء بالاجل,
                                للشراء بالاجل يجب ان يكون لدي الشخص شهريات 10 فواتير تحمل كل فاتورة مبلغ لا يقل عن 100 الف.<br>
                                في اكتمال هذه الاجراءات يتم عرض البيع بالاجل له , و يجب علي العميل الالتزام بسداد المبلغ بعد اصدار الفاتورة ب 6 ايام,
                                في حال لا يلتزم العميل في سيخسر هذه الميرة لشراء اجل حتي يستكمل 10 فواتير نقدية .
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">الغاء</button>
                            <a href="{{route('seller.deferred.sale.pro')}}" class="btn btn-primary">عرض المنتجات</a>
                        </div>
                        </div>
                    </div>
                    </div>
                    <!-- Modal 1 -->

                </div>

              
                <br>

                <div class="row">
                    <section style="display:flex;justify-content:space-between;align-items:center" class="col-12">
                        <div>
                            <strong>هل تريد اضافة عمولات للعملاء عند شراء كميات</strong>
                        </div>

                    <div>
                    <button data-bs-toggle="modal" data-bs-target="#exampleModal3" class="btn btn-primary">نعم</button>
                    <button class="btn btn-danger">لا</button>
                    </div>
                    </section>

                     <!-- Modal 1 -->
                     <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">الغاء</button>
                            <a href="{{route('seller.commissions.sale.pro')}}" class="btn btn-primary">عرض المنتجات</a>
                        </div>
                        </div>
                    </div>
                    </div>
                    <!-- Modal 1 -->
                </div>

               

               
            </div>

         

          
            </div>
         
            
        </div>

      

    </div>


    <script>

function openPage(pageName, elmnt, color) {
  // Hide all elements with class="tabcontent" by default */
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Remove the background color of all tablinks/buttons
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }

  // Show the specific tab content
  document.getElementById(pageName).style.display = "block";

  // Add the specific color to the button used to open the tab content
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

    </script>
@endsection
