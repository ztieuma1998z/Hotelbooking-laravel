<?php
namespace App\Repositories\Room;

use App\Repositories\EloquentRepository;

class RoomRepository extends EloquentRepository implements RoomInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Room::class;
    } 

    public function countRoom()
    {
    	return $this->_model->where('isdeleted',0)->count();
    }

    public function findNameRoom($id)
    {
        return $this->_model->where('id',$id)->select('name')->first();
    }   
}