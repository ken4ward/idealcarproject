<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\vehicles;
use App\Models\trips;
use App\Models\vehicle_locations;
use App\Models\maintenance_schedule;
use App\Models\maintenance_records;
use App\Models\rental_options;

class VehiclesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        vehicles::factory(1)->create()->each(function ($vehicles) {
            $trips= trips::factory(2)->make();
            $vehicles->trips()->saveMany($trips);

            $vehicle_locations= vehicle_locations::factory(2)->make();
            $vehicles->vehicle_locations()->saveMany($vehicle_locations);

            $maintenance_schedule = maintenance_schedule::factory(2)->make();
            $vehicles->maintenance_schedule()->saveMany($maintenance_schedule);

            $maintenance_records = maintenance_records::factory(2)->make();
            $vehicles->maintenance_records()->saveMany($maintenance_records);

            $rental_options = rental_options::factory(2)->make();
            $vehicles->rental_options()->saveMany($rental_options);
        });
    }
}
