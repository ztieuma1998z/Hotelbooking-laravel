<?php

use Illuminate\Database\Seeder;
use App\Models\Room;
use Illuminate\Support\Str;
class RoomDBSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $name = [
        	'61',
        	'62',
        	'63',
        	'64',
        	'65',
        ];

        foreach ($name as $data) {
        	 $room_code = Str::random(10);
             Room::create([
             	'name' => $data,
             	'description' => 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.',
             	'thumbnail' => '2020-Aug-Thu_1597312469554.jpg',
             	'room_code' => $room_code,
             	'room_type_id'=> 14,
             	'price' => 195000,
             	'location'=> '3st floor',
             	'adult' => 2,
             	'kid' => 1,
             	'acreage' => 200,
             	'status' => 0,
             	'isdeleted' => 0,
             	'created_by' => 2,
             	'updated_by'=>2
             ]);
        }
    }
}
