<?php
namespace App\Repositories\Vote;

interface VoteInterface
{
    public function countVote();
    public function getVoteByCreateAtDESC();
}