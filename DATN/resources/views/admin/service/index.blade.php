@extends('admin.layouts.main')
@section('title',trans('service.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{ trans('service.listing') }}</strong>
          @can('service-create')
          <a class="btn btn-primary btn-sm" href="{{route('service.create')}}"><i class="fa fa-plus"></i> {{ trans('service.addnew') }}</a>
          @endcan
        </div>
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
              <th>{{ trans('service.stt') }}</th>
              <th>{{ trans('service.name') }}</th>
              <th>{{ trans('service.description') }}</th>
              <th>{{ trans('service.action') }}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($services as $key => $data)
              <tr>
                <td>{{++$key}}</td>
              <td>{{$data->name}}</td>
              <td>{{  substr(strip_tags($data->description), 0, 50)."..." }}</td> 
                <td width="100" class="text-center">
                  @can('roomtype-show')
                  <a href="{{route('service.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
                  @endcan
                  @can('roomtype-delete') 
                  <a type="button" class="fa fa-trash deletebutton btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" >
                  </a>
                  @endcan
                  @can('roomtype-edit')
                  <a href="{{route('service.edit',$data->id)}}" class="ml-1"><i class="fa fa-pencil"></i></a>
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
{{Form::open(['route' => ['service_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
