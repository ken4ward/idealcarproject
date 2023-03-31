<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\vehicle_locations;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\vehicle_locations>
 */
final class vehicle_locationsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = vehicle_locations::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'latitude' => fake()->latitude,
            'longitude' => fake()->longitude,
            'timestamp' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'vehicle_id' => \App\Models\vehicles::factory(),
            'location' => fake()->randomElement(['AT_BRANCH', 'ON_TRIP']),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
