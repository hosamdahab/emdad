<?php

namespace App\Model;

use App\CPU\Helpers;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;

class Wishlist extends Model
{


    protected $fillable = [
        'product_id',
        'customer_id',
    
        
    ];

    protected $casts = [
        'product_id'  => 'integer',
        'customer_id' => 'integer',
        'created_at'  => 'datetime',
        'updated_at'  => 'datetime',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id')->select(['id','slug']);
    }

    public function product_full_info()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
