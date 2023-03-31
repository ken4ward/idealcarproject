<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\maintenance_schedule;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\maintenance_schedule>
 */
final class maintenance_scheduleFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = maintenance_schedule::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'duration' => fake()->time(),
            'mileage_interval' => fake()->numberBetween($min = 250, $max = 300),
            'date_interval' => fake()->numberBetween($min = 1, $max = 3),
            'vehicle_id' => \App\Models\vehicles::factory(),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),

        ];
    }
}
