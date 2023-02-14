<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class seller_req_add_products extends Model
{
    use HasFactory;


    protected $fillable = [
        'seller_id',
        'indastry_name',
        'product_name',
        'product_type',
        'product_size',
        'qty_in_unit',
        'purchase_price',
        'product_price',
        'qty_in_stock',
        'product_image',
        'carton_unit',
        'brand_id',
        'category_id',
        'sub_category_id',
        'sub_sub_category_id',
        'branche_id'
               
    ];

  
}
