<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use App\Models\Cost;
use App\Models\Admin;
use App\Repositories\Cost\CostInterface;
use App\Http\Requests\CostRequest;

class CostController extends Controller
{
    
    protected $costRP;

    public function __construct(CostInterface $costRepository)
    {
        $this->middleware('permission:cost-list|cost-create|cost-edit|cost-delete|cost-show', ['only' => ['index','store']]);
        $this->middleware('permission:cost-create', ['only' => ['create','store']]);
        $this->middleware('permission:cost-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:cost-delete', ['only' => ['destroy']]);
        $this->middleware('permission:cost-show', ['only' => ['show']]);
        $this->costRP = $costRepository;
    }

    public function index()
    {
        $costs = $this->costRP->getAll();
        return view('admin.cost.index', compact('costs'));
    }

    public function create()
    {
        return view('admin.cost.create');
    }

    public function store(CostRequest $request)
    {
        $request->validated();
        $data = new Cost([
            'name' => $request->name,
            'price'=> $request->price,
            'description' => $request->description,
            'created_by' =>  Auth::user()->id,
            'updated_by' =>  Auth::user()->id,
        ]);
        $result = $this->costRP->create($data->toArray());
        if ($result){
            return redirect()->route('cost.index')->with('message', trans('message.success-create'));
        }else{
            return back()->with('message', trans('message.save_error'));
        }
    }

    public function show($id)
    {
        $cost = $this->costRP->find($id);
        return view('admin.cost.detail', compact('cost'));
    }

    public function edit($id)
    {
        $cost = $this->costRP->find($id);
        return view('admin.cost.edit', compact('cost'));
    }

    public function update(CostRequest $request, $id)
    {
        $request->validated();
        $cost = $this->costRP->find($id);
        $cost->name = $request->name;
        $cost->price = $request->price;
        $cost->description = $request->description;
        $cost->updated_by = Auth::user()->id;
        $result = $this->costRP->update($id, $cost->toArray());
        if ($result){
            return redirect()->route('cost.index')->with('message', trans('message.success-edit'));
        }else{
            return back()->with('message',trans('message.update_error'));
        }
    }

    public function destroy(Request $request)
    {
        $cost = $this->costRP->find($request->id);
        $cost->isdeleted = true;

        $result = $this->costRP->update($cost->id, $cost->toArray());
        if ($result) { 
            return back()->with('message', trans('message.success-delete'));
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }

}
