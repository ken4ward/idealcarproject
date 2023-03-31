<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\rental_options;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\rental_options>
 */
final class rental_optionsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = rental_options::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'rental_duration' => fake()->numberBetween($min = 1, $max = 100),
            'daily_rate' => fake()->numberBetween($min = 90, $max = 100),
            'weekly_rate' => fake()->numberBetween($min = 80, $max = 150),
            'monthly_rate' => fake()->numberBetween($min =70, $max = 350),
            'mileage_limit' => fake()->numberBetween($min = 50, $max = 100),
            'excess_mileage_rate' => fake()->numberBetween($min = 1, $max = 10),
            'deposit_amount' => fake()->numberBetween($min = 100, $max = 200),
            'late_return_fee' => fake()->numberBetween($min = 10, $max = 100),
            'insurance_rate' => fake()->numberBetween($min = 10, $max = 100),
            'deleted_at' => fake()->dateTime(),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
