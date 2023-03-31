<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\user_contacts;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\user_contacts>
 */
final class user_contactsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = user_contacts::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'name' => fake()->randomElement(['BUSINESS', 'PERSONAL']),
            'address' => fake()->address,
            'phone' => fake()->phoneNumber,
            'user_id' => \App\Models\country::factory(),
        ];
    }
}
