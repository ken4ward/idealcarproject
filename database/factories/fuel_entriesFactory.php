<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\fuel_entries;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\fuel_entries>
 */
final class fuel_entriesFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = fuel_entries::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'vehicle_id' => \App\Models\vehicles::factory(),
            'fuel_card_id' => \App\Models\fuel_cards::factory(),
            'date' => fake()->date(),
            'odometer' => fake()->numberBetween($min = 60, $max = 500),
            'liters' => fake()->numberBetween($min = 30, $max = 100),
            'price_per_liter' => fake()->numberBetween($min = 1, $max = 3),
            'total_price' => fake()->numberBetween($min = 1, $max = 50),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
