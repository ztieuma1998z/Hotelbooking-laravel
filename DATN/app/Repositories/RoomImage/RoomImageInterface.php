<?php
namespace App\Repositories\RoomImage;

interface RoomImageInterface
{
	public function findRoomImageByIdRoom($i);
	public function findRoomImage($id);
}