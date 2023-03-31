<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\payments;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\payments>
 */
final class paymentsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = payments::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'invoice_id' => \App\Models\invoices::factory(),
            'amount' => fake()->numberBetween($min = 1, $max = 100),
            'payment_date' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
