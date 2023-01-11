@extends('admin.layouts.main')
@section('title',trans('cico.listing'))
@section('content')
<div class="animated fadeIn">
	<div class="row">
		@if($result == '0')
			<div class="col-md-6">
				<video id="preview"  class="img-thumbnail"></video>
			{{ Form::open(['route' => 'test.qr', 'method' => 'post','enctype '=>'multipart/form-data']) }}
			<div class="input-group ">
				<input class="form-control" type="text" id="search_result" name="id" value="">
				{{ Form::submit(trans('cico.Search'),['class' => 'btn btn-primary saveabout border-left-primary']) }}
			</div>
			{{ Form::close() }} 
			</div>
		@endif
		<div class="col-md-4">
			@if($result)
			<div class="card">
				<div class="card-header">
					<strong class="card-title mb-3">{{trans('cico.useraccount')}}</strong>
				</div>
				<div class="card-body">
					<div class="mx-auto d-block">
						<img class="rounded-circle mx-auto d-block"  width="200px" height="200px" src="@if ($result->users->image == null)   
                                                client/images/user_default.png
                                                @else
                                                administration/imageRooms/{{$result->users->image}}
                                                @endif " alt="Card image cap">
						<h5 class="text-sm-center mt-2 mb-1">{{$result->users->first_name}}{{$result->users->last_name}}
						</h5>
						<div class="location text-sm-center"><i class="fa fa-map-marker"></i> {{$result->users->street}}, {{$result->users->state}} {{$result->users->city}} {{$result->users->nationality}} </div>
					</div>
					<hr>
					<div class="card-text row">
						<div class="col-md-6">
						<p>{{trans('cico.gender')}}: 
							{{($result->users->gender == 0) ? trans('cico.Male') : trans('cico.Female')}}
						</p>
						<p>{{trans('cico.Phone')}}: {{$result->users->phone}}</p>
					</div>
					<div class="col-md-6">
						<p>{{trans('cico.dateofbirth')}}: {{date('d/m/Y',strtotime($result->users->dateofbirth))}}</p>
					</div>
					</div>
				</div>
			</div>
			@endif
		</div>
		@if($result)
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">
					<strong class="card-title">{{trans('cico.cico')}}</strong>
				</div>
				<div class="card-body row">
					<div class="col-md-6">
						<p>{{trans('cico.fullname')}}: {{$result->fullname}}</p>
						<p>{{trans('cico.booking-code')}}: {{$result->booking_code}}</p>
						<p>{{trans('cico.adult')}}: {{$result->adult}} {{trans('allclient.people')}}</p>
						<p>{{trans('cico.kid')}}: {{$result->kid}} {{trans('allclient.kid')}}</p>
						<p>{{trans('cico.total-amount')}}: {{number_format($result->total_amount)}} VND</p>
						<p>{{trans('cico.payment')}}: @if($result->payment == 0)
			                {{trans('cico.payoffline')}}
			                @elseif($result->payment == 1)
			                {{trans('cico.payonline')}}
			                @endif
			            </p>
					</div>
					<div class="col-md-6">
						<p>{{trans('cico.email')}}: {{$result->email}}</p>
						<p>{{trans('cico.Phone')}}: {{$result->phone}}</p>
						<p>{{trans('cico.transaction-date')}}: 
						{{date('H:i | d/m/Y',strtotime($result->transaction_date))}}</p>
						<p>{{trans('cico.ci')}}: {{date('H:i | d/m/Y',strtotime($result->check_in_date))}}</p>
						<p>{{trans('cico.co')}}: {{date('H:i | d/m/Y',strtotime($result->check_out_date))}}</p>
						
					</div>
					<div class="col-md-12">
						<p>{{trans('cico.note')}}: {{$result->message}}</p>
					</div>
					<div class="col-md-12">
						<p>{{trans('cico.status')}}:</p>
					{{ Form::open(['route' => ['checkin.update',$result->id], 'method' => 'put','enctype '=>'multipart/form-data']) }}
						{{ Form::select('status',array(
				           '0' => trans('cico.unconfirm'),
				           '1' => trans('cico.cofirmed'),
				           '2' => trans('cico.check-in'),
				           '3' => trans('cico.check-out'),
				           ),$result->status,['class'=>'form-control col-md-4 ']) }}
				            {{ Form::submit(trans('cico.update'),['class' => 'btn btn-outline-primary btn-sm mt-2']) }}
						{{ Form::close() }} 
					</div>
						
				</div>
			</div>
		</div>
		<div class="card col-md-12">
				<div class="card-header">{{trans('cico.room')}}</div>
				<div class="card-body">
					<table class="table  table-hover table-bordered">
						<thead>
							<tr>
								<th>{{trans('cico.stt')}}</th>
								<th>{{trans('cico.roomcode')}}</th>
								<th>{{trans('cico.nameroom')}}</th>
								<th>{{trans('cico.location')}}</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($result->rooms as $key => $data)
							<tr>
								<td>{{++$key}}</td>
								<td>{{$data->room_code}}</td>
								<td>{{$data->name}}</td>
								<td>{{$data->location}}</td>
							</tr>
							@endforeach
						</tbody>
					</table>
				</div>
			</div>
		@endif
	</div>
</div>
@endsection
@section('script')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript">
	var age = document.getElementById("search_result").value;
	let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
	scanner.addListener('scan', function (code) {
		document.getElementById("search_result").value = code;
		console.log(code);
		
		$("#search_result").fadeIn();
		$("#search_result").html(code);
	});
	Instascan.Camera.getCameras().then(function (cameras) {
		if (cameras.length > 0) {
			scanner.start(cameras[0]);
		} else {
			console.error('No cameras found.');
		}
	}).catch(function (e) {
		console.error(e);
	});
</script>
@include('admin.shared.notification')
@endsection
