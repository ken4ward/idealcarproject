<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\user;
use App\Models\user_profiles;
use App\Models\user_logins;
use App\Models\user_contacts;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        user::factory(1)->create()->each(function ($user) {
            $user_profiles = user_profiles::factory()->make();
            $user->user_profiles()->save($user_profiles); // one to one relationship

            $user_logins= user_logins::factory(2)->make();
            $user->user_logins()->saveMany($user_logins);

            $user_contacts = user_contacts::factory(2)->make();
            $user->user_contacts()->saveMany($user_contacts);
        });
    }
}
