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
        Schema::table('branch_card_to_user', function (Blueprint $table) {
            $table->foreign(['user_id'], 'branch_card_to_user_ibfk_1')->references(['id'])->on('user')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(['fuel_card_id'], 'branch_card_to_user_ibfk_2')->references(['id'])->on('fuel_cards')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(['branch_id'], 'branch_card_to_user_ibfk_3')->references(['id'])->on('branch')->onUpdate('NO ACTION')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('branch_card_to_user', function (Blueprint $table) {
            $table->dropForeign('branch_card_to_user_ibfk_1');
            $table->dropForeign('branch_card_to_user_ibfk_2');
            $table->dropForeign('branch_card_to_user_ibfk_3');
        });
    }
};
