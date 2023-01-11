<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    //
    protected $table = 'vote_booking';
    protected $guarded = ['id'];
    protected $timestamp = true;

    public function booking(){
        return $this->belongsTo('App\Models\Booking','booking_id','id');
    }

}
