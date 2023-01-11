@extends('admin.layouts.main')
@section('title',trans('cost.create'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card show">
        <div class="card-header">
          <strong class="card-title">{{trans('cost.create')}}</strong>
        </div>
        <div class="card-body">
          {{ Form::open(['route' => 'cost.store', 'method' => 'post']) }} 
          <div class="form-group row">
            <div class="col-md-6 mt-2">
              {{ Form::label(trans('cost.name'),'',['class' => 'font-weight-bold']) }}
              {{ Form::text('name', null, ['class' => 'form-control' ,'placeholder'=> trans('placeholder.name'),'required' ]) }}
               <span class="text-danger">{{ $errors->first('name')}}</span>
            </div>
            <div class="col-md-6 mt-2">
              {{ Form::label(trans('cost.price'),'',['class' => 'font-weight-bold']) }}
              {{ Form::number('price', null, ['class' => 'form-control' ,'placeholder'=> trans('placeholder.price'),'required' ]) }}
               <span class="text-danger">{{ $errors->first('price')}}</span>
            </div>
            <div class="col-md-12 mt-2">
              {{ Form::label(trans('cost.description'),'',['class' => 'font-weight-bold']) }}
              {{ Form::textarea('description', null, ['class' => 'form-control','placeholder'=> trans('placeholder.description'),'rows'=>'4' ,'required'  ]) }}
              <span class="text-danger">{{ $errors->first('description')}} </span>
            </div>
          </div>
        </div>
        <div class="card-footer">
         {{ Form::submit(trans('cost.save'),['class' => 'btn btn-primary']) }}
         <a class="btn btn-outline-secondary" href="{{route('cost.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
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
