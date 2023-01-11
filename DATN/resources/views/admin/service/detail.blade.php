@extends('admin.layouts.main')
@section('title',trans('service.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('service.detail')}} {{$service->name}}</strong>
        </div>
        <div class="card-body">
          <p class="font-weight-bold">{{trans('service.name')}} : {{$service->name}}</p>
          <p class="font-weight-bold">
            @if($service->createByAdmin->name)
            {{trans('service.createby')}} : {{$service->createByAdmin->name}} {{trans('service.time')}} :  
            {{date('H:i | d/m/Y',strtotime($service->created_at))}}
            @endif
            <p class="font-weight-bold">
              @if($service->updateByAdmin->name)
              {{trans('service.updateby')}} : {{$service->updateByAdmin->name}} {{trans('service.time')}} :
              {{date('H:i | d/m/Y',strtotime($service->updated_at))}}
              @endif
            </p>
            <p class="font-weight-bold">{{trans('service.description')}} : {{$service->description}}</p>
          </div>
          <div class="card-footer">
            <a class="btn btn-outline-secondary" href="{{route('service.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  @endsection
