<?php

namespace App\Model;

use App\CPU\Helpers;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use App\ProductSize;
use Carbon\Carbon;

class Product extends Model
{
    // protected $guarded = [];

    protected $fillable = [
        'added_by',
        'user_id',
        'child_seller_id', 
        'sub_category_id', 
        'sku', 
        'name', 
        'slug', 
        'product_type', 
        'product_size',
        'carton_unit',
        'multi_unit_price',
        'category_ids',
        'brand_id', 
        'unit', 
        'unit_numbers', 
        'min_qty', 
        'images', 
        'thumbnail',
        'sub_category_id',
        'branche_id',
        'address_latitude',
        'address_longitude',
        'position',
        'whats',
        'unit_price',
        'purchase_price',
        'discount',
        'discount_percent',
        'discount_start',
        'discount_end',
        'offer_price',
        'offer_start',
        'offer_end',
        'tax',
        'current_stock',
        'shipping_cost',
        'sub_sub_category_id',
        'deferred',
        'commissions_min_delivery',
        'commissions_delivery_percent',
        'payment_in'

       
    ];

    protected $casts = [
        'sku' => 'string',
        'user_id' => 'integer',
        'brand_id' => 'integer',
        'min_qty' => 'integer',
        'published' => 'integer',
        'tax' => 'float',
        'unit_price' => 'float',
        'status' => 'integer',
        'discount' => 'float',
        'current_stock' => 'integer',
        'free_shipping' => 'integer',
        'featured_status' => 'integer',
        'refundable' => 'integer',
        'featured' => 'integer',
        'flash_deal' => 'integer',
        'seller_id' => 'integer',
        'purchase_price' => 'float',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'shipping_cost'=>'float',
        'multiply_qty'=> 'integer',
        'product_type'=> 'string',
        'temp_shipping_cost'=>'float',
        'is_shipping_cost_updated'=>'integer'
    ];

    public function translations()
    {
        return $this->morphMany('App\Model\Translation', 'translationable');
    }

    public function scopeActive($query)
    {
        return $query->whereHas('seller', function ($query) {
            $query->where(['status' => 'approved']);
        })->where(['status' => 1])->orWhere(function ($query) {
            $query->where(['added_by' => 'admin', 'status' => 1]);
        });
    }

    const SIZE = [
        'g'  => 'غرام',
        'kg' => 'كيلو',
        'ml' => 'ملى',
        'l'  => 'لتر',
    ];

    public function stocks()
    {
        return $this->hasMany(ProductStock::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class,'product_id');
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function scopeStatus($query)
    {
        return $query->where('featured_status', 1);
    }

    public function shop()
    {
        return $this->belongsTo(Shop::class, 'seller_id');
    }

    public function seller()
    {
        return $this->belongsTo(Seller::class, 'user_id');
    }

    public function rating()
    {
        return $this->hasMany(Review::class)
            ->select(DB::raw('avg(rating) average, product_id'))
            ->groupBy('product_id');
    }

    public function order_details()
    {
        return $this->hasMany(OrderDetail::class, 'product_id');
    }

    public function order_delivered()
    {
        return $this->hasMany(OrderDetail::class, 'product_id')
                        ->where('delivery_status','delivered');

    }

    public function wish_list()
    {
        return $this->hasMany(Wishlist::class, 'product_id');
    }

    public function getNameAttribute($name)
    {
        if (strpos(url()->current(), '/admin') || strpos(url()->current(), '/seller')) {
            return $name;
        }
        return $this->translations[0]->value ?? $name;
    }

    public function getDetailsAttribute($detail)
    {
        if (strpos(url()->current(), '/admin') || strpos(url()->current(), '/seller')) {
            return $detail;
        }
        return $this->translations[1]->value ?? $detail;
    }

    protected static function boot()
    {
        parent::boot();
        static::addGlobalScope('translate', function (Builder $builder) {
            $builder->with(['translations' => function ($query) {
                if (strpos(url()->current(), '/api')){
                    return $query->where('locale', App::getLocale());
                }else{
                    return $query->where('locale', Helpers::default_lang());
                }
            },'reviews'])->withCount('reviews');
        });
    }

    public function sizes()
    {
        return $this->hasMany(ProductSize::class);
    }

    public function getIsDiscountAttribute()
    {
        if($this->offer_price && Carbon::today() < $this->offer_end){
            return true;
        }else{
          return false;
        }
    }
}
