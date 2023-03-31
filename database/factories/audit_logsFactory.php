<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\audit_logs;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\audit_logs>
 */
final class audit_logsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = audit_logs::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'name' => fake()->randomElement(['MAINTENANCE', 'LEASED', 'CUSTOMER_LOCATION', 'BOUGHT_FUEL']),
            'user_id' => \App\Models\user::factory(),
            'action_id' => \App\Models\actions::factory(),
            'trip_id' => \App\Models\trips::factory(),
            'vehicle_id' => \App\Models\vehicles::factory(),
            'log_details' => fake()->text,
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
