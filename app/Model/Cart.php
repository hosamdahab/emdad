<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{

    protected $fillable = [
        'customer_id',
        'cart_group_id',
        'product_id',
        'brand_id',
        'category_id',
        'color',
        'choices', 
        'variations', 
        'variant', 
        'quantity', 
        'price', 
        'tax', 
        'discount', 
        'slug', 
        'name', 
        'thumbnail', 
        'seller_id', 
        'seller_is', 
        'shop_info', 
        'shipping_cost', 
        'shipping_type',
        'total',
        'product_type',
        'unit',
        'unit_numbers',
        'sub_category_id',
        'sub_sub_category_id',

    ];

    protected $casts = [
        'price' => 'float',
        'discount' => 'float',
        'tax' => 'float',
        'seller_id' => 'integer',
        'quantity' => 'integer',
        'shipping_cost'=>'float',
        
    ];

    public function cart_shipping(){
        return $this->hasOne(CartShipping::class,'cart_group_id','cart_group_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class)->where('status', 1);
    }
    
}
