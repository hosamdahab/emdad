<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminCommissions extends Model
{
    use HasFactory;

    protected $fillable = [

        'percent',
  
    ];


}
