<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
class Service extends Model implements AuditableContract
{ 
	use \OwenIt\Auditing\Auditable;
	protected $table = 'services';
	protected $guarded = ['id'];
	protected $timestamp = true;
	
	public function createByAdmin(){
		return $this->belongsTo('App\Models\Admin','created_by','id');
	}
	public function updateByAdmin(){
		return $this->belongsTo('App\Models\Admin','updated_by','id');
	}

}
