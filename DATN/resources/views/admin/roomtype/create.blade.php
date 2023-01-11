@extends('admin.layouts.main')
@section('title',trans('roomtype.create'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card show">
        <div class="card-header">
          <strong class="card-title">{{ trans('roomtype.create') }}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => 'roomtype.store', 'method' => 'post','enctype '=>'multipart/form-data']) }} 
          <div class="form-group row">
            <div class="col-md-6  mt-2">
              {{ Form::label(trans('roomtype.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('name', null, ['class' => 'form-control','placeholder'=> trans('placeholder.name'), 'required' ]) }}
              <span class="text-danger">{{ $errors->first('name')}}</span>
            </div>
            <div class="col-md-6  mt-2">
              {{ Form::label(trans('roomtype.star'),'',['class' => 'font-weight-bold']) }}
              {{ Form::number('star', null, ['class' => 'form-control','placeholder'=> trans('placeholder.star'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('star')}}</span>
            </div>
            <div class="col-md-6 mt-2">
              {{ Form::label(trans('roomtype.description'),'',['class' => 'font-weight-bold']) }}
              {{ Form::textarea('description', null, ['class' => 'form-control' ,'placeholder'=> trans('placeholder.description'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('description')}} </span>
            </div>
            <div class="col-md-6 mt-2">
              <div class="row form-group">
                <div class="col-12">
                  <label for="image" class=" form-control-label font-weight-bold">{{trans('roomtype.image')}}</label>
                </div>
                <div class="col-12">
                  <img class="img-thumbnail" id="preview_avatar" src="administration/images/default_image.png" alt="Photo avatar"style="height: 250px">
                  <input class="mt-2" type="file" id="image" name="image" class="form-control-file" required value="{{old('image')}}">
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
