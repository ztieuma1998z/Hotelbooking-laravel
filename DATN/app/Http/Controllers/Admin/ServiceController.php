<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\Service\ServiceInterface;
use App\Http\Requests\ServiceRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use Carbon\Carbon;
use Auth;

class ServiceController extends Controller
{
    protected $serviceRP;

    public function __construct(ServiceInterface $serviceInterface)
    {
        $this->middleware('permission:service-list|service-create|service-edit|service-delete|service-show', ['only' => ['index','store']]);
        $this->middleware('permission:service-create', ['only' => ['create','store']]);
        $this->middleware('permission:service-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:service-delete', ['only' => ['destroy']]);
        $this->middleware('permission:service-show', ['only' => ['show']]);
        $this->serviceRP = $serviceInterface;
    }

    public function index()
    {
        $services = $this->serviceRP->getAll();
        return view('admin.service.index', compact('services'));
    }

    public function create()
    {
        return view('admin.service.create');
    }

    public function store(ServiceRequest $request)
    {
        $request->validated();
        $data = new Service([
            'name' => $request->name,
            'description' => $request->description,
            'isdeleted' => false,
            'created_by' =>  Auth::user()->id,
            'updated_by' =>  Auth::user()->id,
        ]);
        $result = $this->serviceRP->create($data->toArray());
        if ($result){
            return redirect()->route('service.index')->with('message', trans('message.success-create'));
        }else{
            return back()->with('message',trans('message.save_error'));
        }
    }

    public function show($id)
    {
        $service = $this->serviceRP->find($id);
        return view('admin.service.detail', compact('service'));
    }

    public function edit($id)
    {
        $service = $this->serviceRP->find($id);
        return view('admin.service.edit', compact('service'));
    }

    public function update(ServiceRequest $request, $id)
    {
        $request->validated();
        $service = $this->serviceRP->find($id);
        $service->name = $request->name;
        $service->description = $request->description;
        $service->updated_by = Auth::user()->id;
        $result = $this->serviceRP->update($id, $service->toArray());

        if ($result){
            return redirect()->route('service.index')->with('message', trans('message.success-edit'));
        }else{
            return back()->with('message',trans('message.update_error'));
        }

    }

    public function destroy(Request $request)
    {
        $service = $this->serviceRP->find($request->id);
        $service->isdeleted = true;

        $result = $this->serviceRP->update($service->id, $service->toArray());
        if ($result) { 
            return back()->with('message', trans('message.success-delete'));
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }
}
