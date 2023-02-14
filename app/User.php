<?php

namespace App;

use App\Model\Order;
use App\Model\ShippingAddress;
use App\Model\Wishlist;
use App\Model\Seller;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'f_name', 
        'l_name', 
        'name', 
        'email', 
        'password', 
        'phone', 
        'city',
        'country',
        'image', 
        'login_medium',
        'is_active',
        'social_id',
        'is_phone_verified',
        'temporary_token', 
        'imageDoc1', 
        'imageDoc2', 
        'isComplete', 
        'isDoc', 
        'treadType', 
        'categorySelected', 
        'sale_amount',
        'building_name',
        'building_email',
        'building_type',
        'building_size',
        'month_purchasing',
        'tax_no',
        'commercial_no'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'is_active' => 'integer',
        'is_phone_verified'=>'integer',
        'is_email_verified' => 'integer'
    ];

    public function wish_list()
    {
        return $this->hasMany(Wishlist::class, 'customer_id');
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'customer_id');
    }

    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_id');
    }

    public function shipping()
    {
        return $this->belongsTo(ShippingAddress::class, 'shipping_address');
    }
    
     public function branche()
    {
        return $this->belongsTo(Branche::class, 'branche');
    }
    
     public function seller()
    {
        return $this->belongsTo(Seller::class, 'seller');
    }

}
