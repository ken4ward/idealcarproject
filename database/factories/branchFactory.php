<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\branch;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\branch>
 */
final class branchFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = branch::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'name' => fake()->state,
             'address' => fake()->streetAddress,
             'country_id' => \App\Models\country::factory(),
        ];
    }
}
