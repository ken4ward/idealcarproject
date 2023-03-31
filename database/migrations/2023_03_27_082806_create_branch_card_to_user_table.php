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
        Schema::create('branch_card_to_user', function (Blueprint $table) {
            $table->integer('id', true);
            $table->unsignedInteger('user_id')->index('user_id');
            $table->unsignedInteger('fuel_card_id')->index('fuel_card_id');
            $table->unsignedInteger('branch_id')->index('branch_id');
            $table->timestamps();
            $table->softDeletes();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('branch_card_to_user');
    }
};
