@extends('admin.layouts.main')
@section('title',trans('room.edit'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card ">
        <div class="card-header">
          <strong class="card-title">{{trans('room.edit')}} {{ $room->name }}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => ['room.update',$room->id], 'method' => 'put','enctype '=>'multipart/form-data']) }}
          <input type="hidden" name="id" value="{{$room->id}}" placeholder=""> 
          <div class="form-group row">
            <div class="col-md-7 row">
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.name'),'',['class' => 'font-weight-bold']) }}
                {{ Form::text('name', $room->name, ['class' => 'form-control','placeholder'=> trans('placeholder.name')  ]) }}
                <span class="text-danger">{{ $errors->first('name')}}</span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.price'),'',['class' => 'font-weight-bold']) }}
                {{ Form::number('price', $room->price, ['class' => 'form-control','placeholder'=> trans('placeholder.price') ]) }}
                <span class="text-danger">{{ $errors->first('price')}}</span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.roomtype'),'',['class' => 'font-weight-bold']) }}
                {{Form::select('room_type_id',$roomtypes,$room->room_type_id,['class' => " form-control",'placeholder'=>trans('room.select-roomtype')])}}
                <span class="text-danger">{{ $errors->first('room_type_id')}}</span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.status'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('status', array('0' => trans('room.display'), '1' => trans('room.non-display')),$room->status,['class' => 'form-control'])}}
                <span class="text-danger">{{ $errors->first('status')}}</span>
              </div>
              
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.service'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('services[]', $services,$room->service,[
                'class' => 'form-control services','multiple'=>'multiple'])
              }}
              <span class="text-danger">{{ $errors->first('tags')}} </span>
            </div>

            <div class="col-md-6 mb-1">
               {{ Form::label(trans('room.location'),'',['class' => 'font-weight-bold']) }}
              {{ Form::select('location', array('1st floor' => trans('room.1st'), '2st floor' => trans('room.2st'),'3st floor'=>trans('room.3st')),$room->location,['class' => 'form-control','required'])}}
              <span class="text-danger">{{ $errors->first('location')}}</span>
            </div>
            <div class="col-md-4 mb-1">
              {{ Form::label(trans('room.adult'),'',['class' => 'font-weight-bold']) }}
              {{ Form::select('adult', array('1' => '1', '2' => '2','3' =>'3','4' =>'4','5' =>'5'),$room->adult,['class' => 'form-control','required'])}}
              <span class="text-danger">{{ $errors->first('adult')}}</span>
            </div>
            <div class="col-md-4 mb-1">
              {{ Form::label(trans('room.kid'),'',['class' => 'font-weight-bold']) }}
               {{ Form::select('kid', array('0' => '0', '1' => '1','2' =>'2'),$room->kid,['class' => 'form-control','required'])}}
              <span class="text-danger">{{ $errors->first('kid')}}</span>
            </div>
            <div class="col-md-4 mb-1">
              {{ Form::label(trans('room.acreage'),'',['class' => 'font-weight-bold']) }}
              {{ Form::number('acreage', $room->acreage, ['class' => 'form-control','placeholder'=> trans('placeholder.acreage') ]) }}
              <span class="text-danger">{{ $errors->first('acreage')}}</span>
            </div>
            <div class="col-md-12">
              {{ Form::label(trans('room.tag'),'',['class' => 'font-weight-bold']) }}
              {{ Form::select('tags[]', $tags,$room->tag,[
              'class' => 'form-control roles','multiple'=>'multiple','id'=>'roles'])
            }}
            <span class="text-danger">{{ $errors->first('tags')}} </span>
          </div>
          <div class="col-md-12 mb-1">
            {{ Form::label(trans('room.description'),'',['class' => 'font-weight-bold']) }}
            {{ Form::textarea('description', $room->description, ['class' => 'form-control','rows'=>'4','placeholder'=> trans('placeholder.description') ]) }}
            <span class="text-danger">{{ $errors->first('description')}} </span>
          </div>
        </div>

        <div class="col-md-5 row ml-1">
          <div class="row form-group">
            <div class="col-12">
              <label for="image" class=" form-control-label font-weight-bold">{{trans('room.image')}}<span class="text text-danger"></span></label><br/>
              <small class="text text-primary">{{trans('room.main-image')}}</small>
            </div>
            <div class="col-12">
              <img class="mt-2 mb-2 img-thumbnail" id="preview_avatar" src="{{ asset('administration/imageRooms').'/'.$room->thumbnail }}" alt="Photo avatar" style="height: 250px;" >
              <input type="file" id="image" name="image" class="form-control-file" value="{{old('image')}}">
              <span class="text-danger">{{ $errors->first('image')}} </span>
            </div>
          </div>
          <div class="row form-group">
            <div class="col-12">
              <label for="image" class=" form-control-label font-weight-bold">{{trans('room.imagedetail')}}<span class="text text-danger"></span></label><br/>
              <small class="text text-primary">{{trans('room.imagedetailroom')}}</small>
            </div>
            <div class="col-12">
              @foreach($images as $img)
              <img class="mb-1" id="preview_avatar" src="{{ asset('administration/profile_images').'/'.$img->image_name }}" class="img-responsive" alt="feature-img" style="width: 100px; height: 100px"/>              
              @endforeach
              <br>
              <a class="btn btn-outline-success btn-small" href="{{route('room.editImage',$room->id)}}"><i class="fa fa-picture-o" aria-hidden="true"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
<div class="card-footer">
  {{ Form::submit(trans('room.save'),['class' => 'btn btn-primary']) }}
  <a class="btn btn-outline-secondary" href="{{route('room.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
</div>
{{ Form::close() }} 
</div>
</div>
</div>
@endsection
@section('script')
@include('admin.shared.scrip')
@include('admin.shared.scriptLoadimage')
@include('admin.shared.notification')
@endsection
