<?php
namespace App\Repositories\Cost;

use App\Repositories\EloquentRepository;

class CostRepository extends EloquentRepository implements CostInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Cost::class;
    }    
}