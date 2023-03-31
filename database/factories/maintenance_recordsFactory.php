<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\maintenance_records;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\maintenance_records>
 */
final class maintenance_recordsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = maintenance_records::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'vehicle_id' => \App\Models\vehicles::factory(),
            'description' => fake()->text,
            'date' => fake()->date(),
            'status' => fake()->randomElement(['SCHEDULED', 'UNEXPECTED']),
            'deleted_at' => fake()->dateTime(),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
