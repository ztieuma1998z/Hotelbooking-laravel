<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\PriceRequest;
use App\Repositories\Price\PriceInterface;
use App\Models\Price;
use Auth;
use Session;

class PriceController extends Controller
{

    protected $priceRP;

    public function __construct(PriceInterface $priceRepository)
    {
        $this->middleware('permission:price-list|price-create|price-edit|price-delete|price-show', ['only' => ['index','store']]);
        $this->middleware('permission:price-create', ['only' => ['create','store']]);
        $this->middleware('permission:price-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:price-delete', ['only' => ['destroy']]);
        $this->middleware('permission:price-show', ['only' => ['show']]);
        $this->priceRP = $priceRepository;
    }

    public function index()
    {
        $price = $this->priceRP->getAll();
        return view('admin.price.index', compact('price'));
    }

    public function create()
    {
        return view('admin.price.create');
    }

    public function store(PriceRequest $request)
    {
        $request->validated();
        $data = new Price([
            'date' => $request->date,
            'percent'=> $request->percent,
            'description'=> $request->description,
            'isdeleted' => false,
            'created_by' =>  Auth::user()->id,
            'updated_by' =>  Auth::user()->id,
        ]);
        $result = $this->priceRP->create($data->toArray());
        if ($result){
            return redirect()->route('price.index')->with('message', trans('message.success-create'));
        }else{
            return back()->with('message',trans('message.save_error'));
        }
    }

    public function show($id)
    {
        $price = $this->priceRP->find($id);
        return view('admin.price.detail', compact('price'));
    }

    public function edit($id)
    {
        $price = $this->priceRP->find($id);
        return view('admin.price.edit', compact('price'));
    }

    public function update(PriceRequest $request, $id)
    {
        $request->validated();
        $price = $this->priceRP->find($id);
        $price->date = $request->date;
        $price->percent = $request->percent;
        $price->description = $request->description;
        $price->updated_by = Auth::user()->id;
        $result = $this->priceRP->update($id, $price->toArray());
        if ($result){
            return redirect()->route('price.index')->with('message', trans('message.success-edit'));
        }else{
            return back()->with('message',trans('message.update_error'));
        }
    }

    public function destroy(Request $request)
    {
        $price = $this->priceRP->find($request->id);
        $price->isdeleted = true;

        $result = $this->priceRP->update($price->id, $price->toArray());
        if ($result) { 
            return back()->with('message', trans('message.success-delete'));
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }
}
