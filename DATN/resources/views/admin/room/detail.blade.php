@extends('admin.layouts.main')
@section('title',trans('room.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('room.detail')}} {{$room->name}}</strong>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-7">
              <div class="row">
                <div class="col-md-6">
                  <p class="font-weight-bold">{{trans('room.roomcode')}}: {{$room->room_code}}</p>
                  <p class="font-weight-bold">{{trans('room.price')}}: {{number_format($room->price)}} VND</p>
                  <p class="font-weight-bold">{{trans('room.adult')}}: {{$room->adult}} People</p>
                  <p class="font-weight-bold">{{trans('room.acreage')}}: {{$room->acreage}} (m2)</p>
                  <p class="font-weight-bold">{{trans('room.status')}}:
                    @if($room->status == '0')
                    {{trans('room.display')}}
                    @else
                    {{trans('room.non-display')}}
                    @endif
                  </p>
                  <p class="font-weight-bold">{{trans('room.tag')}}: 
                    @foreach($room->tag as $key => $data)
                    <small class="btn btn-sm btn-outline-secondary  mb-1">{{ $data->tag_name }}</small>
                    @endforeach
                  </p> 
                </div>
                <div class="col-md-6">
                  <p class="font-weight-bold">{{trans('room.name')}}: {{$room->name}}</p>
                  <p class="font-weight-bold">{{trans('room.location')}}: {{$room->location}}</p>
                  <p class="font-weight-bold">{{trans('room.kid')}}: {{$room->kid}} People</p>
                  <p class="font-weight-bold">{{trans('room.roomtype')}}: {{$room->roomtypes->name}}</p>
                  <p class="font-weight-bold">{{trans('room.service')}}: 
                    @foreach($room->service as $key => $data)
                    <small class="btn  btn-sm  mb-1 btn-outline-secondary">
                      {{ $data->name }} 
                    </small>
                    @endforeach
                  </p>
                </div>
              </div>
               <p class="font-weight-bold">
              @if($room->createByAdmin->name)
              {{trans('room.createby')}} : {{$room->createByAdmin->name}} {{trans('room.time')}} :  
              {{date('H:i | d/m/Y',strtotime($room->created_at))}}
              @endif
              <p class="font-weight-bold">
                @if($room->updateByAdmin->name)
                {{trans('room.updateby')}} : {{$room->updateByAdmin->name}} {{trans('room.time')}} :
                {{date('H:i | d/m/Y',strtotime($room->updated_at))}}
                @endif
              </p>
              @if($room->views)
                <p class="font-weight-bold">{{trans('room.view')}}: {{$room->views}}</p>
              @endif
                <p class="font-weight-bold">{{trans('room.description')}}: {{$room->description}}</p>
            </div>
            <div class="col-md-5">
              <div class="col-12">
                <label for="image" class=" form-control-label font-weight-bold">{{trans('room.image')}}<span class="text text-danger"></span></label><br/>
                <small class="text text-primary">{{trans('room.main-image')}}</small>
              </div>
                <div class="col-12">
                  <img class="mt-3 img-thumbnail" id="preview_avatar" src="{{ asset('administration/imageRooms').'/'.$room->thumbnail }}" alt="Photo avatar" style="height: 250px;" >
                </div>
              <div class="col-12 mt-4">
              <label for="image" class=" form-control-label font-weight-bold">{{trans('room.imagedetail')}}<span class="text text-danger"></span></label><br/>
              <small class="text text-primary">{{trans('room.imagedetailroom')}}</small>
            </div>
                <div class="col-12 mt-3">
                  @foreach($images as $img)
                  <img src="{{ asset('administration/profile_images').'/'.$img->image_name }}" class="img-responsive mb-1" alt="feature-img" style="width: 100px; height: 100px"/>     
                  @endforeach  
                </div>
                
              </div>
            </div>
          </div>
          <div class="card-footer">
            <a class="btn btn-outline-secondary" href="{{route('room.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  @endsection
