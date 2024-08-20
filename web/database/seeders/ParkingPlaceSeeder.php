<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ParkingPlaceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('parking_places')->insert([
            [
                'place_name' => 'CNPLUS',
                'location' => 'JL PLP',
                'car_spots' => 10,
                'bike_spots' => 30,
                'car_price' => 5000.00,
                'bike_price' => 3000.00,
                'created_at' =>now(),
                'updated_at' =>now(),
            ],
        ]);
    }
}
