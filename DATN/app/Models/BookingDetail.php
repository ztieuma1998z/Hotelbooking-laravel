<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BookingDetail extends Model
{
    protected $table = 'booking_detail';
    protected $guarded = ['id'];
    protected $timestamp = true;

    public function booking(){
    	return $this->belongsTo('App\Models\Booking','booking_id');
    }
    
    public function room(){
        return $this->belongsTo('App\Models\Room','room_id');
    }
}
