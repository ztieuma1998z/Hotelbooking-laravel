<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;


class Room extends Model implements AuditableContract
{
    use \OwenIt\Auditing\Auditable;
    protected $table = 'rooms';
    protected $guarded = ['id'];
    protected $timestamp = true;
    public function roomtypes(){
        return $this->belongsTo('App\Models\RoomType','room_type_id','id');
    }

    public function booking_detail(){
        return $this->belongsTo('App\Models\BookingDetail','id','room_id');
    }

    public function service(){
       return $this->belongsToMany('App\Models\Service', 'room_service', 'room_id', 'service_id');
    }
    //many to many with tags
    public function tag(){
        return $this->belongsToMany('App\Models\Tag', 'room_tag', 'room_id', 'tag_id');
    }

     public function createByAdmin(){
        return $this->belongsTo('App\Models\Admin','created_by','id');
    }
    public function updateByAdmin(){
        return $this->belongsTo('App\Models\Admin','updated_by','id');
    }
    
}
