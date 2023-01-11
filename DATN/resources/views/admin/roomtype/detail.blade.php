@extends('admin.layouts.main')
@section('title',trans('roomtype.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('roomtype.detail')}} {{$roomtype->name}}</strong>
        </div>
        <div class="card-body row">
          <div class="col-md-7">
            <p class="font-weight-bold">{{trans('roomtype.name')}} : {{$roomtype->name}}</p>
            <p class="font-weight-bold">{{trans('roomtype.star')}} : {{$roomtype->star}} <i class="fa fa-star-o" aria-hidden="true"></i></p>
            <p class="font-weight-bold">
              @if($roomtype->createByAdmin->name)
              {{trans('roomtype.createby')}} : {{$roomtype->createByAdmin->name}} {{trans('roomtype.time')}} :  
              {{date('H:i | d/m/Y',strtotime($roomtype->created_at))}}
              @endif
              <p class="font-weight-bold">
                @if($roomtype->updateByAdmin->name)
                {{trans('roomtype.updateby')}} : {{$roomtype->updateByAdmin->name}} {{trans('roomtype.time')}} :
                {{date('H:i | d/m/Y',strtotime($roomtype->updated_at))}}
                @endif
              </p>
              <p class="font-weight-bold">{{trans('roomtype.description')}} : {{$roomtype->description}}</p>
          </div>
          <div class="col-md-5">
              <p class="font-weight-bold">{{trans('roomtype.image')}} :</p>
              <img class="img-thumbnail" id="preview_avatar" src="{{ asset('administration/imageRoomtypes').'/'.$roomtype->image }}" alt="Photo avatar" style="height: 250px">
          </div>
        </div>
          
        <div class="card-footer">
          <a class="btn btn-outline-secondary" href="{{route('roomtype.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
