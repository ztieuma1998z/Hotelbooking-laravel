<?php

use Illuminate\Database\Seeder;
use App\Models\Room;
use Illuminate\Support\Str;
use App\Models\RoomImages;

class TestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      for ($i = 26; $i < 85; $i++) {
        $name[] = $i;
      }

        foreach ($name as $data) {
             RoomImages::create([
              'image_name' => '2020-Aug-Thu_1597312080522.jpg',
              'room_id' => $data,
              'created_by'=> 2,
              'updated_by'=> 2
             ]);
        }
    }
}
