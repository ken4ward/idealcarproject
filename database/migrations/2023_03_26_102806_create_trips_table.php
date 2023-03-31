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
        Schema::create('trips', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('vehicle_id')->index('vehicle_id');
            $table->dateTime('start_time');
            $table->dateTime('end_time');
            $table->decimal('distance', 10);
            $table->time('duration');
            $table->decimal('cost', 10);
            $table->unsignedInteger('user_id')->index('user_id');
            $table->timestamps();
            $table->softDeletes();
            $table->timestamp('created_by')->nullable();
            $table->timestamp('updated_by')->nullable();
            $table->timestamp('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trips');
    }
};
