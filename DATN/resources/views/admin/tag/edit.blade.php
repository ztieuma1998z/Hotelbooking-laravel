@extends('admin.layouts.main')
@section('title',trans('tag.edit'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('tag.edit')}} {{$tag->tag_name}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => ['tag.update',$tag->id], 'method' => 'put','enctype '=>'multipart/form-data']) }}
          <input type="hidden" name="id" value="{{$tag->id}}" placeholder=""> 
          <div class="form-group row">
            <div class="col-md-12">
              {{ Form::label(trans('tag.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('tag_name', $tag->tag_name, ['class' => 'form-control','placeholder'=> trans('placeholder.name'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('tag_name')}}</span>
            </div>
          </div>
        </div>
        <div class="card-footer">
          {{ Form::submit(trans('tag.save'),['class' => 'btn btn-primary']) }}
          <a class="btn btn-outline-secondary" href="{{route('tag.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
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
