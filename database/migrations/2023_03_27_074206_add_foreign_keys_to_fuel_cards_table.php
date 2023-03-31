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
        Schema::table('fuel_cards', function (Blueprint $table) {
            $table->foreign(['branch_id'], 'fuel_cards_ibfk_1')->references(['id'])->on('branch')->onUpdate('NO ACTION')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('fuel_cards', function (Blueprint $table) {
            $table->dropForeign('fuel_cards_ibfk_1');
        });
    }
};
