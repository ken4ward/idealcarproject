<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\user_logins;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\user_logins>
 */
final class user_loginsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = user_logins::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'user_id' => \App\Models\user::factory(),
            'login_time' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'ip_address' => fake()->ipv4,
        ];
    }
}
