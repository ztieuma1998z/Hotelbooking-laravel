@extends('admin.layouts.main')
@section('title',trans('tag.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{ trans('tag.detail')}} {{$tag->tag_name}}</strong>
        </div>
        <div class="card-body">
          <p class="font-weight-bold">{{ trans('tag.name')}} : {{$tag->tag_name}}</p>
          <p class="font-weight-bold">
              @if($tag->createByAdmin->name)
              {{trans('tag.createby')}} : {{$tag->createByAdmin->name}} {{trans('tag.time')}} :  
              {{date('H-i | d/m/Y',strtotime($tag->created_at))}}
              @endif
              <p class="font-weight-bold">
                @if($tag->updateByAdmin->name)
                {{trans('tag.updateby')}} : {{$tag->updateByAdmin->name}} {{trans('tag.time')}} :
                {{date('H-i | d/m/Y',strtotime($tag->updated_at))}}
                @endif
              </p>
          </div>
          <div class="card-footer">
            <a class="btn btn-outline-secondary" href="{{route('tag.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  @include('admin.shared.notification')
  @endsection
