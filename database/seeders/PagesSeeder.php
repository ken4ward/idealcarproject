<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\pages;
use App\Models\languages;

class PagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         pages::factory(3)->create()->each(function ($pages) {
            $languages = languages::factory(1)->make();
            $pages->languages()->saveMany($languages);
        });
    }
}
