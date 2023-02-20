<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Seller\AddProRequestController;
use App\Http\Controllers\Seller\ProductController;
use App\Http\Controllers\Seller\DeliveryController;
use App\Http\Controllers\Seller\ProfileController;
use App\Http\Controllers\Seller\BrancheController;
use App\Http\Controllers\Seller\SettingController;
use App\Http\Controllers\Seller\DeliveryManController;
use App\Http\Controllers\Seller\WithdrawController;
use App\Http\Controllers\Seller\ReportsController;
use App\Http\Controllers\Seller\SystemController;


Route::post('request-products', [AddProRequestController::class,'request_products_store'])->middleware('seller')->name('seller.product.RequestProModel');
Route::post('/seller/product/add/new/product', [ProductController::class,'get_seller_product'])->middleware('seller')->name('get.seller.product');
Route::post('/seller/product/update-price/{id}', [ProductController::class,'seller_product_update_price'])->middleware('seller')->name('seller.product.update.product.price');

Route::get('/seller/product/update/price', [ProductController::class,'seller_product_update_price_file'])->middleware('seller')->name('seller.product.update.price.file');
Route::get('/seller/product/get/price', [ProductController::class,'get_seller_prices'])->middleware('seller')->name('get_seller_prices');
Route::post('/seller/product/get/price', [ProductController::class,'post_seller_prices'])->middleware('seller')->name('post_seller_prices');
Route::post('/seller/product/update/price', [ProductController::class,'updatePrice'])->middleware('seller')->name('updatePrice');
Route::post('/seller/product/update/price/file', [ProductController::class,'seller_product_update_price_file_update'])->middleware('seller')->name('seller.product.file.update');

Route::get('/seller/product/offers', [ProductController::class,'seller_product_offers'])->middleware('seller')->name('seller.product.offers');

Route::post('/seller/product/add-discount', [ProductController::class,'seller_add_product_discount'])->middleware('seller')->name('seller.add.product.discount');
Route::post('/seller/product/discount/delete', [ProductController::class,'seller_product_discount_delete'])->middleware('seller')->name('seller.product.discount.delete');


Route::post('/seller/product/add/offer', [ProductController::class,'seller_product_add_offer'])->name('seller.product.add.offer');
Route::post('/seller/product/offer/delete', [ProductController::class,'seller_product_offer_delete'])->name('seller.product.offer.delete');


Route::get('/seller/business-settings/shipping-method/add-new', [DeliveryController::class,'add_new'])->middleware('seller')->name('add.new.delivrey.man');
Route::post('/seller/business-settings/shipping-method/store', [DeliveryController::class,'seller_store_delivery'])->middleware('seller')->name('seller.store.delivery');

Route::post('/seller-order-accept', [DeliveryController::class,'seller_order_accept'])->middleware('seller')->name('seller.order.accept');


// Seller Profile Route 
Route::get('/seller/profile/edit', [ProfileController::class,'seller_profile_index'])->middleware('seller')->name('seller.profile.index');
Route::post('/seller/profile/updated', [ProfileController::class,'seller_profile_updated'])->middleware('seller')->name('seller.profile.updated');


// Seller Branche Details Route 
Route::get('/seller/branche/details', [BrancheController::class,'seller_branche_details'])->middleware('seller')->name('seller.branche.details');
Route::post('/seller/branche/updated', [BrancheController::class,'seller_branche_updated'])->middleware('seller')->name('seller.branche.updated');


// Branch Location Route
Route::get('/seller/branche/location', [BrancheController::class,'seller_branche_location'])->middleware('seller')->name('seller.branche.location');
Route::post('/seller/branche/location/updated', [BrancheController::class,'seller_branche_location_updated'])->middleware('seller')->name('seller.branche.location.updated');


// Financial Details Route 

Route::get('/seller/financial/index', [SettingController::class,'financial_settings'])->middleware('seller')->name('seller.settings.financial');
Route::get('/seller/deferred-sales/products', [SettingController::class,'seller_deferred_sale_pro'])->middleware('seller')->name('seller.deferred.sale.pro');
Route::post('/seller/deferred-sales/products/store', [SettingController::class,'seller_product_deferred_store'])->middleware('seller')->name('seller.product.deferred.store');
Route::post('/seller/deferred-sales/products/delete', [SettingController::class,'seller_product_deferred_delete'])->middleware('seller')->name('seller.product.deferred.delete');



// Automatic Orders Route
Route::post('/seller/automatic-orders/branch/select', [SettingController::class,'seller_branch_automatic_orders_select'])->middleware('seller')->name('seller.branch.automatic.orders.select');
Route::post('/seller/automatic-orders', [SettingController::class,'seller_automatic_orders'])->middleware('seller')->name('seller.automatic.orders');
Route::get('/seller/automatic-orders/delete', [SettingController::class,'seller_automatic_orders_delete'])->middleware('seller')->name('seller.automatic.orders.delete');
Route::post('/seller/automatic-orders/unactive', [SettingController::class,'seller_branch_automatic_orders_unactive'])->middleware('seller')->name('seller.branch.automatic.orders.unactive');



Route::get('/seller/products/commissions',[SettingController::class,'seller_commissions_sale_pro'])->middleware('seller')->name('seller.commissions.sale.pro');
Route::post('/seller/products/commissions/store',[SettingController::class,'seller_commissions_sale_pro_store'])->middleware('seller')->name('seller.commissions.sale.pro.store');
Route::post('/seller/products/commissions/delete',[SettingController::class,'seller_product_commissions_delete'])->middleware('seller')->name('seller.product.commissions.delete');


// Delivery Commissions Route

Route::get('/seller/delivery/commissions',[SettingController::class,'seller_delivery_product_commissions'])->middleware('seller')->name('seller.delivery.product.commissions');
Route::post('/seller/delivery/commissions/store',[SettingController::class,'seller_delivery_product_commissions_store'])->middleware('seller')->name('seller.delivery.product.commissions.store');
Route::post('/seller/delivery/commissions/delete',[SettingController::class,'seller_product_delivery_commissions_delete'])->middleware('seller')->name('seller.product.delivery.commissions.delete');


// Work Time Update Route
Route::post('/seller/work-time/update',[SettingController::class,'seller_work_time_update'])->middleware('seller')->name('seller.work.time.update');
Route::get('/seller/work-time/branch-select',[SettingController::class,'seller_branche_work_time_select'])->middleware('seller')->name('seller.branche.work.time.select');
Route::post('/seller/work-time/saturday/delete',[SettingController::class,'seller_branche_work_time_remove_saturday'])->middleware('seller')->name('seller.work.time.saturday.delete');
Route::post('/seller/work-time/sunday/delete',[SettingController::class,'seller_work_time_sunday_delete'])->middleware('seller')->name('seller.work.time.sunday.delete');
Route::post('/seller/work-time/monday/delete',[SettingController::class,'seller_work_time_monday_delete'])->middleware('seller')->name('seller.work.time.monday.delete');
Route::post('/seller/work-time/tuesday/delete',[SettingController::class,'seller_work_time_tuesday_delete'])->middleware('seller')->name('seller.work.time.tuesday.delete');
Route::post('/seller/work-time/wednesday/delete',[SettingController::class,'seller_work_time_wednesday_delete'])->middleware('seller')->name('seller.work.time.wednesday.delete');
Route::post('/seller/work-time/thursday/delete',[SettingController::class,'seller_work_time_thursday_delete'])->middleware('seller')->name('seller.work.time.thursday.delete');



// Employees Route
Route::post('/seller/employees/get',[SettingController::class,'seller_branch_employees_select'])->middleware('seller')->name('seller.branch.employees.select');
Route::post('/seller/employees/store',[SettingController::class,'seller_add_employees'])->middleware('seller')->name('seller.store.employees');
Route::get('/seller/employees/edit/{id}',[SettingController::class,'seller_edit_employees'])->middleware('seller')->name('seller.edit.employees');
Route::post('/seller/employees/update',[SettingController::class,'seller_update_employees'])->middleware('seller')->name('seller.update.employees');
Route::post('/seller/employees/delete',[SettingController::class,'seller_delete_employees'])->middleware('seller')->name('seller.delete.employees');


// Delivery Payment Route 
Route::post('/seller/delivery-payment/update',[DeliveryManController::class,'seller_delivery_payment'])->middleware('seller')->name('seller.delivery.payment');
Route::get('/seller/delivery-payment/edit/{id}',[DeliveryManController::class,'seller_delivery_edit'])->middleware('seller')->name('seller.delivery.edit');
Route::post('/seller/delivery/update',[DeliveryManController::class,'seller_delivery_update'])->middleware('seller')->name('seller.delivery.update');
Route::post('/seller/delivery/delete',[DeliveryManController::class,'seller_delivery_delete'])->middleware('seller')->name('seller.delivery.delete');

// Alert Route 
Route::post('/seller/alert/branch/select',[SettingController::class,'seller_branch_alert_select'])->middleware('seller')->name('seller.branch.alert.select');



// Reports Route
Route::get('/seller/sales/report', [ReportsController::class,'seller_sales'])->middleware('seller')->name('saller.sales.report');
Route::get('/seller/sales/report/chart', [ReportsController::class,'seller_sales_chart'])->middleware('seller')->name('seller.sales.chart');
Route::get('/seller/sales/month/invoices', [ReportsController::class,'sales_of_month_invoices'])->middleware('seller')->name('sales.of.month.invoices');
Route::get('/seller/sales/month/unpaid-invoices', [ReportsController::class,'sales_of_month_unpaid_invoces'])->middleware('seller')->name('sales.of.month.unpaid.invoces');



Route::get('/seller/sales/refund/report', [ReportsController::class,'seller_sales_refund'])->middleware('seller')->name('seller.sales.refund.report');
Route::get('/seller/sales/refund/chart', [ReportsController::class,'seller_sales_refund_chart'])->middleware('seller')->name('seller.sales.refund.chart');
Route::get('/seller/sales/refund/invoices', [ReportsController::class,'refund_invoices_sales_of_month'])->middleware('seller')->name('refund.invoices.sales.of.month');


Route::get('/seller/sales/delayed/report', [ReportsController::class,'seller_deferred_sales_report'])->middleware('seller')->name('seller.deferred.sales.report');
Route::get('/seller/sales/delayed/chart', [ReportsController::class,'seller_sales_deffered_chart'])->middleware('seller')->name('seller.sales.deffered.chart');
Route::get('/seller/sales/delayed/invoices', [ReportsController::class,'delayed_sales_month_invoices'])->middleware('seller')->name('delayed.sales.month.invoices');



Route::get('/seller/stock/report', [ReportsController::class,'seller_stock_report'])->middleware('seller')->name('seller.stock.report');

Route::get('/seller/delivery/report', [ReportsController::class,'seller_delivery_report'])->middleware('seller')->name('seller.delivery.report');
Route::post('/seller/delivery/chart', [ReportsController::class,'seller_sales_delivery_chart'])->middleware('seller')->name('seller.sales.delivery.chart');
Route::get('/seller/delivery/invoices', [ReportsController::class,'seller_sales_month_delivery_invoices'])->middleware('seller')->name('sales.of.month.delivery.invoices');


Route::get('/seller/branch/report', [ReportsController::class,'seller_branch_report'])->middleware('seller')->name('seller.branch.report');
Route::post('/seller/branch/report/chart', [ReportsController::class,'seller_sales_branch_chart'])->middleware('seller')->name('seller.sales.branch.chart');


Route::get('/seller/commissions/report', [ReportsController::class,'seller_commissions_report'])->middleware('seller')->name('seller.commissions.report');


// Wallet Route 
Route::get('/seller/wallet', [ReportsController::class,'seller_wallet'])->middleware('seller')->name('seller.wallet');



// Notifications Route 
Route::get('/seller/notifications', [SystemController::class,'seller_notifications_index'])->middleware('seller')->name('seller.notifications.index');


// Commissions Route
Route::post('/seller/get_site/commissions', [SystemController::class,'seller_get_site_commissions'])->middleware('seller')->name('seller.get.site.commissions');


Route::group(['namespace' => 'Seller', 'prefix' => 'seller', 'as' => 'seller.'], function () {

    /*authentication*/
    Route::group(['namespace' => 'Auth', 'prefix' => 'auth', 'as' => 'auth.'], function () {
        Route::get('/code/captcha/{tmp}', 'LoginController@captcha')->name('default-captcha');

        // Route::get('login', 'LoginController@login')->name('login');
        // Route::post('login', 'LoginController@submit');
        Route::get('logout', 'LoginController@logout')->name('logout');

        Route::get('new-login', 'SellerRegisterController@new_login')->name('new-login');
        Route::post('new-login', 'SellerRegisterController@submit_login');

        Route::get('login-phone-verify', 'SellerRegisterController@login_phone_verify')->name('login-phone-verify');
        Route::post('login-phone-verify', 'SellerRegisterController@login_submit_phone_token');

        Route::get('register', 'SellerRegisterController@create')->name('register');
        Route::post('register', 'SellerRegisterController@submit_email');

        Route::get('phone-verify', 'SellerRegisterController@phone_verify')->name('phone-verify');
        Route::post('phone-verify', 'SellerRegisterController@submit_phone_token');
        Route::post('whats', 'SellerRegisterController@whatsapp')->name('whats');

        Route::get('seller-info-1', 'SellerRegisterController@seller_info_1')->name('seller-info-1');
        Route::get('get-places', 'SellerRegisterController@get_places')->name('get-places');

        Route::get('seller-info-submit', 'SellerRegisterController@submit_seller_info_1');

        Route::get('seller-info-2', 'SellerRegisterController@seller_info_2')->name('seller-info-2');
        Route::post('seller-info-2', 'SellerRegisterController@submit_seller_info_2');

        Route::get('seller-info-3', 'SellerRegisterController@seller_info_3')->name('seller-info-3');
        Route::post('seller-info-3', 'SellerRegisterController@submit_seller_info_3');

        Route::get('forgot-password', 'ForgotPasswordController@forgot_password')->name('forgot-password');
        Route::post('forgot-password', 'ForgotPasswordController@reset_password_request');
        Route::get('reset-password', 'ForgotPasswordController@reset_password_index')->name('reset-password');
        Route::post('reset-password', 'ForgotPasswordController@reset_password_submit');
    });

    /*authenticated*/
    Route::group(['middleware' => ['seller']], function () {
        //dashboard routes

        Route::get('/get-order-data', 'SystemController@order_data')->name('get-order-data');

        Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.'], function () {
            Route::get('dashboard', 'DashboardController@dashboard');
            Route::get('/', 'DashboardController@dashboard')->name('index');
            Route::post('order-stats', 'DashboardController@order_stats')->name('order-stats');
            Route::post('business-overview', 'DashboardController@business_overview')->name('business-overview');
        });

        Route::group(['prefix' => 'product', 'as' => 'product.'], function () {
            Route::post('image-upload', 'ProductController@imageUpload')->name('image-upload');
            Route::get('remove-image', 'ProductController@remove_image')->name('remove-image');
            Route::get('add-new', 'ProductController@add_new')->name('add-new');
            Route::post('add-new', 'ProductController@store');

          
            Route::get('copy-product/{id}', 'ProductController@copy')->name('copy-product');
            Route::post('store-copy/{id}', 'ProductController@store_copy')->name('store-copy');
            Route::post('status-update', 'ProductController@status_update')->name('status-update');
            Route::post('status-branch-update', 'ProductController@status_branch_update')->name('status-branch-update');
            Route::get('list', 'ProductController@list')->name('list');
            Route::get('list-haad', 'ProductController@list_haad_office')->name('list-haad');
            Route::get('stock-limit-list/{type}', 'ProductController@stock_limit_list')->name('stock-limit-list');
            Route::get('get-variations', 'ProductController@get_variations')->name('get-variations');
            Route::post('update-quantity', 'ProductController@update_quantity')->name('update-quantity');
            Route::get('edit/{id}', 'ProductController@edit')->name('edit');
            Route::post('update/{id}', 'ProductController@update')->name('update');
            Route::post('sku-combination', 'ProductController@sku_combination')->name('sku-combination');
            Route::get('get-categories', 'ProductController@get_categories')->name('get-categories');
            Route::get('copy/{id}', 'ProductController@copy')->name('copy');
            Route::post('/search', 'ProductController@search')->name('searchProduct');
            Route::get('/view/model/{id}', 'ProductController@viewModel')->name('viewModel');

            // Add Product Model
            Route::post('/add-new/model', 'ProductModelController@addNew')->name('addProductModel');
            Route::post('/add-multi-price/model', 'ProductModelController@addNewMultiPrice')->name('addMultiPriceProductModel');
            Route::post('/update-multi-price', 'ProductModelController@editMultiPrice')->name('editMultiPrice');
            Route::post('/send-request/model', 'ProductModelController@sendRequestAdd')->name('sendRequestModel');
            Route::post('add/new-size', 'ProductModelController@addNewSize')->name('add.new.size');
            Route::post('/send-request-product/model', 'ProductModelController@sendRequestProduct')->name('sendRequestProModel');
            Route::post('/update-product-price/{id}', 'ProductModelController@updateProPrice')->name('updateProPrice');


            Route::delete('delete/{id}', 'ProductController@delete')->name('delete');

            Route::get('view/{id}', 'ProductController@view')->name('view');
            Route::get('bulk-import', 'ProductController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'ProductController@bulk_import_data');
            Route::get('bulk-export', 'ProductController@bulk_export_data')->name('bulk-export');
        });
        //refund request
        Route::group(['prefix' => 'refund', 'as' => 'refund.'], function () {
            Route::get('list/{status}', 'RefundController@list')->name('list');
            Route::get('details/{id}', 'RefundController@details')->name('details');
            Route::get('inhouse-order-filter', 'RefundController@inhouse_order_filter')->name('inhouse-order-filter');
            Route::post('refund-status-update', 'RefundController@refund_status_update')->name('refund-status-update');

        });
        Route::group(['prefix' => 'orders', 'as' => 'orders.'], function () {
            Route::get('list/{status}', 'OrderController@list')->name('list');
            Route::get('details/{id}', 'OrderController@details')->name('details');
            Route::get('generate-invoice/{id}', 'OrderController@generate_invoice')->name('generate-invoice');
            Route::post('status', 'OrderController@status')->name('status');
            Route::post('productStatus', 'OrderController@productStatus')->name('productStatus');
            Route::post('payment-status', 'OrderController@payment_status')->name('payment-status');
            Route::post('order-status/{id}', 'OrderController@update_order_status')->name('order-status');
            Route::post('order-status-0/{id}', 'OrderController@update_order_status_0')->name('order-status-0');

            Route::post('update-deliver-info','OrderController@update_deliver_info')->name('update-deliver-info');
            Route::get('add-delivery-man/{order_id}/{d_man_id}', 'OrderController@add_delivery_man')->name('add-delivery-man');
        });

        //Performance
        Route::group(['prefix' => 'performance', 'as' => 'performance.'], function () {
            Route::get('/', 'PerformanceController@index')->name('index');
        });


        //pos management
        Route::group(['prefix' => 'pos', 'as' => 'pos.'], function () {
            Route::get('/', 'POSController@index')->name('index');
            Route::get('quick-view', 'POSController@quick_view')->name('quick-view');
            Route::post('variant_price', 'POSController@variant_price')->name('variant_price');
            Route::post('add-to-cart', 'POSController@addToCart')->name('add-to-cart');
            Route::post('remove-from-cart', 'POSController@removeFromCart')->name('remove-from-cart');
            Route::post('cart-items', 'POSController@cart_items')->name('cart_items');
            Route::post('update-quantity', 'POSController@updateQuantity')->name('updateQuantity');
            Route::post('empty-cart', 'POSController@emptyCart')->name('emptyCart');
            Route::post('tax', 'POSController@update_tax')->name('tax');
            Route::post('discount', 'POSController@update_discount')->name('discount');
            Route::get('customers', 'POSController@get_customers')->name('customers');
            Route::post('order', 'POSController@place_order')->name('order');
            Route::get('orders', 'POSController@order_list')->name('orders');
            Route::get('order-details/{id}', 'POSController@order_details')->name('order-details');
            Route::get('invoice/{id}', 'POSController@generate_invoice');
            Route::any('store-keys', 'POSController@store_keys')->name('store-keys');
            Route::get('search-products','POSController@search_product')->name('search-products');


            Route::post('coupon-discount', 'POSController@coupon_discount')->name('coupon-discount');
            Route::get('change-cart','POSController@change_cart')->name('change-cart');
            Route::get('new-cart-id','POSController@new_cart_id')->name('new-cart-id');
            Route::post('remove-discount','POSController@remove_discount')->name('remove-discount');
            Route::get('clear-cart-ids','POSController@clear_cart_ids')->name('clear-cart-ids');
            Route::get('get-cart-ids','POSController@get_cart_ids')->name('get-cart-ids');

            Route::post('customer-store', 'POSController@customer_store')->name('customer-store');
        });
        //Product Reviews

        Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
            Route::get('list', 'ReviewsController@list')->name('list');

        });

        // Messaging
        Route::group(['prefix' => 'messages', 'as' => 'messages.'], function () {
            Route::get('/chat', 'ChattingController@chat')->name('chat');
            Route::get('/message-by-user', 'ChattingController@message_by_user')->name('message_by_user');
            Route::post('/seller-message-store', 'ChattingController@seller_message_store')->name('seller_message_store');
        });
        // profile

        Route::group(['prefix' => 'profile', 'as' => 'profile.'], function () {
            Route::get('view', 'ProfileController@view')->name('view');
            Route::get('update/{id}', 'ProfileController@edit')->name('update');
            Route::post('update/{id}', 'ProfileController@update');
            Route::post('settings-password', 'ProfileController@settings_password_update')->name('settings-password');

            Route::get('bank-edit/{id}', 'ProfileController@bank_edit')->name('bankInfo');
            Route::post('bank-update/{id}', 'ProfileController@bank_update')->name('bank_update');

        });
        Route::group(['prefix' => 'shop', 'as' => 'shop.'], function () {
            Route::get('view', 'ShopController@view')->name('view');
            Route::get('edit/{id}', 'ShopController@edit')->name('edit');
            Route::post('update/{id}', 'ShopController@update')->name('update');
            Route::post('updateday/{id}', 'ShopController@updateday')->name('updateday');
        });

        Route::group(['prefix' => 'withdraw', 'as' => 'withdraw.'], function () {
            Route::post('request', 'WithdrawController@w_request')->name('request');
            Route::delete('close/{id}', 'WithdrawController@close_request')->name('close');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.'], function () {

            Route::group(['prefix' => 'shipping-method', 'as' => 'shipping-method.'], function () {
                Route::get('add', 'ShippingMethodController@index')->name('add');
                Route::post('add', 'ShippingMethodController@store');
                Route::get('edit/{id}', 'ShippingMethodController@edit')->name('edit');
                Route::put('update/{id}', 'ShippingMethodController@update')->name('update');
                Route::post('delete', 'ShippingMethodController@delete')->name('delete');
                Route::post('status-update', 'ShippingMethodController@status_update')->name('status-update');

                Route::get('shipping-profile', 'ShippingMethodController@profile')->name('profile');
            });

            Route::group(['prefix' => 'shipping-type', 'as' => 'shipping-type.'], function () {
                Route::post('store', 'ShippingTypeController@store')->name('store');
            });
            Route::group(['prefix' => 'category-shipping-cost', 'as' => 'category-shipping-cost.'], function () {
                Route::post('store', 'CategoryShippingCostController@store')->name('store');
            });

            Route::group(['prefix' => 'withdraw', 'as' => 'withdraw.'], function () {
                Route::get('list', 'WithdrawController@list')->name('list');
                Route::get('cancel/{id}', 'WithdrawController@close_request')->name('cancel');
                Route::post('status-filter', 'WithdrawController@status_filter')->name('status-filter');
            });

        });

        Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.'], function () {
            Route::get('add', 'DeliveryManController@index')->name('add');
            Route::post('store', 'DeliveryManController@store')->name('store');
            Route::get('list', 'DeliveryManController@list')->name('list');
            Route::get('preview/{id}', 'DeliveryManController@preview')->name('preview');
            Route::get('edit/{id}', 'DeliveryManController@edit')->name('edit');
            Route::post('update/{id}', 'DeliveryManController@update')->name('update');
            Route::delete('delete/{id}', 'DeliveryManController@delete')->name('delete');
            Route::post('search', 'DeliveryManController@search')->name('search');
            Route::post('status-update', 'DeliveryManController@status')->name('status-update');
        });

        Route::group(['prefix' => 'settings', 'as' => 'settings.'], function () {
            Route::get('/', 'SettingController@index')->name('index');
            Route::get('/alerts', 'SettingController@alerts')->name('alerts');
            Route::get('/work-time', 'SettingController@workTime')->name('workTime');
            Route::get('/employees', 'SettingController@employees')->name('employees');
            Route::get('/operational-details', 'SettingController@operational_details')->name('operational_details');
        });

        Route::group(['prefix' => 'branches', 'as' => 'branches.'], function () {
            Route::get('add', 'BrancheController@index')->name('add');
            Route::post('store', 'BrancheController@store')->name('store');
            Route::get('list', 'BrancheController@list')->name('list');
            Route::get('preview/{id}', 'BrancheController@preview')->name('preview');
            Route::get('edit/{id}', 'BrancheController@edit')->name('edit');
            Route::post('update', 'BrancheController@update')->name('update');
            Route::delete('delete/{id}', 'BrancheController@delete')->name('delete');
            Route::post('search', 'BrancheController@search')->name('search');
            Route::post('status-update', 'BrancheController@status')->name('status-update');
        });

        Route::group(['prefix' => 'zone', 'as' => 'zone.'], function () {
            Route::get('/', 'ZoneController@index')->name('home');
            Route::post('store', 'ZoneController@store')->name('store');
            Route::get('edit/{id}', 'ZoneController@edit')->name('edit');
            Route::post('update/{id}', 'ZoneController@update')->name('update');
            Route::delete('delete/{zone}', 'ZoneController@destroy')->name('delete');
            Route::get('status/{id}/{status}', 'ZoneController@status')->name('status');
            Route::post('search', 'ZoneController@search')->name('search');
            Route::get('zone-filter/{id}', 'ZoneController@zone_filter')->name('zonefilter');
            Route::get('get-all-zone-cordinates/{id?}', 'ZoneController@get_all_zone_cordinates')->name('zoneCoordinates');
        });

        Route::group(['prefix' => 'brand', 'as' => 'brand.'], function () {
            Route::get('add-new', 'BrandController@add_new')->name('add-new');
            Route::post('add-new', 'BrandController@store');
            Route::get('list', 'BrandController@list')->name('list');
            Route::get('update/{id}', 'BrandController@edit')->name('update');
            Route::post('update/{id}', 'BrandController@update');
            Route::post('delete', 'BrandController@delete')->name('delete');
        });

    });




});
