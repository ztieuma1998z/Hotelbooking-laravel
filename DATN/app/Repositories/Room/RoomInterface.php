<?php
namespace App\Repositories\Room;

interface RoomInterface
{
    public function countRoom();
    public function findNameRoom($id);
}