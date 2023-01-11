@extends('admin.layouts.main')
@section('title',trans('roomtype.edit'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{ trans('roomtype.edit') }} {{$roomtype->name}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => ['roomtype.update',$roomtype->id], 'method' => 'put','enctype '=>'multipart/form-data']) }}
          <input type="hidden" name="id" value="{{$roomtype->id}}" placeholder=""> 
          <div class="form-group row">
            <div class="col-md-6">
              {{ Form::label(trans('roomtype.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('name', $roomtype->name, ['class' => 'form-control','placeholder'=> trans('placeholder.name'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('name')}}</span>
            </div>
            <div class="col-md-6">
              {{ Form::label(trans('roomtype.star'),'',['class' => 'font-weight-bold']) }}
              {{ Form::number('star',$roomtype->star, ['class' => 'form-control','placeholder'=> trans('placeholder.star'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('star')}}</span>
            </div>
            <div class="col-md-6 mt-2">
              {{ Form::label(trans('roomtype.description'),'',['class' => 'font-weight-bold']) }}
              {{ Form::textarea('description',$roomtype->description, ['class' => 'form-control','placeholder'=> trans('placeholder.description'),'required'  ]) }}
              <span class="text-danger">{{ $errors->first('description')}} </span>
            </div>
            <div class="col-md-6 mt-2">
            <div class="row form-group">
              <div class="col-12">
                <label for="image" class=" form-control-label font-weight-bold">{{trans('roomtype.image')}}</label>
              </div>
              <div class="col-12">
                <img class="img-thumbnail" id="preview_avatar" src="{{ asset('administration/imageRoomtypes').'/'.$roomtype->image }}" style="height: 250px" alt="Photo avatar" >
                <input class="mt-2" type="file" id="image" name="image" class="form-control-file" value="{{old('image')}}">
                <span class="text-danger">{{ $errors->first('image')}} </span>
              </div>
            </div>
          </div>
          </div>
          
        </div>
        <div class="card-footer">
          {{ Form::submit(trans('roomtype.save'),['class' => 'btn btn-primary']) }}
          <a class="btn btn-outline-secondary" href="{{route('roomtype.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
        {{ Form::close() }} 
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
@include('admin.shared.scriptLoadimage')
@include('admin.shared.notification')
@endsection
