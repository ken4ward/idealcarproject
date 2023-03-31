<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\branch_card_to_user;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\branch_card_to_user>
 */
final class branch_card_to_userFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = branch_card_to_user::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
        'user_id' => \App\Models\user::factory(),
        'fuel_card_id' => \App\Models\fuel_cards::factory(),
        'branch_id' => \App\Models\branch::factory(),
         'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
         'created_by' => \App\Models\user::factory(),
         'updated_by' => \App\Models\user::factory(),
        'deleted_by' => \App\Models\branch::factory(),
        ];
    }
}
