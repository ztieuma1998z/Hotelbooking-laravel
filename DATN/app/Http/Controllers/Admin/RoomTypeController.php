<?php

namespace App\Http\Controllers\Admin;
use App\Repositories\RoomType\RoomTypeInterface;
use App\Http\Requests\RoomtypeRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RoomType;
use App\Helpers\Helper;
use Carbon\Carbon;
use Auth;

class RoomTypeController extends Controller
{
    protected $roomtypeRP;

    public function __construct(RoomTypeInterface $roomtypeRepository)
    {
        $this->middleware('permission:roomtype-list|roomtype-create|roomtype-edit|roomtype-delete|roomtype-show', ['only' => ['index','store']]);
        $this->middleware('permission:roomtype-create', ['only' => ['create','store']]);
        $this->middleware('permission:roomtype-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:roomtype-delete', ['only' => ['destroy']]);
        $this->middleware('permission:roomtype-show', ['only' => ['show']]);
        $this->roomtypeRP = $roomtypeRepository;

    }

    public function index()
    {
        $roomtypes = $this->roomtypeRP->getAll();
        return view('admin.roomtype.index', compact('roomtypes'));
    }

    public function create()
    {
        return view('admin.roomtype.create');
    }

    public function store(RoomtypeRequest $request)
    {
        $request->validated();
        $imageName = 'default.png';
        if($request->hasFile('image'))
        {
            $helper = new Helper();
            $url = 'administration/imageRoomtypes/';
            $imageName = $helper->uploadFileImage($url,request('image'));
        }
        $data = new RoomType([
            'name' => $request->name,
            'star'=> $request->star,
            'description' => $request->description,
            'isdeleted' => false,
            'image' => $imageName,
            'created_by' =>  Auth::user()->id,
            'updated_by' =>  Auth::user()->id,
        ]);
        $result = $this->roomtypeRP->create($data->toArray());
        if ($result){
            return redirect()->route('roomtype.index')->with('message', trans('message.success-create'));
        }else{
            return back()->with('message',trans('message.save_error'));
        }

    }

    public function show($id)
    {
        $roomtype = $this->roomtypeRP->find($id);
        return view('admin.roomtype.detail', compact('roomtype'));
    }

    public function edit($id)
    {
        $roomtype = $this->roomtypeRP->find($id);
        return view('admin.roomtype.edit', compact('roomtype'));
    }

    public function update(RoomtypeRequest $request, $id)
    {
        $request->validated();
        $roomtype = $this->roomtypeRP->find($id);
        $imageName = $roomtype->image;
        if($request->hasFile('image')){
            $helper = new Helper();
            $url = 'administration/imageRoomtypes/';
            $imageName = $helper->uploadFileImage($url,request('image'));
        }
        $roomtype->name = $request->name;
        $roomtype->star = $request->star;
        $roomtype->description = $request->description;
        $roomtype->image = $imageName;
        $roomtype->updated_by = Auth::user()->id;
        $result = $this->roomtypeRP->update($id, $roomtype->toArray());
        if ($result){
            return redirect()->route('roomtype.index')->with('message', trans('message.success-edit'));
        }else{
            return back()->with('message',trans('message.update_error'));
        }
    }

    public function destroy(Request $request)
    {
        $roomtype = $this->roomtypeRP->find($request->id);
        $roomtype->isdeleted = true;
        $result = $this->roomtypeRP->update($roomtype->id, $roomtype->toArray());
        if ($result) { 
            return back()->with('message', trans('message.success-delete'));;
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }
}

