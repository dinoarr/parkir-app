<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class WebUser extends Authenticatable
{
    protected $table = 'web_users';

    // Kolom yang bisa diisi
    protected $fillable = [
        'username',
        'email',
        'phone_number',
        'password',
        'role',
    ];

}
