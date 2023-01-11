<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;

class Tag extends Model implements AuditableContract
{
	use Notifiable;
	use \OwenIt\Auditing\Auditable;
	protected $table = 'tags';
	protected $guarded = ['id'];
	protected $timestamp = true;
	
	public function room(){
		return $this->belongsToMany('App\Models\Room','room_tag','tag_id', 'room_id');
	}

	public function createByAdmin(){
		return $this->belongsTo('App\Models\Admin','created_by','id');
	}
	public function updateByAdmin(){
		return $this->belongsTo('App\Models\Admin','updated_by','id');
	}
}
