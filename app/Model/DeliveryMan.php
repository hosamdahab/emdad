<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\City;
use App\Model\Order;

class DeliveryMan extends Model
{

    protected $fillable = [
        'seller_id', 'f_name', 'phone', 'zone_id'
    ];

    protected $hidden = ['password','auth_token'];

    protected $casts = [
        'is_active'=>'integer'
    ];


    public function get_zone() {

        return $this->hasOne(City::class,'state_id', 'zone_id');

    }


    public function get_count_orders() {

        return $this->hasMany(Order::class,'delivery_man_id', 'id');
    }


    function get_cancel_order_count()

    {
        return $this->hasMany(Order::class,'delivery_man_id', 'id')->where('order_status', '=', 'canceled');

    }


    function get_total_order_amount()

    {

        return $this->hasMany(Order::class,'delivery_man_id', 'id')->where('order_status', '=', 'delivered');

    }

    
}
