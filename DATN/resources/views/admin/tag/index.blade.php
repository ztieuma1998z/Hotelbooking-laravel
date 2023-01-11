@extends('admin.layouts.main')
@section('title',trans('tag.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">

        <div class="card-header">
          <strong class="card-title">{{ trans('tag.listing') }}</strong>
          @can('tag-create')
          <a class="btn btn-primary btn-sm" href="{{route('tag.create')}}"><i class="fa fa-plus"></i> {{ trans('tag.addnew') }} </a>
          @endcan
        </div>
        
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-hover table-bordered table-striped">
            <thead>
              <tr>
                <th>{{ trans('tag.stt') }}</th>
                <th>{{ trans('tag.name') }}</th>
                <th>{{ trans('tag.action') }}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($tags as $key => $data)
              <tr>
                <td>{{++$key}}</td>
                <td>{{$data->tag_name}}</td>
                <td width="100" class="text-center">
                  @can('tag-show')
                  <a href="{{route('tag.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
                  @endcan
                  @can('tag-delete')
                  <a type="button" class="fa fa-trash deletebutton btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" ></a>
                  @endcan
                  @can('tag-edit')
                  <a href="{{route('tag.edit',$data->id)}}" class="ml-1"><i class="fa fa-pencil"></i></a> 
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
{{Form::open(['route' => ['tag_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
@include('admin.shared.scriptModalDialog')
@include('admin.shared.notification')
@endsection
