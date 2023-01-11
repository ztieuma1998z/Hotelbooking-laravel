<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class RoomType extends Model implements AuditableContract,Searchable
{
	use \OwenIt\Auditing\Auditable;
    protected $table = 'room_types';
    protected $guarded = ['id'];
    protected $timestamp = true;
    
    public function room(){
        return $this->hasMany('App\Models\Room');
    }

    public function getSearchResult(): SearchResult
    {
        $url = $url = url('/room-in-roomtype', $this->id);

        return new SearchResult(
            $this,
            $this->name,
            $url
        );
    }

    public function createByAdmin(){
        return $this->belongsTo('App\Models\Admin','created_by','id');
    }
    public function updateByAdmin(){
        return $this->belongsTo('App\Models\Admin','updated_by','id');
    }

}
