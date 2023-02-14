<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_locations', function (Blueprint $table) {
            $table->id();
            $table->string('user_id');
            $table->string('city');
            $table->string('building_type');
            $table->string('building_no');
            $table->string('building_floor');
            $table->text('address_details');
            $table->string('address_longitude');
            $table->string('address_latitude');
            $table->string('working_hours');
            $table->string('delivery_phone');
            $table->string('building_image');
            $table->string('delivery_image');
            $table->timestamps();
        });
    } 
    

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer_locations');
    }
}
