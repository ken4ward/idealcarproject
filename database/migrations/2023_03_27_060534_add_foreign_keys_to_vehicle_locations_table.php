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
        Schema::table('vehicle_locations', function (Blueprint $table) {
            $table->foreign(['vehicle_id'], 'vehicle_locations_ibfk_1')->references(['id'])->on('vehicles')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(['branch_id'], 'vehicle_locations_ibfk_2')->references(['id'])->on('branch')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vehicle_locations', function (Blueprint $table) {
            $table->dropForeign('vehicle_locations_ibfk_1');
            $table->dropForeign('vehicle_locations_ibfk_2');
        });
    }
};
