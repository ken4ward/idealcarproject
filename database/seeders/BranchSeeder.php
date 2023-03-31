<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\user;
use App\Models\country;
use App\Models\branch;
use App\Models\vehicles;
use App\Models\fuel_cards;
use App\Models\branch_card_to_user;
use App\Models\maintenance_schedule;

class BranchSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        branch::factory(3)->create()->each(function ($branch) {
            $user = user::factory(4)->make();
            $branch->users()->saveMany($user);

            $vehicles = vehicles::factory(2)->make();
            $branch->vehicles()->saveMany($vehicles);

            $fuel_cards = fuel_cards::factory(2)->make();
            $branch->fuel_cards()->saveMany($fuel_cards);

            $branch_card_to_user = branch_card_to_user::factory(2)->make();
            $branch->branch_card_to_user()->saveMany($branch_card_to_user);
        });
    }
}
