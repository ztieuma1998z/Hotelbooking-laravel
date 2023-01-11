@extends('admin.layouts.main')
@section('title',trans('vote.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('vote.detail')}}</strong>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="font-weight-bold">{{trans('vote.star')}}</label><br>
                @for($i=1;$i<=$vote->star;$i++)
                <i class="fa fa-star text-warning" aria-hidden="true"></i>
                @endfor
                @for($i=1;$i<=5-$vote->star;$i++)
                <i class="fa fa-star-o text-warning" aria-hidden="true"></i>
                @endfor
              </div>

              <p class="font-weight-bold"><i> <a class="text-info" href="{{ route('booking.show',$vote->booking_id) }}"> {{trans('vote.seedetail')}}</a></i></p>
              <p class="font-weight-bold">{{trans('vote.fullname')}}: {{$vote->booking->fullname}} </p>
            </div>
            <div class="col-md-6">
              <label class="font-weight-bold">{{trans('vote.title')}}</label>
              <p>{{ $vote->title }}</p>
              <label class="font-weight-bold">{{trans('vote.content')}}</label>
              <p>{{ $vote->comment }}</p>
            </div>
          </div>
        </div>
        <div class="card-footer">
          <a class="btn btn-outline-secondary" href="{{route('vote.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection
@section('script')
@include('admin.shared.notification')
@endsection
