@extends('client.layouts.main')
@section('title',trans('allclient.room'))
@section('content')
<section class="page-cover" id="cover-hotel-grid-list">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 class="page-title">{{trans('allclient.room')}}</h1>
				<ul class="breadcrumb">
					<li><a href="{{route('home.client')}}">{{trans('allclient.home')}}</a></li>
					<li><a href="{{route('home.roomType')}}">{{trans('allclient.roomtype')}}</a></li>
					<li class="active">{{trans('allclient.room')}}</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<section class="innerpage-wrapper">
	<div id="hotel-grid" class="innerpage-section-padding">
		<div class="container">
			<div class="row">        	
				<div class="col-xs-12 col-sm-12 col-md-3 side-bar left-side-bar">
					@if(strpos(url()->current(), 'roomtype') !== false)
					@include('client.components.sort')
					@endif
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-12">    
							<div class="side-bar-block support-block">
								 @include('client.shared.all_contact')
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 content-side">
					<div class="row">
					@include('client.room.room')
					</div>
					<div class="row text-center">
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
@endsection
@section('script1')
<script>
	$(document).ready(function(){
		$('.home-status').removeClass('active');
    	$('.top-room-status').addClass('active');
	});
</script>
@endsection
