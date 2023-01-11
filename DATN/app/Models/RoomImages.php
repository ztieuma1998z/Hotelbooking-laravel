<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoomImages extends Model
{
    protected $table = 'room_images';
    protected $guarded = ['id'];

    public function room(){
    	  return $this->belongsTo('App\Models\Room','room_id','id');
    }
}
