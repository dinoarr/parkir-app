<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('parking_places', function (Blueprint $table) {
            $table->id();
            $table->string('place_name');
            $table->string('location');
            $table->integer('car_spots')->nullable();
            $table->integer('bike_spots')->nullable();
            $table->decimal('car_price', 10, 2)->nullable();
            $table->decimal('bike_price', 10, 2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parking_places');
    }
};
