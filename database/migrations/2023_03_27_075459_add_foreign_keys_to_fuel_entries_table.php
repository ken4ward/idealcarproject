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
        Schema::table('fuel_entries', function (Blueprint $table) {
            $table->foreign(['vehicle_id'], 'fuel_entries_ibfk_1')->references(['id'])->on('vehicles')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(['fuel_card_id'], 'fuel_entries_ibfk_2')->references(['id'])->on('fuel_cards')->onUpdate('NO ACTION')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('fuel_entries', function (Blueprint $table) {
            $table->dropForeign('fuel_entries_ibfk_1');
            $table->dropForeign('fuel_entries_ibfk_2');
        });
    }
};
