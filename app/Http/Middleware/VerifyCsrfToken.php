<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * Indicates whether the XSRF-TOKEN cookie should be set on the response.
     *
     * @var bool
     */
    protected $addHttpCookie = true;

    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        '/pay-via-ajax', '/success','/cancel','/fail','/ipn','/bkash/*',
        '/paytabs-response','/customer/choose-shipping-address','/system_settings',
        '/paytm*',
        '/product/filters-search',
        '/check-copoun-code',
        '/admin/category/delete',
        '/admin/products/get_brand_category',
        '/seller/work-time/branch-select',
        '/seller/work-time/saturday/delete',
        '/seller/work-time/sunday/delete',
        '/seller/work-time/monday/delete',
        '/seller/work-time/tuesday/delete',
        '/seller/work-time/wednesday/delete',
        '/seller/work-time/thursday/delete',
        '/seller/employees/get',
        '/seller/alert/branch/select',
        '/seller/automatic-orders-select',
        '/seller/automatic-orders/branch/select',
        '/seller/automatic-orders/unactive',
        '/seller/delivery/chart',
        '/seller/branch/report/chart',
        '/seller/product/update/price/file',
        '/seller/automatic-orders'
    ];
}
