@extends('admin.layouts.main')
@section('title',trans('price.listing'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{ trans('price.listing') }}</strong>
          @can('price-create')
          <a class="btn btn-primary btn-sm ml-2" href="{{route('price.create')}}"><i class="fa fa-plus"></i> {{ trans('price.addnew') }}</a>
          @endcan
        </div>
        <div class="card-body">
          <table id="bootstrap-data-table" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>{{ trans('price.stt') }}</th>
                <th>{{ trans('price.date') }}</th>
                <th>{{ trans('price.percent') }}</th>
                <th>{{ trans('roomtype.action') }}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($price as $key => $data)
              <tr>
                <td>{{++$key}}</td>
                <td>{{date('d-m-Y',strtotime($data->date))}}</td>
                <td>{{$data->percent}}%</td>
                <td width="100" class="text-center">
                  @can('price-show')
                  <a href="{{route('price.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
                  @endcan
                  @can('price-delete')
                  <a type="button" class="fa fa-trash deletebutton btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" ></a>
                  @endcan
                  @can('price-edit')
                  <a href="{{route('price.edit',$data->id)}}" class="ml-1"><i class="fa fa-pencil"></i></a> 
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
{{Form::open(['route' => ['price_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
