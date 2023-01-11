<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking_Cost extends Model
{
    //
    protected $table = 'cost_booking';
    protected $guarded = ['id'];
    protected $timestamp = true;

    public function cost(){
        return $this->belongsTo('App\Models\Cost','cost_id');
    }
}
