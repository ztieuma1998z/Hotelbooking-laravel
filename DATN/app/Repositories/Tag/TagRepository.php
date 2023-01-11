<?php
namespace App\Repositories\Tag;

use App\Repositories\EloquentRepository;

class TagRepository extends EloquentRepository implements TagInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Tag::class;
    }    
}