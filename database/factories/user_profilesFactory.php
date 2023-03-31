<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\user_profiles;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\user_profiles>
 */
final class user_profilesFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = user_profiles::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'user_id' => \App\Models\user::factory(),
            'first_name' => fake()->firstName,
            'last_name' => fake()->lastName,
            'date_of_birth' => fake()->date(),
        ];
    }
}
