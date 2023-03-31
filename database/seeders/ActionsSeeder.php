<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use  App\Models\actions;
use App\Models\audit_logs;

class ActionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        actions::factory(2)->create()->each(function ($actions) {
           $audit_logs = audit_logs::factory(4)->make();
           $actions->audit_logs()->saveMany($audit_logs);
       });
    }
}
