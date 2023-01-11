@extends('admin.layouts.main')
@section('title',trans('roomtype.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{ trans('roomtype.listing') }}</strong>
          @can('roomtype-create')
          <a class="btn btn-primary btn-sm ml-2" href="{{route('roomtype.create')}}"><i class="fa fa-plus"></i> {{ trans('roomtype.addnew') }}</a>
          @endcan
        </div>
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>{{ trans('roomtype.stt') }}</th>
                <th>{{ trans('roomtype.name') }}</th>
                <th>{{ trans('roomtype.star') }}</th>
                <th>{{ trans('roomtype.description') }}</th>
                <th>{{ trans('roomtype.action') }}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($roomtypes as $key => $data)
              <tr>
                <td>{{++$key}}</td>
                <td>{{$data->name}}</td>
                <td>{{$data->star}}</td>
                <td>{{  substr(strip_tags($data->description), 0, 20)."..." }}</td> 
                <td width="100" class="text-center">
                  @can('roomtype-show')
                  <a href="{{route('roomtype.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
                  @endcan
                  @can('roomtype-delete')
                  <a type="button" class="fa fa-trash deletebutton btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" >
                  </a>
                  @endcan
                  @can('roomtype-edit')
                  <a href="{{route('roomtype.edit',$data->id)}}" class="ml-1"><i class="fa fa-pencil"></i></a> 
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
{{Form::open(['route' => ['roomtype_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
@include('admin.shared.scriptModalDialog')
@include('admin.shared.notification')
@endsection
