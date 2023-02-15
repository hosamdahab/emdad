<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Model\Product;

class ProductSize extends Model
{
    // use HasFactory;
    protected $guarded=[];

    public function product()
    {
        return $this->belongsTo(Product::class,'product_id');
    }
}
