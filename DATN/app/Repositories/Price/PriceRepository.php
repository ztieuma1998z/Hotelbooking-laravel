<?php
namespace App\Repositories\Price;

use App\Repositories\EloquentRepository;

class PriceRepository extends EloquentRepository implements PriceInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Price::class;
    }    
}