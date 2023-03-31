<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\user;
use App\Models\country;
use App\Models\branch;
use App\Models\languages;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        country::factory(30)->create()->each(function ($country) {
            $branch = branch::factory(2)->make();
            $country->branches()->saveMany($branch); // one to one relationship

            $languages = languages::factory(2)->make();
            $country->languages()->saveMany($languages);
        });
    }
}
