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
        Schema::create('audit_logs', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('name', ['MAINTENANCE', 'LEASED', 'CUSTOMER_LOCATION', 'BOUGHT_FUEL']);
            $table->unsignedInteger('user_id')->nullable()->index('user_id');
            $table->unsignedInteger('action_id')->nullable()->index('action_id');
            $table->unsignedInteger('trip_id')->nullable()->index('trip_id');
            $table->unsignedInteger('vehicle_id')->nullable()->index('vehicle_id');
            $table->text('log_details')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->nullable();
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
        Schema::dropIfExists('audit_logs');
    }
};
