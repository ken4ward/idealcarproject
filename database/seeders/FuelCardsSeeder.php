<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\fuel_cards;
use App\Models\fuel_entries;

class FuelCardsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        fuel_cards::factory(1)->create()->each(function ($fuel_cards) {
            $fuel_entries = fuel_entries::factory(2)->make();
            $fuel_cards->fuel_entries()->saveMany($fuel_entries);
        });
    }
}
