<?php
namespace App\Repositories\RoomImage;

use App\Repositories\EloquentRepository;

class RoomImageRepository extends EloquentRepository implements RoomImageInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\RoomImages::class;
    } 

    public function findRoomImageByIdRoom($id)
    {
        return $this->_model->where('room_id',$id)->get();
    }

    public function findRoomImage($id)
    {
        return $this->_model->findOrFail($id);
    }
}