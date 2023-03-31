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
        Schema::table('rental_options', function (Blueprint $table) {
            $table->foreign(['branch_id'], 'rental_options_ibfk_1')->references(['id'])->on('branch')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(['vehicle_id'], 'rental_options_ibfk_2')->references(['id'])->on('vehicles')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('rental_options', function (Blueprint $table) {
            $table->dropForeign('rental_options_ibfk_1');
            $table->dropForeign('rental_options_ibfk_2');
        });
    }
};
