<?php

namespace Database\Seeders;

use App\Models\Book;
use Illuminate\Database\Seeder;

class BooksTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Let's truncate our existing records to start from scratch.
        Book::truncate();

        $faker = \Faker\Factory::create();

        // And now, let's create a few books in our database:
        for ($i = 0; $i < 5; $i++) {
            Book::create([
                'title' => $faker->sentence,
                'author' => $faker->name,
                'category' => $faker->sentence,
                'price' => $faker->randomDigit,
                'linkToImage' => $faker->sentence,
                'description' => $faker->sentence,
            ]);
        }
    }
}
