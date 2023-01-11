@extends('admin.layouts.main')
@section('title',trans('cost.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('cost.detail')}} {{$cost->name}}</strong>
        </div>
        <div class="card-body">
          <p class="font-weight-bold">{{trans('cost.name')}}: {{$cost->name}}</p>
          <p class="font-weight-bold">{{trans('cost.price')}}: {{number_format($cost->price)}} VND</p>
          <p class="font-weight-bold">
            @if($cost->createByAdmin->name)
            {{trans('cost.createby')}} : {{$cost->createByAdmin->name}} {{trans('cost.time')}} :  
            {{date('H:i | d/m/Y',strtotime($cost->created_at))}}
            @endif
          </p>
          <p class="font-weight-bold">
            @if($cost->updateByAdmin->name)
            {{trans('cost.updateby')}} : {{$cost->updateByAdmin->name}} {{trans('cost.time')}} :
            {{date('H:i | d/m/Y',strtotime($cost->updated_at))}}
            @endif
          </p>
        </div>
        <div class="card-footer">
          <a class="btn btn-outline-secondary" href="{{route('cost.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
@endsection
