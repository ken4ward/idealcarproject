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
        Schema::table('trips', function (Blueprint $table) {
            $table->foreign(['user_id'], 'trips_ibfk_1')->references(['id'])->on('user')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(['vehicle_id'], 'trips_ibfk_2')->references(['id'])->on('vehicles')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('trips', function (Blueprint $table) {
            $table->dropForeign('trips_ibfk_1');
            $table->dropForeign('trips_ibfk_2');
        });
    }
};
