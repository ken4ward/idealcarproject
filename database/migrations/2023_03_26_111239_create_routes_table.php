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
        Schema::create('routes', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('trip_id')->index('trip_id');
            $table->string('name')->nullable();
            $table->point('start_location');
            $table->point('end_location');
            $table->integer('duration_in_minutes')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->timestamp('created_by')->nullable();
            $table->timestamp('updated_by')->nullable();
            $table->timestamp('deleted_by')->nullable();

            $table->spatialIndex(['end_location'], 'end_location');
            $table->spatialIndex(['start_location'], 'start_location');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('routes');
    }
};
