@extends('admin.layouts.main')
@section('title',trans('cost.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('cost.listing')}}</strong>
          @can('cost-create')
          <a class="btn btn-primary btn-sm" href="{{route('cost.create')}}"><i class="fa fa-plus"></i> {{trans('cost.addnew')}}</a>
          @endcan
        </div>
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-striped table-bordered">
            <thead>
              <tr>
                <th>{{trans('cost.stt')}}</th>
                <th>{{trans('cost.name')}}</th>
                <th>{{trans('cost.price')}}</th>
                <th>{{trans('cost.description')}}</th>
                <th>{{trans('cost.action')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($costs as $key => $data)
              <tr>
                <td>{{++$key}}</td>
                <td>{{$data->name}}</td>
                <td>{{number_format($data->price)}}</td>
                <td>{{  substr(strip_tags($data->description), 0, 20)."..." }}</td> 
                <td width="100" class="text-center">
                  @can('cost-show')
                  <a href="{{route('cost.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
                  @endcan
                  @can('cost-delete') 
                  <a type="button" class="fa fa-trash deletebutton btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" >
                  </a>
                  @endcan
                  @can('cost-edit')
                  <a href="{{route('cost.edit',$data->id)}}" class="ml-1"><i class="fa fa-pencil"></i></a>
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
{{Form::open(['route' => ['cost_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
@include('admin.shared.notification')
@include('admin.shared.notification')
@endsection
