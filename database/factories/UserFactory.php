<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\user;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\user>
 */
final class userFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = user::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'username' => fake()->unique()->userName,
            'password' => bcrypt(fake()->password),
            'email' => fake()->safeEmail,
        ];
    }
}
