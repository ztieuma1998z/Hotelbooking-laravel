@extends('admin.layouts.main')
@section('title',trans('price.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('price.detail')}} {{$price->date}}</strong>
        </div>
        <div class="card-body">
          <p class="font-weight-bold">{{trans('price.date')}} : {{date('d-m-Y',strtotime($price->date))}}</p>
          <p class="font-weight-bold">{{trans('price.percent')}} : {{$price->percent}}%</p>
          <p class="font-weight-bold">{{trans('room.description')}} : {{$price->description}}</p>
             <p class="font-weight-bold">
              @if($price->createByAdmin->name)
              {{trans('price.createby')}} : {{$price->createByAdmin->name}} {{trans('price.time')}} :  
              {{date('H:i | d/m/Y',strtotime($price->created_at))}}
              @endif
              <p class="font-weight-bold">
                @if($price->updateByAdmin->name)
                {{trans('price.updateby')}} : {{$price->updateByAdmin->name}} {{trans('price.time')}} :
                {{date('H:i | d/m/Y',strtotime($price->updated_at))}}
                @endif
              </p>
          </div>
          <div class="card-footer">
            <a class="btn btn-outline-secondary" href="{{route('price.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  @include('admin.shared.notification')
  @endsection
