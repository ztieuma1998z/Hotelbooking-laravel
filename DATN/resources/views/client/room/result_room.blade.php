@if(count($data) > 0)
@foreach($data as $value)
<div class="col-sm-6 col-md-6 col-lg-4">
	<div class="grid-block main-block h-grid-block">
		<div class="main-img h-grid-img">
			<a href="{{route('roomtype.room.detail',$value->id)}}">
				<img src="{{ asset('administration/imageRooms').'/'.$value->thumbnail }}" class="img-responsive" alt="hotel-img" style="width: 264px; height: 190px;" />
			</a>
			<div class="main-mask">
				<ul class="list-unstyled list-inline offer-price-1">
					<li class="price">{{trans('allclient.price')}}<span class="divider">|</span><span class="pkg">
					{{number_format($value->price)}} VND / {{trans('allclient.night')}}</span></li>
				</ul>
			</div>
		</div>
		<div class="block-info h-grid-info">
			<p>
				{{trans('allclient.adult')}}: {{$value->adult}} {{trans('allclient.people')}}
				<br>
				{{trans('allclient.children')}}: {{$value->kid}} {{trans('allclient.people')}}
			</p>
			<p>Room Type: {{$value->roomtypes->name}}</p>
			<div class="grid-btn">
				<a class="btn btn-block btn-orange" href="{{ url('addinvoice',$value->id) }}">{{trans('allclient.add_invoice')}}</a>
			</div>
		</div>
	</div>
</div>
@endforeach
@else 
No data
@endif