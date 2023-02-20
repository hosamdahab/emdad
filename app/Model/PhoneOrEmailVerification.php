<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PhoneOrEmailVerification extends Model
{
    protected $guarded=[];
    protected $table='phone_or_email_verifications';
}
