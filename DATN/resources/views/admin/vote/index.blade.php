@extends('admin.layouts.main')
@section('title',trans('vote.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('vote.listing')}}</strong>
        </div>
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-hover table-bordered">
            <thead>
              <tr>
              <th class="text-center">{{trans('vote.stt')}}</th>
              <th class="text-center">{{trans('vote.fullname')}}</th>
              <th class="text-center">{{trans('vote.booking')}}</th>
              <th class="text-center">{{trans('vote.star')}}</th>
              <th class="text-center">{{trans('vote.title')}}</th>
              <th class="text-center">{{trans('vote.action')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($vote as $key => $data)
              <tr>
                <td class="text-center">{{++$key}}</td>
                <td class="text-center">{{$data->booking->fullname}}</td>
                <td class="text-center">{{$data->booking->booking_code}}</td>
                <td class="text-center">{{$data->star}}</td>
                <td>{{$data->title}}</td>
                <td class="text-center" width="100">
                  @can('vote-show')
                  <a href="{{route('vote.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a> 
                  @endcan
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
