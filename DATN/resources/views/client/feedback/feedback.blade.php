@extends('client.layouts.main')
@section('title',trans('allclient.feedback'))
@section('content')
<section class="page-cover" id="cover-hotel-grid-list">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 class="page-title">{{trans('allclient.feedback')}}</h1>
				<ul class="breadcrumb">
					<li><a href="{{route('home.client')}}">{{trans('allclient.home')}}</a></li>
					<li class="active">{{trans('allclient.send_feedback')}}</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<section id="latest-blog" class="section-padding" style="padding-top: 50px;">
    <div class="container">
        <div class="row">
		<div class="col-md-9 row">
			{!! Form::open(['route' => 'feedback.store', 'method' => 'post']) !!}
			<div class="form-group col-md-6">
				<label>{{trans('feedback.name')}}:</label>
				{{Form::text('name', '',['class' => 'form-control','placeholder'=>trans('allclient.enter_name')])}}
				<span class="text-danger">{{ $errors->first('name')}}</span>
			</div>
			<div class="form-group col-md-6">
				<label>{{trans('feedback.email')}}:</label>
				{{Form::email('email', '',['class' => 'form-control','placeholder'=>trans('allclient.enter_email')])}}
				<span class="text-danger">{{ $errors->first('email')}}</span>
			</div>
			<div class="form-group col-md-12">
				<label>{{trans('feedback.title')}}:</label>
				{{Form::text('title', '',['class' => 'form-control','placeholder'=>trans('allclient.enter_title')])}}
				<span class="text-danger">{{ $errors->first('title')}}</span>
			</div>
			<div class="form-group col-md-12">
				<label>{{trans('feedback.content')}}:</label>
				{{Form::textarea('content', '',['class' => 'form-control','placeholder'=>trans('allclient.enter_content')])}}
				<span class="text-danger">{{ $errors->first('content')}}</span>
			</div>
			<div class="form-group">
				{{ Form::submit(trans('feedback.save'),['class'=>'btn btn-warning']) }}
			</div>
			{!! Form::close() !!}
		</div>
		<div class="col-md-2">
				<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FElaHotelk16%2F&tabs=timeline&width=340&height=500&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>
		</div>
	</div>
    </div>
</section>
@endsection
@section('script1')
<script>
	$(document).ready(function(){
		$('.home-status').removeClass('active');
		$('.contact-status').addClass('active');
	});
</script>
@endsection
