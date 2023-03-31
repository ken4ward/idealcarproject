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
        Schema::table('branch_user', function (Blueprint $table) {
            $table->foreign(['branch_id'], 'branch_user_ibfk_1')->references(['id'])->on('branch')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(['user_id'], 'branch_user_ibfk_2')->references(['id'])->on('user')->onUpdate('NO ACTION')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('branch_user', function (Blueprint $table) {
            $table->dropForeign('branch_user_ibfk_1');
            $table->dropForeign('branch_user_ibfk_2');
        });
    }
};
