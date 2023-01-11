@extends('admin.layouts.main')
@section('title',trans('tag.create'))
@section('content')

<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card show">
        <div class="card-header">
          <strong class="card-title">{{trans('tag.create')}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => 'tag.store', 'method' => 'post','enctype '=>'multipart/form-data']) }} 
          <div class="form-group row">
            <div class="col-md-12">
              {{ Form::label(trans('tag.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('tag_name', null, ['class' => 'form-control','placeholder'=> trans('placeholder.name'),'required' ]) }}
              <span class="text-danger">{{ $errors->first('tag_name')}}</span>
            </div>
          </div>
        </div>
        <div class="card-footer">
         {{ Form::submit(trans('tag.save'),['class' => 'btn btn-primary']) }}
         <a class="btn btn-outline-secondary border-left-primary" href="{{route('tag.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
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
