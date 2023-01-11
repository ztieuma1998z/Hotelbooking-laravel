<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use Illuminate\Notifications\Notifiable;

class Booking extends Model implements AuditableContract
{
	use \OwenIt\Auditing\Auditable;
    use Notifiable;

    protected $table = 'bookings';
    protected $guarded = ['id'];
    protected $timestamp = true;

    public function rooms(){
        return $this->belongsToMany('App\Models\Room', 'booking_detail', 'booking_id', 'room_id');
    }


    public function users(){
        return $this->belongsTo('App\Models\User','user_id','id');
    }

    public function createByAdmin(){
        return $this->belongsTo('App\Models\Admin','created_by','id');
    }
}
