<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\invoices;
use App\Models\payments;

class InvoicesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        invoices::factory(3)->create()->each(function ($invoices) {
            $payments= payments::factory(1)->make();
            $invoices->payment()->saveMany($payments);
        });
    }
}
