<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\RoomType\RoomTypeInterface;
use App\Repositories\Service\ServiceInterface;
use App\Repositories\Room\RoomInterface;
use App\Repositories\EloquentInterface;
use Illuminate\Database\Eloquent\Model;
use App\Repositories\Tag\TagInterface;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Requests\RoomRequest;
use App\Exports\RoomsExport;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\RoomImages;
use App\Models\RoomType;
use App\Helpers\Helper;
use App\Models\Member;
use App\Models\Room;
use App\Models\Tag;
use Session;
use Auth;
use Mail;

use App\Repositories\RoomImage\RoomImageInterface;

class RoomController extends Controller
{
    protected $roomRP;
    protected $roomtypeRP;
    protected $tagRP;
    protected $roomimageRP;

    public function __construct(RoomInterface $roomInterface, RoomTypeInterface $roomTypeInterface, TagInterface $tagInterface,ServiceInterface $serviceInterface, RoomImageInterface $roomimageInterface)
    {
        $this->middleware('permission:room-list|room-create|room-edit|room-delete|room-show|room-export', ['only' => ['index','store']]);
        $this->middleware('permission:room-create', ['only' => ['create','store']]);
        $this->middleware('permission:room-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:room-delete', ['only' => ['destroy']]);
        $this->middleware('permission:room-show', ['only' => ['show']]);
        $this->middleware('permission:room-export', ['only' => ['export']]);
        $this->roomRP = $roomInterface;
        $this->roomtypeRP = $roomTypeInterface;
        $this->tagRP = $tagInterface;
        $this->serviceRP = $serviceInterface;
        $this->roomimageRP = $roomimageInterface;
    }

    public function index()
    {
        $rooms = $this->roomRP->getAll();
        return view('admin.room.index', compact('rooms'));
    }

    public function create()
    {
        $roomtypes = $this->roomtypeRP->getPluck('name','id');
        $tags = $this->tagRP->getPluck('tag_name','id');
        $services = $this->serviceRP->getPluck('name','id');
        return view('admin.room.create',compact('roomtypes','tags','services'));
    }

    public function store(RoomRequest $request)
    {   
        $request->validated();
        $imageName = 'default.png';
        if($request->hasFile('image'))
        {
            $helper = new Helper();
            $imageName = $helper->uploadFile(request('image'));
        }
        $dataroom = new Room;
        $dataroom->name = $request->name;
        $dataroom->description = $request->description;
        $dataroom->thumbnail = $imageName;
        $dataroom->room_code = Str::random(10);
        $dataroom->room_type_id = $request->room_type_id;
        $dataroom->price = $request->price;
        $dataroom->location = $request->location;
        $dataroom->adult = $request->adult;
        $dataroom->kid = $request->kid;
        $dataroom->acreage = $request->acreage;
        $dataroom->status = $request->status;
        $dataroom->isdeleted = false;
        $dataroom->created_by = Auth::user()->id;
        $dataroom->updated_by = Auth::user()->id;
        // $data->save();
        $data = $this->roomRP->create($dataroom->toArray());
        $tag_list = $request->tags;
        $data->tag()->attach($tag_list);

        $service_list = $request->services;
        $data->service()->attach($service_list);
        
        //Upload multiple image 
        if ($files = $request->file('profileImage')) {
            foreach($files as $img) {
                $imageExt = $img->getClientOriginalExtension();
                $imageName = date('Y-M-D') . '_' . round(microtime(true) * 1000) . '.' . $imageExt;
                $img->move('administration/profile_images/', $imageName);
                // Save In Database
                $room_img = new RoomImages([
                    'image_name' => $imageName,
                    'room_id' => $data->id,
                ]);
                $room_img->save();
            }
        }     
        Mail::send('email.member',[
            'name' => $data->name,
            'description' => $data->description,
            'price' => $data->price,
            'adult' => $data->adult,
            'kid' => $data->kid,
            'acreage' => $data->acreage,
        ], function($message) use ($data) {
            $member = array_unique(Member::pluck('email','email')->toArray());
            foreach ($member as $key => $value) {
                $message->to($member[$key]);
                $message->subject('Quảng Cáo');
            }  
        });
        return redirect()->route('room.index')->with('message', trans('message.success-create'));
    }

    public function show($id)
    {
        $room = $this->roomRP->find($id);
        $images = RoomImages::where('room_id',$id)->get();
        return view('admin.room.detail',compact('room','images'));
    }

    public function edit($id)
    {
        $room = $this->roomRP->find($id);
        $roomtypes = $this->roomtypeRP->getPluck('name','id');
        $tags = $this->tagRP->getPluck('tag_name','id');
        $services = $this->serviceRP->getPluck('name','id');
        $images = RoomImages::where('room_id',$id)->get();
        return view('admin.room.edit',compact('room','roomtypes','tags','images','services'));
    }

    public function update(RoomRequest $request, $id)
    {
        $request->validated();
        $room = $this->roomRP->find($id);
        $imageName = $room->thumbnail;
        
        if($request->hasFile('image')){
            $helper = new Helper();
            $imageName = $helper->uploadFile(request('image'));
        }
        $room->name = $request->name;
        $room->description = $request->description;
        $room->thumbnail = $imageName;
        $room->room_type_id = $request->room_type_id;
        $room->price = $request->price;
        $room->location = $request->location;
        $room->adult = $request->adult;
        $room->kid = $request->kid;
        $room->acreage = $request->acreage;
        $room->status = $request->status;
        $room->updated_by = Auth::user()->id;
        $result = $this->roomRP->update($id, $room->toArray());
        $tag_list = $request->tags;
        $service_list = $request->services;
        $result->tag()->sync($tag_list);
        $result->service()->sync($service_list);
        if ($result){
            return redirect()->route('room.index')->with('message', trans('message.success-edit'));
        }else{
            return back()->with('message',trans('message.update_error'));
        }

    }

    public function editImage($id)
    {
        $data = $this->roomimageRP->findRoomImageByIdRoom($id);
        $name = $this->roomRP->findNameRoom($id);
        $id = $id;
        return view('admin.room.editImage',compact('data','id','name'));
    }

    public function updateImage(Request $request)
    {
          //Upload multiple image 
        if ($files = $request->file('profileImage')) {
            foreach($files as $img) {
                $imageExt = $img->getClientOriginalExtension();
                $imageName = date('Y-M-D') . '_' . round(microtime(true) * 1000) . '.' . $imageExt;
                $img->move('administration/profile_images/', $imageName);
                // Save In Database
                $room_img = new RoomImages([
                    'image_name' => $imageName,
                    'room_id' => $request->id,
                ]);
                $room_img->save();
            }

        }
        return back()->with('message', trans('message.success-edit'));

    }

    public function destroyImage(Request $request)
    {

        $data = $this->roomimageRP->findRoomImage($request->id);
        $data->delete();
        return back()->with('message', trans('message.success-delete'));
    }

    public function destroy(Request $request)
    {
        $room = $this->roomRP->find($request->id);
        $room->isdeleted = true;

        $result = $this->roomRP->update($room->id, $room->toArray());
        if ($result) { 
            return back()->with('message', trans('message.success-delete'));
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }
    
    public function export() 
    {
        return Excel::download(new RoomsExport, 'rooms.xlsx');
    }
}
