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
        Schema::create('fuel_cards', function (Blueprint $table) {
            $table->increments('id');
            $table->string('card_number', 16)->unique('card_number');
            $table->dateTime('expirationDate');
            $table->enum('cardType', ['VIRTUAL', 'HARD']);
            $table->enum('issuer', ['MASTERCARD', 'MAESTRO', 'VISA', 'JESUS']);
            $table->decimal('balance', 10);
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
        Schema::dropIfExists('fuel_cards');
    }
};
