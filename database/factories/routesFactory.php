<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\routes;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\routes>
 */
final class routesFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = routes::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'trip_id' => \App\Models\trips::factory(),
            'name' => fake()->name,
            'start_location' => fake()->randomFloat(),
            'end_location' => fake()->randomFloat(),
            'duration_in_minutes' => fake()->numberBetween($min = 1, $max = 100),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
