<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fuel_entries', function (Blueprint $table) {
            $table->integer('id', true);
            $table->unsignedInteger('vehicle_id')->index('vehicle_id');
            $table->unsignedInteger('fuel_card_id')->index('fuel_card_id');
            $table->date('date');
            $table->integer('odometer');
            $table->decimal('liters', 10);
            $table->decimal('price_per_liter', 10);
            $table->decimal('total_price', 10);
            $table->timestamps();
            $table->softDeletes();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fuel_entries');
    }
};
