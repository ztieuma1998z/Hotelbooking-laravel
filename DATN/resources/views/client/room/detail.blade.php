@extends('client.layouts.main')
@section('title',$data->roomtypes->name )
@section('content')
@section('content')
<section class="page-cover" id="cover-hotel-grid-list">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h1 class="page-title">{{trans('allclient.room_infor')}}</h1>
        <ul class="breadcrumb">
          <li><a href="{{route('home.client')}}">{{trans('allclient.home')}}</a></li>
          <li class="active">{{trans('allclient.roomtype')}} {{ $data->roomtypes->name }}</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<section class="innerpage-wrapper">
  <div id="hotel-details" class="innerpage-section-padding">
    <div class="container">
      <div class="row">           
        <div class="col-xs-12 col-sm-12 col-md-3 side-bar left-side-bar">
          <div class="side-bar-block booking-form-block">
            <h2 class="selected-price">{{number_format($data->price)}} VND<br><span>1 {{trans('allclient.night')}}</span></h2>
            <div class="booking-form">
               <h3>{{trans('allclient.book_now')}}</h3>
                <p>{{trans('allclient.quick')}}</p>
              @if (session('success'))
              <div class="alert alert-success">
                {{session('success')}}
              </div>
              @endif
              @if (session('errorSQL'))
              <div class="alert alert-danger">
                {{session('errorSQL')}}
              </div>
              @endif
              @php
              if(Cookie::has('checkin') && Cookie::has('checkout')){
              $checkin = Cookie::get('checkin');
              $checkout = Cookie::get('checkout');
              }else{
              $checkin = date_format(\Carbon\Carbon::now(),"d/m/Y");
              $checkout = date_format(\Carbon\Carbon::tomorrow(),"d/m/Y");
              }
          if(Auth::check()){
          $fullname = Auth::user()->first_name.' '.Auth::user()->last_name;
          $email = Auth::user()->email;
          $phone = Auth::user()->phone;
        }else{
        $fullname = '';
        $email = '';
        $phone = '';
      }
      @endphp
      {!! Form::open(['url' => ['quick_checkout',$data->id], 'method' => 'POST']) !!}
      @csrf
      <div class="form-group">
        {{Form::text('checkin', $checkin,['class' => 'form-control dpd1', 'autocomplete' => 'off'])}}
        <span class="text-danger">{{ $errors->first('checkin')}}</span>                                   
      </div>

      <div class="form-group">
        {{Form::text('checkout', $checkout,['class' => 'form-control dpd2', 'autocomplete' => 'off'])}}
        <span class="text-danger">{{ $errors->first('checkout')}}</span>                          
      </div>

      <div class="form-group">
        {{Form::text('fullname', $fullname,['class' => 'form-control','placeholder' => trans('allclient.20qaz')])}}   
        <span class="text-danger">{{ $errors->first('fullname')}}</span>                                    
      </div>

      <div class="form-group">
        {{Form::email('email', $email,['class' => 'form-control','placeholder' => trans('allclient.21qaz')])}}  
        <span class="text-danger">{{ $errors->first('email')}}</span>                                     
      </div>

      <div class="form-group">
        {{Form::number('phone', $phone,['class' => 'form-control','placeholder' =>trans('allclient.22qaz')])}}
        <span class="text-danger">{{ $errors->first('phone')}}</span>                                      
      </div>

      <label>{{trans('allclient.service_arising')}}</label><br>
      <div class="form-check">
        @foreach($services as $service)
        <input class="form-check-input" type="checkbox" name="service[]" value="{{$service->id}}" id="defaultCheck1">
        <label class="form-check-label">{{ $service->name }} - {{number_format($service->price)}} VNĐ
        </label>
        <br>
        @endforeach
      </div>

      <div class="form-group">
        <label>{{trans('allclient.note')}}: </label>
        {{Form::textarea('message', '',['class' => 'form-control','placeholder' => trans('allclient.enter_note'),'rows'=>'1'])}}
        <span class="text-danger">{{ $errors->first('message')}}</span>
      </div>

      <div class="form-group right-icon">
        {{Form::select('payment', ['0' => trans('allclient.pay_hotel'), '1' => trans('allclient.pay_online')], null, ['class' => 'form-control', 'id' => 'payment'])}}
        <i class="fa fa-angle-down"></i>
      </div>
      <div class="payment" hidden>
            <div class="form-group">
              <label for="bank_code">{{trans('allclient.bank')}}</label>
              <select name="bank_code" id="bank_code" class="form-control">
                <option value="">{{trans('allclient.19qaz')}}</option>
                <option value="NCB"> Ngan hang NCB</option>
                <option value="AGRIBANK"> Ngan hang Agribank</option>
                <option value="SCB"> Ngan hang SCB</option>
                <option value="SACOMBANK">Ngan hang SacomBank</option>
                <option value="EXIMBANK"> Ngan hang EximBank</option>
                <option value="MSBANK"> Ngan hang MSBANK</option>
                <option value="NAMABANK"> Ngan hang NamABank</option>
                <option value="VNMART"> Vi dien tu VnMart</option>
                <option value="VIETINBANK">Ngan hang Vietinbank</option>
                <option value="VIETCOMBANK"> Ngan hang VCB</option>
                <option value="HDBANK">Ngan hang HDBank</option>
                <option value="DONGABANK"> Ngan hang Dong A</option>
                <option value="TPBANK"> Ngân hàng TPBank</option>
                <option value="OJB"> Ngân hàng OceanBank</option>
                <option value="BIDV"> Ngân hàng BIDV</option>
                <option value="TECHCOMBANK"> Ngân hàng Techcombank</option>
                <option value="VPBANK"> Ngan hang VPBank</option>
                <option value="MBBANK"> Ngan hang MBBank</option>
                <option value="ACB"> Ngan hang ACB</option>
                <option value="OCB"> Ngan hang OCB</option>
                <option value="IVB"> Ngan hang IVB</option>
                <option value="VISA"> Thanh toan qua VISA/MASTER</option>
              </select>
            </div>
            <div class="form-group">
              <label for="language">{{trans('allclient.language')}}</label>
              <select name="language" id="language" class="form-control">
                <option value="vn">Tiếng Việt</option>
                <option value="en">English</option>
              </select>
            </div>
            </div>
      <div class="checkbox custom-check">
        <input type="checkbox" id="check01" name="checkbox" required/>
        <label for="check01"><span><i class="fa fa-check"></i></span>{{trans('allclient.agree')}} <a href="{{route('term')}}">{{trans('allclient.term_policy')}}</a></label>
      </div>
      <button class="btn btn-block btn-orange  fl_right">{{trans('allclient.book_now')}}</button>
      <h4 class="text-center">{{trans('allclient.or')}}</h4>
      <a class="btn btn-block btn-orange" href="{{ url('addinvoice',$data->id) }}">{{trans('allclient.add_invoice')}}</a>
      
      {!! Form::close() !!}
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12 col-sm-6 col-md-12 mt-0">    
      <div class="side-bar-block support-block mt-0">
        @include('client.shared.all_contact')
      </div>
    </div>
  </div>
</div>
<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 content-side">
  <div class="detail-slider">
    <div class="feature-slider">
      <div><img src="{{ asset('administration/imageRooms').'/'.$data->thumbnail }}" class="img-responsive" alt="feature-img" style="width: 848px; height: 494px;"/></div>
      {{-- Lấy ra những ảnh của phòng thuộc khách sạn --}}
      @foreach($images as $img)
      <div><img src="{{ asset('administration/profile_images').'/'.$img->image_name }}" class="img-responsive" alt="feature-img" style="width: 848px; height: 494px;"/></div>
      @endforeach

    </div><!-- end feature-slider -->
    
    <div class="feature-slider-nav">
      <div><img src="{{ asset('administration/imageRooms').'/'.$data->thumbnail }}" class="img-responsive" alt="feature-img" style=" height: 120px;"/></div>

      {{-- Lấy ra những ảnh của phòng thuộc khách sạn --}}
      @foreach($images as $img)
      <div><img src="{{ asset('administration/profile_images').'/'.$img->image_name }}" class="img-responsive" alt="feature-img" style="height: 120px;"/></div>
      @endforeach

    </div><!-- end feature-slider-nav -->
  </div>          

  <div class="detail-tabs">
    <hr>
    <h3 class="text-center">{{trans('allclient.23qaz')}}</h3>
    <div class="tab-content">
      <div id="hotel-overview" class="tab-pane in active">
        <div class="row">
          <div class="col-sm-4 col-md-4 tab-img">
            <img src="{{ asset('administration/imageRooms').'/'.$data->thumbnail }}" class="img-responsive" alt="hotel-detail-img" style=" height: 193px;" />
          </div>
          
          <div class="col-sm-8 col-md-8">
            <div class="row">
              <div class="col-md-6">
                <p>{{trans('allclient.roomtype')}}: {{ $data->roomtypes->name }}</p>
                <p>{{trans('allclient.acreage')}}: {{ $data->acreage }} m2</p>
                <p>{{trans('allclient.adult')}}: {{ $data->adult }} {{trans('allclient.people')}}</p>
                <p>{{trans('allclient.children')}}: {{ $data->kid }} {{trans('allclient.people')}}</p>
                <p>{{trans('allclient.location')}}: {{ $data->location }}</p>
              </div>
              <div class="col-md-6">
                <img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')
                ->size(120)->errorCorrection('H')
                ->generate(route('roomtype.room.detail',$data['id']))) !!} ">
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <h4></h4>
            <h4>{{trans('allclient.price')}}: {{number_format($data->price)}} VND / {{trans('allclient.night')}}</h4>
            <p>({{ $data->views }} {{trans('allclient.view')}})</p>
            <h5>{{trans('allclient.service')}}:</h5>
                @foreach ($data->service as $value)
                <button class="mb-1">{{$value->name}}</button>
                @endforeach 
            <p class="text-justify">{{ $data->description }}</p>
            <h3></h3>
            <h5>{{trans('allclient.24qaz')}}:</h5>
            @foreach ($data->tag as $value)
            <a href="{{route('roomintag',$value->id)}}">
              <button class="mb-1">{{$value->tag_name}}</button>
            </a>
            @endforeach
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="available-blocks container-fluid" id="available-rooms">
  <h2 class="font-weight-bold ">{{trans('allclient.similar')}}</h2>
  @foreach($data_similar as $value)
  <div class="list-block main-block room-block">
    <div class="list-content">
      <div class="main-img list-img room-img">
        <a href="{{route('roomtype.room.detail',$value->id)}}">
          <img src="{{ asset('administration/imageRooms').'/'.$value->thumbnail }}" class="img-responsive" alt="room-img" style=" height: 280px"/>
        </a>
        <div class="main-mask">
          <ul class="list-unstyled list-inline offer-price-1">
            <li class="price">{{number_format($value->price)}} VND<span class="divider">|</span><span class="pkg">{{trans('allclient.night')}}</span></li>
          </ul>
        </div>
      </div>
      <div class="list-info room-info">
        <h3 class="block-title"><a href="">{{$value->roomtypes->name}}</a></h3>
        <div class="row">
          <div class="col-md-6 col-sm-6">
            <p>{{trans('allclient.acreage')}}: {{ $value->acreage }} m2</p>
            <p>{{trans('allclient.adult')}}: {{ $value->adult }} 
            {{trans('allclient.people')}}</p>
            <p>{{trans('allclient.children')}}: {{ $value->kid }} 
            {{trans('allclient.kid')}}</p>
            <p>{{trans('allclient.location')}} : {{ $value->location }}</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')
            ->size(130)->errorCorrection('H')
            ->generate('http://localhost:8000/room-detail/'.$value->id)) !!} ">
          </div>
        </div>
        <a href="{{route('roomtype.room.detail',$value->id)}}" class="btn btn-orange btn-lg">{{trans('allclient.detail')}}</a>
      </div>
      
    </div>
  </div>
  @endforeach
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
  document.getElementById("payment").onchange = function() {
    if(this.value==1){
      $('.payment').show();
    }
    else{
      $('.payment').hide();
    }
  }
</script>
@endsection