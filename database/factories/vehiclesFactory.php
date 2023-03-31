<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\vehicles;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\vehicles>
 */
final class vehiclesFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = vehicles::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        $faker = (new \Faker\Factory())::create();
        $this->faker->addProvider(new \Faker\Provider\Fakecar($this->faker));
        $vehicle = $this->faker->vehicleArray();

        return [
            'make' => $vehicle['brand'],
            'model' => $vehicle['model'],
            'year' => $this->faker->biasedNumberBetween(2015, date('Y'), 'sqrt'),
            'registration_number' => $this->faker->vehicleRegistration,
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
                        'updated_by' => \App\Models\user::factory(),
                        'deleted_by' => \App\Models\user::factory(),
            'mileage' => fake()->numberBetween($min = 10, $max = 200),
            'branch_id' => \App\Models\branch::factory(),
        ];
    }
}
