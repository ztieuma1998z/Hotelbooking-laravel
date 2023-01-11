<?php
namespace App\Repositories\RoomType;

use App\Repositories\EloquentRepository;

class RoomTypeRepository extends EloquentRepository implements RoomTypeInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\RoomType::class;
    }    
}