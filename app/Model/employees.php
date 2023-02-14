<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class employees extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'phone', 
        'position',
        'parent_id',
        'branch_id'
       
    ];
}
