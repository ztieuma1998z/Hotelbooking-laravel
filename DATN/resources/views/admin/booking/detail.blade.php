@extends('admin.layouts.main')
@section('title',trans('booking.detail'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title">{{trans('booking.detail')}} {{$booking->booking_code}}</strong>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <ul class="list-group">
              <li class="list-group-item">{{trans('booking.booking-code')}}: {{$booking->booking_code}}</li>
              <li class="list-group-item">{{trans('booking.user-id')}}: {{$booking->users->username}}</li>
              <li class="list-group-item">{{trans('booking.fullname')}}: {{$booking->fullname}}</li>
              <li class="list-group-item">{{trans('booking.phone')}}: {{$booking->phone}}</li>
              <li class="list-group-item">{{trans('booking.email')}}: {{$booking->email}}</li>
              <li class="list-group-item">{{trans('booking.transaction-date')}}: {{date('H:i | d/m/Y',strtotime($booking->transaction_date))}}</li>
              </ul>
            </div>
            <div class="col-md-6">
              <ul class="list-group">
              <li class="list-group-item">{{trans('booking.checkin-date')}}: {{date('H:i | d/m/Y',strtotime($booking->check_in_date))}}</li>
              <li class="list-group-item">{{trans('booking.checkout-date')}}: {{date('H:i | d/m/Y',strtotime($booking->check_out_date))}}</li>
              <li class="list-group-item">{{trans('booking.adult')}}: {{$booking->adult}} people</li>
              <li class="list-group-item">{{trans('booking.kid')}}: {{$booking->kid}} people</li>
              <li class="list-group-item">{{trans('booking.qaf')}}: 
                @if($booking->payment==1)
                  <span class="text text-success">{{trans('allclient.bf')}}</span>
                @elseif($booking->status==3 && $booking->payment==0)
                  <span class="text text-success">{{trans('allclient.bd')}}</span>
                @else
                  <span class="text text-warning">{{trans('allclient.unpaid')}}</span>
                @endif
              </li>
              <li class="list-group-item">{{trans('booking.total-amount')}} : <font color="red">{{number_format($booking->total_amount)}}</font> VND</li>
              </ul>
            </div>
          </div>
          <br>
          @if($booking->message)
          <p class="font-weight-bold">{{trans('booking.message')}} : {{$booking->message}}</p>
          @endif

          <p class="font-weight-bold">{{trans('booking.status')}}:
           {{Form::open(['route'=>['booking.update',$booking->id],'method'=>'put'])}}
           {{ Form::select('status',array(
           '0' => trans('booking.unconfirm'),
           '1' => trans('booking.cofirmed'),
           '2' => trans('booking.check-in'),
           '3' => trans('booking.check-out'),
           ),$booking->status,['class'=>'form-control col-md-4 ']) }}
           {{ Form::submit(trans('booking.update'),['class' => 'btn btn-outline-primary btn-sm mt-2']) }}
           {{ Form::close() }}
         </p>
         <hr>
         <h4 class="mb-3"><b>{{trans('booking.room')}}</b></h4>
           <table class="table table-hover table-bordered">
            <thead>
              <tr>
                <th class="text-center">{{trans('booking.stt')}}</th>
                <th class="text-center">{{trans('booking.nameroom')}}</th>
                <th class="text-center">{{trans('room.price')}}</th>
                <th class="text-center">{{trans('booking.location')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($booking->rooms as $key => $data)
              <tr>
                <td class="text-center">{{++$key}}</td>
                <td class="text-center"><a class="btn btn-info" href="{{route('room.show',$data->id)}}">{{$data->name}}</a></td>
                <td class="text-center">{{$data->price}}</td>
                <td class="text-center">{{$data->location}}</td>
              </tr>
              @endforeach
            </tbody>
          </table>
          <h4><b>{{trans('booking.qaz')}}</b></h4><br>
          <table class="table table-hover table-bordered">
            <thead>
              <tr>
                <th class="text-center">{{trans('allclient.bt')}}</th>
                <th class="text-center">{{trans('allclient.by')}}</th>
                <th class="text-center">{{trans('allclient.br')}}</th>
              </tr>
            </thead>
            <tbody>
              @foreach($cost as $value)
              <tr>
                <td class="text-center">{{ $value->cost->name }}</td>
                <td class="text-center">{{ $value->cost->description }}</td>
                <td class="text-center">{{number_format($value->cost->price)}} VND/{{trans('allclient.bh')}}/{{trans('allclient.bj')}} </td>
              </tr>
              @endforeach
            </tbody>
          </table>
          <h4 class="btn btn-block btn-info" onclick="show_price()" ><b>{{trans('booking.qax')}}</b></h4>
          <br>
          <div id="show_price" style="display: none;">
            <br>
            <i>{{ trans('booking.note') }}</i><br><hr>
          @foreach($detail_price as $key => $value)
          {!! ++$key.'. '. $value !!}
          @endforeach
          <hr>
          {{ $detail_price->appends(request()->except('page'))->links() }}
          <h5 class="text-right">{{trans('booking.total-amount')}} : <font color="red">{{number_format($booking->total_amount)}}</font> VND</h5>
          </div>
        </div>
       <div class="card-footer">
        <a class="btn btn-outline-secondary" href="{{route('booking.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
      </div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
  function show_price(){
    if(document.getElementById("show_price").style.display=='none'){
      document.getElementById("show_price").style.display = "block";
    }else{
      document.getElementById("show_price").style.display = "none";
    }
  }
    @if(request()->get('page'))
      document.getElementById("show_price").style.display = "block";
    @endif
</script>
@endsection
@section('script')
@include('admin.shared.notification')
@endsection
