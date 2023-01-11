<?php
namespace App\Repositories\Vote;

use App\Repositories\EloquentRepository;

class VoteRepository extends EloquentRepository implements VoteInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Vote::class;
    } 

    public function countVote()
    {
    	return $this->_model->where('isdeleted',0)->count();
    }

    public function getVoteByCreateAtDESC()
    {
        return $this->_model->orderBy('created_at', 'desc')->get();
    }   
}