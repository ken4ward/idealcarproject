<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\invoices;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\invoices>
 */
final class invoicesFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = invoices::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'trip_id' => \App\Models\trips::factory(),
            'amount' => fake()->numberBetween($min = 1, $max = 200),
            'issued_date' => fake()->dateTime($max = 'now', $timezone = null)->format('Y-m-d H:i:s'),
            'user_id' => \App\Models\user::factory(),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
