<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerLocations extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 
        'user_id', 
        'city',
        'building_type', 
        'building_no', 
        'building_floor', 
        'address_details',
        'address_longitude',
        'address_latitude', 
        'working_hours', 
        'delivery_phone', 
        'building_image', 
        'delivery_image'
      
    ];
}
