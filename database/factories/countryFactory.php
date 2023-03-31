<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\country;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\country>
 */
final class countryFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = country::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'name' => fake()->country,
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
