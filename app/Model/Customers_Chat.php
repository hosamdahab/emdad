<?php

namespace App\model;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customers_Chat extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'sent_by',
        'seen_by_customer',
        'seen_by_admin',
        'message',
        'status',
        
    ];
}
