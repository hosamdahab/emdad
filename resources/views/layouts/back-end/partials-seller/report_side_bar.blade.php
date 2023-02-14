<style>
    .navbar-vertical .nav-link {
        color: #041562;

    }

    .navbar .nav-link:hover {
        color: #041562;
    }

    .navbar .active > .nav-link, .navbar .nav-link.active, .navbar .nav-link.show, .navbar .show > .nav-link {
        color: #F14A16;
    }

    .navbar-vertical .active .nav-indicator-icon, .navbar-vertical .nav-link:hover .nav-indicator-icon, .navbar-vertical .show > .nav-link > .nav-indicator-icon {
        color: #F14A16;
    }

    .nav-subtitle {
        display: block;
        color: #041562;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .03125rem;
    }

    .side-logo {
        background-color: #ffffff;
    }

    .nav-sub {
        background-color: #ffffff!important;
    }

    .nav-indicator-icon {
        margin-left: {{Session::get('direction') === "rtl" ? '6px' : ''}};
    }

    .nav-tabs > li , .nav-tabs > li a i{

        padding:0 5px
    }
</style>
<div id="sidebarMain" class="d-none">
    <aside
        style="background: #ffffff!important; text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
        class="js-navbar-vertical-aside navbar navbar-vertical-aside navbar-vertical navbar-vertical-fixed navbar-expand-xl navbar-bordered  ">
        <div class="navbar-vertical-container">
            <div class="navbar-vertical-footer-offset" style="padding-bottom: 0">
                <div class="navbar-brand-wrapper justify-content-between side-logo">
                    <!-- Logo -->
                    @php($shop=\App\Model\Shop::where(['seller_id'=>auth('seller')->id()])->first())
                    <a class="navbar-brand" href="{{route('seller.dashboard.index')}}" aria-label="Front">
                        @if (isset($shop))
                            <!--<img onerror="this.src='http://localhost/sare/storage/app/public/company/2022-06-20-62b0d4a963f4e.png'"-->
                            <!--    class="navbar-brand-logo-mini for-seller-logo"-->
                            <!--    src="{{asset("storage/app/public/shop/$shop->image")}}" alt="Logo">-->
                            <h1 style="color: #645cb3;font-weight:bold;font-size: 30px;">امداد</h1>
                        @else
                            <img class="navbar-brand-logo-mini for-seller-logo"
                                src="http://localhost/sare/storage/app/public/company/2022-06-20-62b0d4a963f4e.png" alt="Logo" style="width: 5rem !important;height: 4rem !important">
                        @endif
                    </a>
                    <!-- End Logo -->

                    <!-- Navbar Vertical Toggle -->
                    <button type="button"
                            class="js-navbar-vertical-aside-toggle-invoker navbar-vertical-aside-toggle btn btn-icon btn-xs btn-ghost-dark">
                        <i class="tio-clear tio-lg"></i>
                    </button>
                    <!-- End Navbar Vertical Toggle -->
                </div>

                <!-- Content -->
                <div class="navbar-vertical-content">
                    <div class="pt-3 pr-3 pb-3">
                        {{-- <div class="avatar avatar-sm avatar-circle">
                            <img class="avatar-img"
                                 onerror="this.src='{{asset('public/assets/back-end/img/160x160/img1.jpg')}}'"
                                 src="{{asset('storage/app/public/seller/')}}/{{auth('seller')->user()->image}}"
                                 alt="Image Description">
                            <span class="avatar-status avatar-sm-status avatar-status-success"></span>
                        </div> --}}
                        {{-- <h4 class="pr-3 pt-1">{{auth('seller')->user()->f_name}} {{auth('seller')->user()->l_name}}</h4> --}}

                        <p><strong>الاسم:</strong>{{auth('seller')->user()->f_name}} {{auth('seller')->user()->l_name}}</p>
                        <p><strong>الوظيفة:</strong>Admin</p>
                        <p><strong>رقم الجوال:</strong>{{auth('seller')->user()->phone}}</p>
                    </div>

                    <ul class="navbar-nav navbar-nav-lg nav-tabs">
                        <!-- Dashboards -->

                        <li class="navbar-vertical-aside-has-menu {{Request::is('seller')?'show':''}}">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                               href="{{route('seller.dashboard.index')}}">
                               <i class="fa-solid fa-house-user fa-xl"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    {{\App\CPU\translate('Dashboard')}}
                                </span>
                            </a>
                        </li>
                        <!-- End Dashboards -->
                        @php($seller = auth('seller')->user())
                        <!-- POS -->
                        @php($sellerId = $seller->id)
                        @php($seller_pos=\App\Model\BusinessSetting::where('type','seller_pos')->first()->value)
                        @if ($seller_pos==1)
                            @if ($seller->pos_status == 1)
                                <li class="nav-item">
                                    <small
                                        class="nav-subtitle">{{\App\CPU\translate('pos')}} {{\App\CPU\translate('system')}} </small>
                                    <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                                </li>

                                <li class="navbar-vertical-aside-has-menu {{Request::is('admin/pos/*')?'active':''}}">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:">
                                        <i class="tio-shopping nav-icon"></i>
                                        <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">{{\App\CPU\translate('POS')}}</span>
                                    </a>
                                    <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                        style="display: {{Request::is('seller/pos/*')?'block':'none'}}">
                                        <li class="nav-item {{Request::is('seller/pos/')?'active':''}}">
                                            <a class="nav-link " href="{{route('seller.pos.index')}}"
                                            title="{{\App\CPU\translate('pos')}}">
                                                <span class="tio-circle nav-indicator-icon"></span>
                                                <span
                                                    class="text-truncate">{{\App\CPU\translate('pos')}}</span>
                                            </a>
                                        </li>
                                        <li class="nav-item {{Request::is('seller/pos/orders')?'active':''}}">
                                            <a class="nav-link " href="{{route('seller.pos.orders')}}" title="{{\App\CPU\translate('orders')}}">
                                                <span class="tio-circle nav-indicator-icon"></span>
                                                <span class="text-truncate">{{\App\CPU\translate('orders')}}
                                                <span class="badge badge-info badge-pill ml-1">
                                                    {{\App\Model\Order::where(['seller_is'=>'seller'])->where(['seller_id'=>$sellerId])->where('order_type','POS')->where(['order_status'=>'delivered'])->count()}}
                                                </span>
                                            </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            @endif
                        @endif

                        <!-- End POS -->

                        

   
                                    <li class="navbar-vertical-aside-has-menu {{Request::is('seller/sales/report')?'active':''}}">
                                        <a class="js-navbar-vertical-aside-menu-link nav-link" href="{{route('saller.sales.report')}}">
                                        <i class="fa-solid fa-sack-dollar fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('Sales')}}</span>
                                        </a>
                                    </li>
                                    
                                    <li class="navbar-vertical-aside-has-menu {{Request::is('seller/sales/refund/report')?'active':''}}">
                                        <a class="js-navbar-vertical-aside-menu-link nav-link " href="{{route('seller.sales.refund.report')}}">
                                        <i class="fa-solid fa-rotate-left fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('refund_request_list')}}</span>
                                        </a>
                                    </li>


                                    <li class="nav-item {{Request::is('seller/sales/deferred/report')?'active':''}}">
                                        <a class="nav-link " href="{{route('seller.deferred.sales.report')}}">
                                        <i class="fa-regular fa-clock fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('deferred_sale')}}</span>
                                        </a>
                                    </li>


                                    <!-- <li class="nav-item {{Request::is('seller/stock/report')?'active':''}}">
                                        <a class="nav-link " href="{{route('seller.stock.report')}}">
                                            <i class="fa-solid fa-cubes fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('stock')}}</span>
                                        </a>
                                    </li> -->


                                    <li class="nav-item {{Request::is('seller/delivery/report')?'active':''}}">
                                        <a class="nav-link " href="{{route('seller.delivery.report')}}">
                                            <i class="fa-solid fa-truck fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('delivery_report')}}</span>
                                        </a>
                                    </li>


                                    <li class="nav-item {{Request::is('seller/branch/report')?'active':''}}">
                                        <a class="nav-link " href="{{route('seller.branch.report')}}">
                                            <i class="fa-solid fa-location-crosshairs fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('branch_reports')}}</span>
                                        </a>
                                    </li>


                                    <li class="nav-item {{Request::is('seller/commissions/report')?'active':''}}">
                                        <a class="nav-link " href="{{route('seller.commissions.report')}}">
                                        <i class="fa-solid fa-coins fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('commissions')}}</span>
                                        </a>
                                    </li>


                                    <li class="nav-item {{Request::is('seller/wallet')?'active':''}}">
                                        <a class="nav-link " href="{{route('seller.wallet')}}">
                                        <i class="fa-solid fa-wallet fa-xl"></i>
                                            <span class="text-truncate">{{\App\CPU\translate('Wallet')}}</span>
                                        </a>
                                    </li>
                                    
                                
                       

                        <!-- End Pages -->                       


                    </ul>
                </div>
                <!-- End Content -->
            </div>
        </div>
    </aside>
</div>

