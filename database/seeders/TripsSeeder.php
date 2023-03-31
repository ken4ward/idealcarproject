<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\routes;
use App\Models\trips;
use App\Models\invoices;

class TripsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        trips::factory(2)->create()->each(function ($trips) {
            $routes = routes::factory(1)->make();
            $trips->routes()->saveMany($routes);

            $invoices = invoices::factory(1)->make();
            $trips->invoices()->saveMany($invoices);
        });
    }
}
