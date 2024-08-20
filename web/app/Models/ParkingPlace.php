<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParkingPlace extends Model
{
    use HasFactory;

    protected $fillable = [
        'place_name',
        'location',
        'car_spots',
        'bike_spots',
        'car_price',
        'bike_price',
    ];
}
