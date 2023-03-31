<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\actions;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\actions>
 */
final class actionsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = actions::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'name' => fake()->randomElement(['MAINTENANCE', 'RENTED', 'CUSTOMER_LOCATION', 'BOUGHT_FUEL']),
            'description' => fake()->text,
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
