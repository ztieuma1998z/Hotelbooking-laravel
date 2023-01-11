@foreach($roomtype_name as $roomtype_name)
<div class="col-sm-6 col-md-6 col-lg-4">
	<div class="grid-block main-block h-grid-block">
		<div class="main-img h-grid-img">
			<a href="">
				<img src="{{ asset('administration/imageRoomtypes').'/'.$roomtype_name->image }}" class="img-responsive" alt="hotel-img" style="width: 264px; height: 190px;" />
			</a>
			<div class="main-mask">
				<ul class="list-unstyled list-inline offer-price-1">
					<li class="price">Star<span class="divider">|</span><span class="pkg">{{$roomtype_name->star}}</span></li>
				</ul>
			</div>
		</div>
		<div class="block-info h-grid-info">
			<h3 class="block-title"><a href="hotel-detail-left-sidebar.html">{{$roomtype_name->name}}</a></h3>
			<p class="block-minor"></p>
			<div class="grid-btn">
				<a href="{{route('roomtype.room',$roomtype_name->id)}}" class="btn btn-orange btn-block btn-lg">See details</a>
			</div>
		</div>
	</div>
</div>
@endforeach