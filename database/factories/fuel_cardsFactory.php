<?php

declare(strict_types=1);

namespace Database\Factories;

use App\Models\fuel_cards;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<\App\Models\fuel_cards>
 */
final class fuel_cardsFactory extends Factory
{
    /**
    * The name of the factory's corresponding model.
    *
    * @var string
    */
    protected $model = fuel_cards::class;

    /**
    * Define the model's default state.
    *
    * @return array
    */
    public function definition(): array
    {
        return [
            'card_number' => fake()->creditCardNumber,
            'expirationDate' => fake()->creditCardExpirationDate(),
            'cardType' => fake()->randomElement(['VIRTUAL', 'HARD']),
            'issuer' => fake()->randomElement(['MASTERCARD', 'MAESTRO', 'VISA', 'JESUS']),
            'currencyCode' => fake()->randomElement(['EUR (Euro)', 'NGN (Nigeria Naira)', 'USD (United States Dollar)', 'GBP (British Pound Sterling)', 'JPY (Japanese Yen)', 'AUD (Australian Dollar)', 'CHF (Swiss Franc)', 'CNY (Chinese Yuan Renminbi)', 'HKD (Hong Kong Dollar)', 'INR (Indian Rupee)', 'MXN (Mexican Peso)', 'SGD (Singapore Dollar)', 'THB (Thai Baht)', 'BRL (Brazilian Real)', 'ZAR (South African Rand)', 'SEK (Swedish Krona)', 'NOK (Norwegian Krone)', 'DKK (Danish Krone)', 'RUB (Russian Ruble)', 'TRY (Turkish Lira)', 'AED (United Arab Emirates Dirham)', 'BGN (Bulgarian Lev)', 'COP (Colombian Peso)', 'CZK (Czech Koruna)', 'EGP (Egyptian Pound)', 'HUF (Hungarian Forint)', 'IDR (Indonesian Rupiah)', 'ILS (Israeli Shekel)', 'KRW (South Korean Won)']),
            'balance' => fake()->numberBetween($min = 1, $max = 5000),
            'branch_id' => \App\Models\branch::factory(),
            'deleted_at' => fake()->dateTime()->format('Y-m-d H:i:s'),
            'created_by' => \App\Models\user::factory(),
            'updated_by' => \App\Models\user::factory(),
            'deleted_by' => \App\Models\user::factory(),
        ];
    }
}
