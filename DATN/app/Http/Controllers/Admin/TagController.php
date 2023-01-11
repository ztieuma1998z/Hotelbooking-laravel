<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\Tag\TagInterface;

use App\Http\Controllers\Controller;
use App\Http\Requests\TagRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Tag;
use Session;
use Auth;

class TagController extends Controller
{
    protected $tagRP;

    public function __construct(TagInterface $tagInterface)
    {
        $this->middleware('permission:tag-list|tag-create|tag-edit|tag-delete|tag-show', ['only' => ['index','store']]);
        $this->middleware('permission:tag-create', ['only' => ['create','store']]);
        $this->middleware('permission:tag-edit', ['only' => ['edit','update']]);
        $this->middleware('permission:tag-delete', ['only' => ['destroy']]);
        $this->middleware('permission:tag-show', ['only' => ['show']]);
        $this->tagRP = $tagInterface;
    }

    public function index()
    {
        $tags = $this->tagRP->getAll();
        return view('admin.tag.index', compact('tags'));
    }

    public function create()
    {
        return view('admin.tag.create');
    }

    public function store(TagRequest $request)
    {
        $request->validated();
        $data = new Tag([
            'tag_name' => $request->tag_name,
            'slug'=> Str::slug($request->tag_name),
            'isdeleted' => false,
            'created_by' =>  Auth::user()->id,
            'updated_by' =>  Auth::user()->id,

        ]);
        $result = $this->tagRP->create($data->toArray());

        if ($result){
            return redirect()->route('tag.index')->with('message', trans('message.success-create'));
        }else{
            return back()->with('message',trans('message.save_error'));
        }
    }

    public function show($id)
    {
        $tag = $this->tagRP->find($id);
        return view('admin.tag.detail', compact('tag'));
    }

    public function edit($id)
    {
        $tag = $this->tagRP->find($id);
        return view('admin.tag.edit', compact('tag'));
    }

    public function update(TagRequest $request, $id)
    {
        $request->validated();
        $tag = $this->tagRP->find($id);
        $tag->tag_name = $request->tag_name;
        $tag->slug = Str::slug($request->tag_name);
        $tag->updated_by = Auth::user()->id;
        $result = $this->tagRP->update($id, $tag->toArray());

        if ($result){
            return redirect()->route('tag.index')->with('message', trans('message.success-edit'));
        }else{
            return back()->with('message',trans('message.update_error'));
        }
    }

    public function destroy(Request $request)
    {
        $tag = $this->tagRP->find($request->id);
        $tag->isdeleted = true;
        $result = $this->tagRP->update($tag->id, $tag->toArray());

        if ($result) { 
            return back()->with('message', trans('message.success-delete'));
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }
}
