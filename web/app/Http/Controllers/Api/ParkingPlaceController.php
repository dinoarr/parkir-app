<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ParkingPlace;
use Illuminate\Http\Request;

class ParkingPlaceController extends Controller
{
    public function index()
    {
        $locations = ParkingPlace::all();
        return response()->json($locations);
    }

    public function show($id)
    {
        // Mendapatkan satu tempat parkir berdasarkan ID
        $parkingPlace = ParkingPlace::findOrFail($id);

        // Mengembalikan data dalam format JSON
        return response()->json($parkingPlace);
    }
}
