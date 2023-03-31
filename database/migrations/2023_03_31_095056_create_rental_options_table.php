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
        Schema::create('rental_options', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('vehicle_type', 50);
            $table->integer('rental_duration');
            $table->decimal('daily_rate', 10);
            $table->decimal('weekly_rate', 10);
            $table->decimal('monthly_rate', 10);
            $table->integer('mileage_limit');
            $table->decimal('excess_mileage_rate', 10);
            $table->decimal('deposit_amount', 10);
            $table->decimal('late_return_fee', 10);
            $table->decimal('insurance_rate', 10);
            $table->timestamps();
            $table->softDeletes();
            $table->unsignedInteger('created_by');
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
        Schema::dropIfExists('rental_options');
    }
};
