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
        Schema::table('audit_logs', function (Blueprint $table) {
            $table->foreign(['user_id'], 'audit_logs_ibfk_1')->references(['id'])->on('user')->onUpdate('NO ACTION')->onDelete('CASCADE');
            $table->foreign(['action_id'], 'audit_logs_ibfk_2')->references(['id'])->on('actions')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(['trip_id'], 'audit_logs_ibfk_3')->references(['id'])->on('trips')->onUpdate('NO ACTION')->onDelete('NO ACTION');
            $table->foreign(['vehicle_id'], 'audit_logs_ibfk_4')->references(['id'])->on('vehicles')->onUpdate('NO ACTION')->onDelete('NO ACTION');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('audit_logs', function (Blueprint $table) {
            $table->dropForeign('audit_logs_ibfk_1');
            $table->dropForeign('audit_logs_ibfk_2');
            $table->dropForeign('audit_logs_ibfk_3');
            $table->dropForeign('audit_logs_ibfk_4');
        });
    }
};
