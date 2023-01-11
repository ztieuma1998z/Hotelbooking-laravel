<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\Vote\VoteInterface;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Vote;
class VoteController extends Controller
{
	protected $voteRP;

	public function __construct(VoteInterface $voteInterface)
	{
		$this->middleware('permission:vote-list|vote-show', ['only' => ['index']]);
		$this->middleware('permission:vote-show', ['only' => ['show']]);
		$this->voteRP = $voteInterface;
	}
	public function index(){
		$vote = $this->voteRP->getVoteByCreateAtDESC();
		return view('admin.vote.index', compact('vote'));
	}

	public function show($id){
		$vote = $this->voteRP->find($id);
		return view('admin.vote.detail', compact('vote'));
	}
}
