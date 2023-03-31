<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\trips;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\trips>
 */
final class tripsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = trips::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'vehicle_id' => \App\Models\vehicles::factory(),
            'start_time' => fake()->dateTimeInInterval($startDate = '-1 years', $interval = '+99 days', $timezone = null)->format('Y-m-d H:i:s'),
            'end_time' => fake()->dateTimeInInterval($startDate = '-1 years', $interval = '+ 100 days', $timezone = null)->format('Y-m-d H:i:s'),
            'distance' => fake()->numberBetween($min = 1, $max = 100),
            'duration' => fake()->time(),
            'cost' => fake()->numberBetween($min = 1, $max = 100),
            'user_id' => \App\Models\user::factory(),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
