@extends('admin.layouts.main')
@section('title',trans('room.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('room.listing')}}</strong>
          @can('room-create')
          <a class="btn btn-primary btn-sm" href="{{route('room.create')}}"><i class="fa fa-plus"></i> {{trans('room.addnew')}}</a>
          @endcan
          @can('room-export')
          <a  class="btn btn-outline-success btn-sm" href="{{route('room.export')}}"><i class="fa fa-file-excel-o" aria-hidden="true"></i></a>
          @endcan
        </div>
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-hover table-bordered">
            <thead>
              <tr>
                <th>{{trans('room.stt')}}</th>
                <th>{{trans('room.roomcode')}}</th>
                <th>{{trans('room.name')}}</th>
                <th>{{trans('room.price')}}</th>
                <th>{{trans('room.roomtype')}}</th>
                <th>{{trans('room.location')}}</th>
                <th>{{trans('room.status')}}</th>
                <th>{{trans('room.action')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($rooms as $key => $data)
              <tr>
                <td>{{++$key}}</td>
                <td>{{$data->room_code}}</td>
                <td>{{$data->name}}</td>
                <td>{{number_format($data->price)}}</td>
                <td>{{$data->roomtypes->name}}</td>
                <td>{{$data->location}}</td>
                <td>
                  @if($data->status == '0')
                    <span class="badge badge-success"> {{trans('room.display')}}</span>
                  @else
                    <span class="badge badge-danger"> {{trans('room.non-display')}}</span>
                  @endif  
                </td>
                <td width="100px" class="text-center">
                  @can('room-show')
                  <a href="{{route('room.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
                  @endcan
                  @can('room-delete') 
                  <a type="button" class="fa fa-trash deletebutton btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" ></a>
                  @endcan
                  @can('room-edit')
                  <a href="{{route('room.edit',$data->id)}}" class="ml-1"><i class="fa fa-pencil"></i></a>
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
{{Form::open(['route' => ['room_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
