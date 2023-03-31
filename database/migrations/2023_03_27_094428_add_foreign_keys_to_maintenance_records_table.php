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
        Schema::table('maintenance_records', function (Blueprint $table) {
            $table->foreign(['vehicle_id'], 'maintenance_records_ibfk_1')->references(['id'])->on('vehicles')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('maintenance_records', function (Blueprint $table) {
            $table->dropForeign('maintenance_records_ibfk_1');
        });
    }
};
