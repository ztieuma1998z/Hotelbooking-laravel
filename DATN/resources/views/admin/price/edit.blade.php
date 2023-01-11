@extends('admin.layouts.main')
@section('title',trans('price.edit'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{ trans('price.edit') }} {{$price->date}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => ['price.update',$price->id], 'method' => 'put','enctype '=>'multipart/form-data']) }}
          <input type="hidden" name="id" value="{{$price->id}}" placeholder=""> 
          <div class="form-group row">
            <div class="col-md-6">
              {{ Form::label(trans('price.date'),'',['class' => 'font-weight-bold']) }}
              {{ Form::date('date', $price->date, ['class' => 'form-control','required'  ]) }}
              <span class="text-danger">{{ $errors->first('date')}}</span>
            </div>
            <div class="col-md-6">
              {{ Form::label(trans('price.percent'),'',['class' => 'font-weight-bold']) }}
              {{ Form::number('percent',$price->percent, ['class' => 'form-control','placeholder'=> trans('placeholder.percent'),'required'  ]) }}
              <span class="text-danger">{{ $errors->first('percent')}}</span>
            </div>
            <div class="col-md-12">
              {{ Form::label(trans('room.description'),'',['class' => 'font-weight-bold']) }}
                {{ Form::text('description', $price->description, ['class' => 'form-control','placeholder'=> trans('placeholder.description'),'required' ]) }}
            </div>
          </div>
          
        </div>
        <div class="card-footer">
          {{ Form::submit(trans('price.save'),['class' => 'btn btn-primary']) }}
          <a class="btn btn-outline-secondary" href="{{route('price.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
        {{ Form::close() }} 
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
