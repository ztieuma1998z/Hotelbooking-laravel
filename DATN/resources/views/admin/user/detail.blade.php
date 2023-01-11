@extends('admin.layouts.main')
@section('title',trans('user.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">

    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('user.detail')}} {{$user->username}}</strong>
        </div>
        <div class="card-body row">
          <div class="col-md-7">
            <ul class="list-group">
              <li class="list-group-item">{{trans('user.name')}}: {{$user->first_name}} {{$user->last_name}}</li>
              <li class="list-group-item">{{trans('user.useraccout')}}: {{$user->username}}</li>
              <li class="list-group-item">{{trans('user.Gender')}}: 
               @if($user->gender == '0')
               {{trans('user.Male')}}
               @else
               {{trans('user.Female')}}
             @endif</li>
             <li class="list-group-item">{{trans('user.Email')}}: {{$user->email}}</li>
             <li class="list-group-item">{{trans('user.Street')}}: {{$user->street}}</li>
             <li class="list-group-item">{{trans('user.State')}}: {{$user->state}}</li>
             <li class="list-group-item">{{trans('user.City')}}: {{$user->city}}</li>
             <li class="list-group-item">{{trans('user.Phone')}}: {{$user->phone}}</li>
             <li class="list-group-item">{{trans('user.Nationality')}}: {{$user->nationality}}</li>
             <li class="list-group-item">{{trans('user.Dateofbirth')}}: {{date('d/m/Y',strtotime($user->dateofbirth))}}</li>
             <li class="list-group-item">{{trans('user.Status')}}:
              @if($user->status == '0')
              {{trans('user.Active')}}
              @else
              {{trans('user.Paused')}}
            @endif</li>
            <li class="list-group-item">@if($user->google_id)
              {{trans('user.google')}}
            @endif</li>
          </ul>
        </div>

        <div class="col-md-5">
          <img class="img-thumbnail" id="preview_avatar" src="@if ($user->image == null)   
          client/images/user_default.png
          @else
          {{ asset('administration/imageRooms').'/'.$user->image }}
          @endif" alt="Photo avatar" >
        </div>
      </div>
      <div class="card-footer">
        <a class="btn btn-outline-secondary" href="{{route('user.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        
      </div>	
    </div>
  </div>
</div>
@if($booking->isEmpty())
<hr>
<p class="text-center text text-info">{{trans('user.qaz')}}</p>
@else
<div class="card">
  
  <div class="card-header">
    <strong class="card-title">{{trans('allclient.history')}}</strong>
  </div>
  <div class="card-body">
    <table id="bootstrap-data-table" class="table table-striped table-bordered">
      <thead>
        <tr>
          <th>{{ trans('booking.stt') }}</th>
          <th>{{ trans('booking.booking-code') }}</th>
          <th>{{ trans('booking.transaction-date') }}</th>
          <th>{{ trans('booking.status') }}</th>
          <th>{{ trans('booking.total-amount') }}</th>
          <th>{{ trans('roomtype.action') }}</th>
        </tr>
      </thead>
      <tbody>
        @foreach($booking as $key => $data)
        <tr>
          <td>{{++$key}}</td>
          <td><a href="{{route('booking.show',$data->id)}}">{{$data->booking_code}}</a></td>
          <td>{{date('H:i | d/m/Y',strtotime($data->transaction_date))}} </td>
          <td>
            @if($data->status == '0')
            <span class="badge badge-danger">{{trans('booking.unconfirm')}}</span>
            @elseif($data->status == '1')
            <span class="badge badge-success">{{trans('booking.cofirmed')}}</span>
            @elseif($data->status == '2')
            <span class="badge badge-primary">{{trans('booking.check-in')}}</span>
            @else
            <span class="badge badge-info">{{trans('booking.check-out')}}</span>
            @endif
          </td>
          <td>{{number_format($data->total_amount)}}</td>
          <td width="100" class="text-center">
            @can('booking-edit')
            <a href="{{route('booking.show',$data->id)}}"><i class="fa fa-tripadvisor"></i></a>
            @endcan()
          </td>
        </tr>
        @endforeach
      </tbody>
    </table>
  </div>
  <div class="card-footer">
    <a class="btn btn-outline-secondary" href="{{route('user.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
    
  </div>
  @endif
</div>
</div>
@endsection
@section('script')
@endsection
