<?php
namespace App\Repositories\Service;

use App\Repositories\EloquentRepository;

class ServiceRepository extends EloquentRepository implements ServiceInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Service::class;
    }    
}