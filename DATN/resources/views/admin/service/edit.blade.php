@extends('admin.layouts.main')
@section('title',trans('service.edit'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('service.edit')}} {{$service->name}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => ['service.update',$service->id], 'method' => 'put','enctype '=>'multipart/form-data']) }}
          <input type="hidden" name="id" value="{{$service->id}}" placeholder=""> 
          <div class="form-group row">
            <div class="col-md-12">
              {{ Form::label(trans('service.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('name', $service->name, ['class' => 'form-control','placeholder'=> trans('placeholder.name'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('name')}}</span>
            </div>
            <div class="col-md-12 mt-2">
              {{ Form::label(trans('service.description'),'',['class' => 'font-weight-bold']) }}
              {{ Form::textarea('description',$service->description, ['class' => 'form-control','placeholder'=> trans('placeholder.description'),'rows'=>'4','required']) }}
              <span class="text-danger">{{ $errors->first('description')}} </span>
            </div>
          </div>
        </div>
        <div class="card-footer">
          {{ Form::submit(trans('service.save'),['class' => 'btn btn-primary']) }}
          <a class="btn btn-outline-secondary" href="{{route('service.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  @include('admin.shared.notification')
  @endsection
