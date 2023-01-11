@if(count($data) > 0)
@foreach($data as $value)
<div class="col-sm-6 col-md-6 col-lg-4">
	<div class="grid-block main-block h-grid-block">
		<div class="main-img h-grid-img">
			<a href="{{route('roomtype.room',$value->id)}}">
				<img src="{{ asset('administration/imageRoomtypes').'/'.$value->image }}" class="img-responsive" alt="hotel-img" style="height: 190px;" />
			</a>
			<div class="main-mask">
				<ul class="list-unstyled list-inline offer-price-1">
					<li class="price">{{trans('allclient.star')}}<span class="divider">|</span><span class="pkg">{{$value->star}}</span></li>
				</ul>
			</div>
		</div>
		<div  style="min-height: 175px;" class="block-info h-grid-info">
			<h3 style="min-height: 55px;" class="block-title"><a href="hotel-detail-left-sidebar.html">{{$value->name}}</a></h3>
			<p class="block-minor"></p>
			<div class="grid-btn">
				<a href="{{route('roomtype.room',$value->id)}}" class="btn btn-orange btn-block btn-lg">{{trans('allclient.detail')}}</a>
			</div>
		</div>
	</div>
</div>
@endforeach
@else 
No data
@endif
