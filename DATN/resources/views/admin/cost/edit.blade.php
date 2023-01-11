@extends('admin.layouts.main')
@section('title',trans('cost.edit'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('cost.edit')}} {{$cost->name}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => ['cost.update',$cost->id], 'method' => 'put']) }}
          <input type="hidden" name="id" value="{{$cost->id}}" placeholder=""> 
          <div class="form-group row">
            <div class="col-md-6">
              {{ Form::label(trans('cost.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('name', $cost->name, ['class' => 'form-control','placeholder'=> trans('placeholder.name') ]) }}
              <span class="text-danger">{{ $errors->first('name')}}</span>
            </div>
            <div class="col-md-6">
              {{ Form::label(trans('cost.price'),'',['class' => 'font-weight-bold']) }}
              {{ Form::number('price',$cost->price, ['class' => 'form-control','placeholder'=> trans('placeholder.price') ]) }}
              <span class="text-danger">{{ $errors->first('price')}}</span>
            </div>
            <div class="col-md-12">
              {{ Form::label(trans('cost.description'),'',['class' => 'font-weight-bold']) }}
              {{ Form::textarea('description',$cost->description, ['class' => 'form-control','placeholder'=> trans('placeholder.description'),'rows'=>'4'  ]) }}
              <span class="text-danger">{{ $errors->first('description')}} </span>
            </div>
          </div>
        </div>
        <div class="card-footer">
          {{ Form::submit(trans('cost.save'),['class' => 'btn btn-primary']) }}
          <a class="btn btn-outline-secondary" href="{{route('cost.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  @include('admin.shared.notification')
  @endsection
