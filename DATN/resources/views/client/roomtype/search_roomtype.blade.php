@extends('client.layouts.main')
@section('title',trans('allclient.kind'))
@section('content')
<section class="page-cover" id="cover-hotel-grid-list">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 class="page-title">{{trans('allclient.kind')}}</h1>
				<ul class="breadcrumb">
					<li><a href="{{route('home.client')}}">{{trans('allclient.home')}}</a></li>
					<li class="active">{{trans('allclient.kind')}}</li>
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
					@include('client.components.sort_roomtype')
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
						@include('client.roomtype.result_roomtype')
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
		$('.room-status').addClass('active');
	});
</script>
@endsection
