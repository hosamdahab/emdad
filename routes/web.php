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
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Web\hotOffersController;
use App\Http\Controllers\Web\WebController;

Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});


Route::get('/customer/locations', [WebController::class,'customer_locations'])->name('customer.locations');

Route::get('/customer/locations/delete/{id}', [WebController::class,'customer_locations_delete'])->name('customer.locations.delete');
//for maintenance mode
Route::get('maintenance-mode', 'Web\WebController@maintenance_mode')->name('maintenance-mode');

Route::get('/select/location', [WebController::class,'customer_select_location'])->middleware('customer')->name('customer.select.location');

Route::get('/verfication-account', [WebController::class,'customer_verfication_account'])->middleware('customer')->name('customer.verfication.account');

Route::get('/category/{id}', [WebController::class,'category_view'])->middleware('customer')->name('category.view');

Route::get('/sub-category/{id}', [WebController::class,'sub_category_view'])->middleware('customer')->name('sub.category.view');

Route::get('/category/product/{id}', [WebController::class,'product_by_category'])->middleware('customer')->name('product.by.category');

Route::get('/brand/products/{id}', [WebController::class,'brand_products'])->middleware('customer')->name('brand.products');

Route::post('/sub-category/search', [WebController::class,'sub_category_search'])->middleware('customer')->name('sub.category.search');

Route::get('/product/{id}', [WebController::class,'product_view'])->middleware('customer')->name('product.view');
Route::get('/product/{product_id}/{size_id}', [WebController::class,'product_view_details'])->middleware('customer')->name('product.view.size');

Route::post('/product/filters-search', [WebController::class,'product_filters_serach'])->middleware('customer')->name('product.filters.serach');

Route::post('/add-to-cart', [WebController::class,'add_to_cart'])->middleware('customer')->name('add.to.cart');

Route::post('/cart-remove-item/{id}', [WebController::class,'remove_cart_item'])->middleware('customer')->name('remove.cart.item');

Route::post('/check-copoun-code', [WebController::class,'check_copoun_code'])->middleware('customer')->name('check.copoun.code');

Route::post('/check-banner', [WebController::class,'check_banner_code'])->middleware('customer')->name('check.banner');


Route::get('/customers/wishlist', [WebController::class,'customer_wishlist'])->middleware('customer')->name('customer.wishlist');
Route::post('/customers/wishlists/store', [WebController::class,'customer_wishlists_store'])->middleware('customer')->name('customers.wishlists.store');
Route::post('/customers/wishlists/delete', [WebController::class,'customers_wishlists_delete'])->middleware('customer')->name('customers.wishlists.delete');

Route::get('/customers/wallet', [WebController::class,'customer_wallet'])->middleware('customer')->name('customer.wallet');
Route::get('/customers/wallet/transactions-details/{id}', [WebController::class,'customer_transactions_details'])->middleware('customer')->name('customer.transactions.details');

Route::post('/customers/account/update', [WebController::class,'customer_account_update'])->middleware('customer')->name('customer.account.update');
Route::post('/customers/building/update', [WebController::class,'customer_building_update'])->middleware('customer')->name('customer.building.update');

Route::get('/customers/add/location', [WebController::class,'customer_add_new_location'])->middleware('customer')->name('customer.add.new.location');
Route::post('/customers/location/store', [WebController::class,'customer_location_details_store'])->middleware('customer')->name('customer.location.details.store');

Route::get('/customers/location/details', [WebController::class,'customer_location_details'])->middleware('customer')->name('customer.location.details');

Route::post('/customers/location/updated', [WebController::class,'customer_location_updated'])->middleware('customer')->name('customer.location.updated');
Route::post('/customers/location/add/helpers', [WebController::class,'customer_location_add_helper'])->name('customer.location.add.helpers');

Route::get('/customers/search/product', [WebController::class,'customer_search_products'])->name('customer.search.products');


Route::get('/hot-sales', [WebController::class,'hot_sales_pro'])->middleware('customer')->name('hot.sales.pro');

Route::get('/last-orders', [WebController::class,'my_last_orders'])->middleware('customer')->name('my.last.orders');

Route::get('/last-orders', [WebController::class,'my_last_orders'])->middleware('customer')->name('my.last.orders');

Route::post('/customers-messages/store', [WebController::class,'customers_messages_store'])->middleware('customer')->name('customers.messages.store');


Route::group(['namespace' => 'Web','middleware'=>['maintenance_mode']], function () {
    Route::get('/', 'WebController@home')->middleware('customer')->name('home');

    Route::get('quick-view', 'WebController@quick_view')->middleware('customer')->name('quick-view');
    Route::get('searched-products', 'WebController@searched_products')->middleware('customer')->name('searched-products');

    
        Route::get('checkout-details', 'WebController@checkout_details')->middleware('customer')->name('checkout-details');
        Route::get('checkout-shipping', 'WebController@checkout_shipping')->name('checkout-shipping')->middleware('customer');
        Route::get('checkout-payment', 'WebController@checkout_payment')->name('checkout-payment')->middleware('customer');
        Route::get('checkout-review', 'WebController@checkout_review')->name('checkout-review')->middleware('customer');
        Route::get('checkout-complete', 'WebController@checkout_complete')->name('checkout-complete')->middleware('customer');
        Route::get('order-placed', 'WebController@order_placed')->name('order-placed')->middleware('customer');
        Route::get('shop-cart', 'WebController@shop_cart')->middleware('customer')->name('shop-cart');
        Route::post('order_note', 'WebController@order_note')->middleware('customer')->name('order_note');
   

    Route::post('subscription', 'WebController@subscription')->middleware('customer')->name('subscription');
    Route::get('search-shop', 'WebController@search_shop')->middleware('customer')->name('search-shop');

    Route::get('categories', 'WebController@all_categories')->middleware('customer')->name('categories');
    Route::get('category-ajax/{id}', 'WebController@categories_by_category')->middleware('customer')->name('category-ajax');

   
    

    Route::get('brands', 'WebController@all_brands')->middleware('customer')->name('brands');
    Route::get('sellers', 'WebController@all_sellers')->middleware('customer')->name('sellers');
    Route::get('seller-profile/{id}', 'WebController@seller_profile')->middleware('customer')->name('seller-profile');

    Route::get('flash-deals/{id}', 'WebController@flash_deals')->middleware('customer')->name('flash-deals');
    Route::get('terms', 'WebController@termsandCondition')->middleware('customer')->name('terms');
    Route::get('privacy-policy', 'WebController@privacy_policy')->middleware('customer')->name('privacy-policy');

    Route::get('/product/{slug}', 'WebController@product')->middleware('customer')->name('product');
    Route::get('products', 'WebController@products')->middleware('customer')->name('products');
    Route::get('orderDetails', 'WebController@orderdetails')->middleware('customer')->name('orderdetails');
    Route::get('discounted-products', 'WebController@discounted_products')->middleware('customer')->name('discounted-products');

    Route::post('review-list-product','WebController@review_list_product')->middleware('customer')->name('review-list-product');
    //Chat with seller from product details
    Route::get('chat-for-product', 'WebController@chat_for_product')->middleware('customer')->name('chat-for-product');

    Route::get('wishlists', 'WebController@viewWishlist')->name('wishlists')->middleware('customer');
    Route::post('store-wishlist', 'WebController@storeWishlist')->middleware('customer')->name('store-wishlist');
    Route::post('delete-wishlist', 'WebController@deleteWishlist')->middleware('customer')->name('delete-wishlist');

    Route::post('/currency', 'CurrencyController@changeCurrency')->middleware('customer')->name('currency.change');

    Route::get('about-us', 'WebController@about_us')->name('about-us');

    //profile Route
    Route::get('user-account', 'UserProfileController@user_account')->middleware('customer')->name('user-account');
    Route::post('user-account-update', 'UserProfileController@user_update')->middleware('customer')->name('user-update');
    Route::post('user-account-picture', 'UserProfileController@user_picture')->middleware('customer')->name('user-picture');
    Route::get('account-address', 'UserProfileController@account_address')->middleware('customer')->name('account-address');
    Route::post('account-address-store', 'UserProfileController@address_store')->middleware('customer')->name('address-store');
    Route::get('account-address-delete', 'UserProfileController@address_delete')->middleware('customer')->name('address-delete');
    ROute::get('account-address-edit/{id}','UserProfileController@address_edit')->middleware('customer')->name('address-edit');
    Route::post('account-address-update', 'UserProfileController@address_update')->middleware('customer')->name('address-update');
    Route::get('account-payment', 'UserProfileController@account_payment')->middleware('customer')->name('account-payment');
    Route::get('account-oder', 'UserProfileController@account_oder')->middleware('customer')->name('account-oder');
    Route::get('account-order-details/{id}', 'UserProfileController@account_order_details')->name('account-order-details')->middleware('customer');
    Route::get('generate-invoice/{id}', 'UserProfileController@generate_invoice')->middleware('customer')->name('generate-invoice');
    Route::get('account-wishlist', 'UserProfileController@account_wishlist')->middleware('customer')->name('account-wishlist'); //add to card not work
    Route::get('refund-request/{id}','UserProfileController@refund_request')->middleware('customer')->name('refund-request');
    Route::get('refund-details/{id}','UserProfileController@refund_details')->middleware('customer')->name('refund-details');
    Route::get('submit-review/{id}','UserProfileController@submit_review')->middleware('customer')->name('submit-review');
    Route::post('refund-store','UserProfileController@store_refund')->middleware('customer')->name('refund-store');
    Route::get('account-tickets', 'UserProfileController@account_tickets')->middleware('customer')->name('account-tickets');
    Route::get('order-cancel/{id}', 'UserProfileController@order_cancel')->middleware('customer')->name('order-cancel');
    Route::post('ticket-submit', 'UserProfileController@ticket_submit')->middleware('customer')->name('ticket-submit');


    // Hot Offers Route 

    Route::get('hot-discount', 'hotOffersController@index')->middleware('customer')->name('hot-offers');
    

    // Chatting start
    Route::get('chat-with-seller', 'ChattingController@chat_with_seller')->middleware('customer')->name('chat-with-seller');
    Route::get('messages', 'ChattingController@messages')->middleware('customer')->name('messages');
    Route::post('messages-store', 'ChattingController@messages_store')->middleware('customer')->name('messages_store');
    // chatting end

   
    //Support Ticket
    Route::group(['prefix' => 'support-ticket', 'as' => 'support-ticket.'], function () {
        Route::get('{id}', 'UserProfileController@single_ticket')->middleware('customer')->name('index');
        Route::post('{id}', 'UserProfileController@comment_submit')->middleware('customer')->name('comment');
        Route::get('delete/{id}', 'UserProfileController@support_ticket_delete')->middleware('customer')->name('delete');
        Route::get('close/{id}', 'UserProfileController@support_ticket_close')->middleware('customer')->name('close');
    });
    
    
    //NewReqOrder
    Route::group(['prefix' => 'new-req-order', 'as' => 'new-req-order.'], function () {
        Route::get('{id}', 'UserProfileController@single_new_req_order')->middleware('customer')->name('index');
        Route::post('{id}', 'UserProfileController@new_req_order_submit')->middleware('customer')->name('comment');
        Route::get('delete/{id}', 'UserProfileController@new_req_order_delete')->middleware('customer')->name('delete');
        Route::get('close/{id}', 'UserProfileController@new_req_order_close')->middleware('customer')->name('close');
    });

    Route::get('account-transaction', 'UserProfileController@account_transaction')->middleware('customer')->name('account-transaction');
    Route::get('account-wallet-history', 'UserProfileController@account_wallet_history')->middleware('customer')->name('account-wallet-history');

    Route::post('review', 'ReviewController@store')->middleware('customer')->name('review.store');

    Route::group(['prefix' => 'track-order', 'as' => 'track-order.'], function () {
        Route::get('', 'UserProfileController@track_order')->middleware('customer')->name('index');
        Route::get('result-view', 'UserProfileController@track_order_result')->middleware('customer')->name('result-view');
        Route::get('last', 'UserProfileController@track_last_order')->middleware('customer')->name('last');
        Route::any('result', 'UserProfileController@track_order_result')->middleware('customer')->name('result');
    });
    //FAQ route
    Route::get('helpTopic', 'WebController@helpTopic')->name('helpTopic');
    //Contacts
    Route::get('contacts', 'WebController@contacts')->name('contacts');

    //sellerShop
    Route::get('shopView/{id}', 'WebController@seller_shop')->middleware('customer')->name('shopView');
    Route::post('shopView/{id}', 'WebController@seller_shop_product')->middleware('customer');

    //top Rated
    Route::get('top-rated', 'WebController@top_rated')->middleware('customer')->name('topRated');
    Route::get('best-sell', 'WebController@best_sell')->middleware('customer')->name('bestSell');
    Route::get('new-product', 'WebController@new_product')->middleware('customer')->name('newProduct');

    Route::group(['prefix' => 'contact', 'as' => 'contact.'], function () {
        Route::post('store', 'WebController@contact_store')->name('store');
        Route::get('/code/captcha/{tmp}', 'WebController@captcha')->name('default-captcha');
    });
});

//Seller shop apply
Route::group(['prefix' => 'shop', 'as' => 'shop.', 'namespace' => 'Seller\Auth'], function () {
    Route::get('apply', 'RegisterController@create')->name('apply');
    Route::post('apply', 'RegisterController@store');

});

//check done
Route::group(['prefix' => 'cart', 'as' => 'cart.', 'namespace' => 'Web'], function () {
    Route::post('variant_price', 'CartController@variant_price')->middleware('customer')->name('variant_price');
    Route::post('add', 'CartController@addToCart')->middleware('customer')->name('add');
    Route::post('remove', 'CartController@removeFromCart')->middleware('customer')->name('remove');
    Route::post('nav-cart-items', 'CartController@updateNavCart')->middleware('customer')->name('nav-cart');
    Route::post('updateQuantity', 'CartController@updateQuantity')->middleware('customer')->name('updateQuantity');
});

//Seller shop apply
Route::group(['prefix' => 'coupon', 'as' => 'coupon.', 'namespace' => 'Web'], function () {
    Route::post('apply', 'CouponController@apply')->middleware('customer')->name('apply');
});
//check done

// SSLCOMMERZ Start
/*Route::get('/example1', 'SslCommerzPaymentController@exampleEasyCheckout');
Route::get('/example2', 'SslCommerzPaymentController@exampleHostedCheckout');*/
Route::post('pay-ssl', 'SslCommerzPaymentController@index')->middleware('customer');
Route::post('/success', 'SslCommerzPaymentController@success')->middleware('customer')->name('ssl-success');
Route::post('/fail', 'SslCommerzPaymentController@fail')->middleware('customer')->name('ssl-fail');
Route::post('/cancel', 'SslCommerzPaymentController@cancel')->middleware('customer')->name('ssl-cancel');
Route::post('/ipn', 'SslCommerzPaymentController@ipn')->middleware('customer')->name('ssl-ipn');
//SSLCOMMERZ END

/*paypal*/
/*Route::get('/paypal', function (){return view('paypal-test');})->name('paypal');*/
Route::post('pay-paypal', 'PaypalPaymentController@payWithpaypal')->name('pay-paypal');
Route::get('paypal-status', 'PaypalPaymentController@getPaymentStatus')->name('paypal-status');
Route::get('paypal-success', 'PaypalPaymentController@success')->name('paypal-success');
Route::get('paypal-fail', 'PaypalPaymentController@fail')->name('paypal-fail');
/*paypal*/

/*Route::get('stripe', function (){
return view('stripe-test');
});*/
Route::get('pay-stripe', 'StripePaymentController@payment_process_3d')->name('pay-stripe');
Route::get('pay-stripe/success', 'StripePaymentController@success')->name('pay-stripe.success');
Route::get('pay-stripe/fail', 'StripePaymentController@success')->name('pay-stripe.fail');

// Get Route For Show Payment razorpay Form
Route::get('paywithrazorpay', 'RazorPayController@payWithRazorpay')->name('paywithrazorpay');
Route::post('payment-razor', 'RazorPayController@payment')->name('payment-razor');
Route::post('payment-razor/payment2', 'RazorPayController@payment_mobile')->name('payment-razor.payment2');
Route::get('payment-razor/success', 'RazorPayController@success')->name('payment-razor.success');
Route::get('payment-razor/fail', 'RazorPayController@success')->name('payment-razor.fail');

Route::get('payment-success', 'Customer\PaymentController@success')->name('payment-success');
Route::get('payment-fail', 'Customer\PaymentController@fail')->name('payment-fail');


//senang pay
Route::match(['get', 'post'], '/return-senang-pay', 'SenangPayController@return_senang_pay')->name('return-senang-pay');

//paystack
Route::post('/paystack-pay', 'PaystackController@redirectToGateway')->name('paystack-pay');
Route::get('/paystack-callback', 'PaystackController@handleGatewayCallback')->name('paystack-callback');
Route::get('/paystack',function (){
    return view('paystack');
});

// paymob
Route::post('/paymob-credit', 'PaymobController@credit')->name('paymob-credit');
Route::get('/paymob-callback', 'PaymobController@callback')->name('paymob-callback');


//paytabs
Route::any('/paytabs-payment', 'PaytabsController@payment')->name('paytabs-payment');
Route::any('/paytabs-response', 'PaytabsController@callback_response')->name('paytabs-response');

//bkash
Route::group(['prefix'=>'bkash'], function () {
    // Payment Routes for bKash
    Route::post('get-token', 'BkashPaymentController@getToken')->name('bkash-get-token');
    Route::post('create-payment', 'BkashPaymentController@createPayment')->name('bkash-create-payment');
    Route::post('execute-payment', 'BkashPaymentController@executePayment')->name('bkash-execute-payment');
    Route::get('query-payment', 'BkashPaymentController@queryPayment')->name('bkash-query-payment');
    Route::post('success', 'BkashPaymentController@bkashSuccess')->name('bkash-success');

    // Refund Routes for bKash
    Route::get('refund', 'BkashRefundController@index')->middleware('customer')->name('bkash-refund');
    Route::post('refund', 'BkashRefundController@refund')->middleware('customer')->name('bkash-refund');
});

//fawry
Route::get('/fawry', 'FawryPaymentController@index')->middleware('customer')->name('fawry');
Route::any('/fawry-payment', 'FawryPaymentController@payment')->middleware('customer')->name('fawry-payment');

// The callback url after a payment
Route::get('mercadopago/home', 'MercadoPagoController@index')->middleware('customer')->name('mercadopago.index');
Route::post('mercadopago/make-payment', 'MercadoPagoController@make_payment')->middleware('customer')->name('mercadopago.make_payment');
Route::get('mercadopago/get-user', 'MercadoPagoController@get_test_user')->middleware('customer')->name('mercadopago.get-user');

// The route that the button calls to initialize payment
Route::post('/flutterwave-pay','FlutterwaveController@initialize')->middleware('customer')->name('flutterwave_pay');
// The callback url after a payment
Route::get('/rave/callback', 'FlutterwaveController@callback')->middleware('customer')->name('flutterwave_callback');

// The callback url after a payment PAYTM
Route::get('paytm-payment', 'PaytmController@payment')->middleware('customer')->name('paytm-payment');
Route::any('paytm-response', 'PaytmController@callback')->middleware('customer')->name('paytm-response');

// The callback url after a payment LIQPAY
Route::get('liqpay-payment', 'LiqPayController@payment')->middleware('customer')->name('liqpay-payment');
Route::any('liqpay-callback', 'LiqPayController@callback')->middleware('customer')->name('liqpay-callback');

Route::get('/test', function (){
    return view('welcome');
});
