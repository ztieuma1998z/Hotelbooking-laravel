@extends('client.layouts.main')
@section('title',trans('allclient.ht'))
@section('css')
<style>
    .hide{
        display: none;
    }
    .uppercase-first-letter{
        text-transform: capitalize;
        font-weight: normal !important;
    }
    .input-edit{
        font-weight: normal !important;
    }
    .input-edit .btn-save:hover{
        background: #1abd9d;
        color: whitesmoke;
    }
    .input-edit .btn-close:hover{
        background: #e84c3c;
        color: whitesmoke;
    }
    .input-edit button{
        margin: 15px 10px 10px 10px;
        padding: 5px 12px;
        font-size: 16px;
        box-shadow: 1px 1px 3px 1px grey;
        border-radius: 3px;
        border: none;
    }
    .input-edit textarea{
        height: ;
    }
    .input-edit input,.input-edit textarea, .input-edit select{
        padding-left: 5px;
        box-shadow: 1px 1px 3px 1px grey;
        border: none;
        margin: 5px 5px 0px 5px;
        border-radius: 3px;
        width: 100%;
        display: block;
    }
    .old-value{
        text-transform: none;
        font-weight: normal !important;
    }

    .edit-btn:hover{
        background: #29c4e3;
        color: whitesmoke;
    }
    .edit-btn{
        box-shadow: 1px 1px 3px 1px grey;
        font-size: 25px;
        border-radius: 3px;
        border: none;
    }
    .user-profile .panel-default {
        box-shadow: 1px 1px 10px 2px #b5b1b1;
    }
    .panel-body {
        padding: 25px 40px !important;
    }
    .alert {
        padding: 10px !important;
    }
</style>
@endsection
@section('breadcrumb')
<!--========== PAGE-COVER =========-->
<section class="page-cover dashboard">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="page-title">
                {{trans('allclient.Myaccount')}}</h1>
                <ul class="breadcrumb">
                    <li><a href="{{route('home.client')}}">{{trans('allclient.home')}}</a></li>
                    <li><a>{{trans('allclient.Myaccount')}}</a></li>
                    <li class="active">{{trans('allclient.ht')}}</li>
                </ul>
            </div>
        </div>
    </div>
</section>
@endsection
@section('content')
<!--===== INNERPAGE-WRAPPER ====-->
<section class="innerpage-wrapper">
    <div id="dashboard" class="innerpage-section-padding" style="padding-top:0">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="dashboard-wrapper">
                        <div class="row">
                            @include('client.components.user_dasboard')
                            <div class="col-xs-12 col-sm-10 col-md-10 dashboard-content user-profile">
                                <div class="panel panel-default" style="margin-top: 25px;">
                                    <div class="panel-heading">
                                        <h4 style="display: inline; margin-right: 20px">{{trans('allclient.bq')}}</h4>
                                    </div>
                                    <div class="panel-body">
                                     <table class="table">
                                        <thead>
                                            <tr>
                                                <th>{{trans('allclient.bw')}}</th>
                                                <th>{{trans('allclient.be')}}</th>
                                                <th>{{trans('allclient.br')}}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($booking_detail as $booking_detail)
                                            <tr>
                                                <td>
                                                    <a href="{{route('roomtype.room.detail',$booking_detail->room->id)}}">
                                                    <img width="60px" src="{{asset('administration/imageRooms/'.$booking_detail->room->thumbnail)}}">
                                                    </a>
                                                </td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                                <div class="panel panel-default" style="margin-top: 50px">
                                    <div class="panel-heading">
                                        <h4 style="display: inline; margin-right: 20px">{{trans('allclient.bg')}}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>{{trans('allclient.bt')}}</th>
                                                    <th>{{trans('allclient.by')}}</th>
                                                    <th>{{trans('allclient.br')}}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($cost_overrun as $cost_overrun)
                                                <tr>
                                                    <td>{{ $cost_overrun->cost->name }}</td>
                                                    <td>{{ $cost_overrun->cost->description }}</td>
                                                    <td>{{number_format($cost_overrun->cost->price)}} VND/{{trans('allclient.bh')}}/{{trans('allclient.bj')}} </td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>  
                                </div>
                                <h4 class="btn btn-block btn-info" onclick="show_price()" ><b>Detail price</b></h4>
                                <br>
                                <div id="show_price" style="display: none;">
                                    <br>
                                    <i>{{ trans('booking.note') }}</i><br><hr>
                                    @foreach($detail_price as $key => $value)
                                    {!! ++$key.'. '. $value !!}
                                    @endforeach
                                    <hr>
                                    {{ $detail_price->appends(request()->except('page'))->links() }}
                                    <h5 class="text-right">{{trans('booking.total-amount')}} : <font color="red">{{number_format($booking->total_amount)}}</font></h5>
                                </div>
                                <div class="panel panel-default" style="margin-top: 50px">
                                    <div class="panel-heading">
                                        <h4 style="display: inline; margin-right: 20px">{{trans('allclient.bk')}}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-group">
                                            <li class="list-group-item">{{trans('allclient.bu')}}: {{ $booking->booking_code }}</li>
                                            <li class="list-group-item">{{trans('allclient.bi')}}: {{ date('d-m-Y',strtotime($booking->transaction_date)) }}</li>
                                            <li class="list-group-item">{{trans('allclient.bo')}}: {{ date('d-m-Y',strtotime($booking->check_in_date)) }}</li>
                                            <li class="list-group-item">{{trans('allclient.bp')}}: {{ date('d-m-Y',strtotime($booking->check_out_date)) }}</li>

                                            <li class="list-group-item">
                                                <div class="float-left">{{trans('allclient.ba')}}</div>
                                                <div class="float-left">
                                                    @if($booking->status==0)
                                                    <h5><span class="label label-danger">
                                                        {{trans('allclient.hy')}} <i class="fa fa-info-circle" aria-hidden="true"></i></span></h5>
                                                        @elseif($booking->status==1)
                                                        <h5><span class="label label-info">
                                                            {{trans('allclient.hu')}} <i class="fa fa-check-circle" aria-hidden="true"></i></span></h5>
                                                            @elseif($booking->status==2)
                                                            <h5><span class="label label-success">
                                                                {{trans('allclient.hi')}} <i class="fa fa-money" aria-hidden="true"></i></span></h5>
                                                                @else
                                                                <h5><span class="label label-primary">
                                                                    {{trans('allclient.ho')}} <i class="fa fa-money" aria-hidden="true"></i></span></h5>
                                                                    @endif
                                                                </div>
                                                            </li>
                                                            @if($booking->message)
                                                            <li class="list-group-item">
                                                                {{trans('allclient.bs')}}: {{ $booking->message }}</li>
                                                                @endif

                                                                <li class="list-group-item">
                                                                    {{trans('allclient.total')}}: {{number_format($booking->total_amount)}} VNĐ
                                                                </li>
                                                                <li class="list-group-item">
                                                                    @if($booking->payment==1)
                                                                        <span class="label label-success">{{trans('allclient.bf')}}</span>
                                                                    @elseif($booking->status==3 && $booking->payment==0)
                                                                        <span class="label label-success">{{trans('allclient.bd')}}</span>
                                                                    @else
                                                                        <span class="label label-warning">{{trans('allclient.unpaid')}}</span>
                                                                        <a href="{{ route('payment',$booking->id) }}">{{trans('allclient.payment-now')}}</a>
                                                                    @endif
                                                                </li>
                                                            </ul>
                                                            <div class="grid-btn">
                                                                @if($booking->status==3)
                                                                <a class="btn btn-block btn-orange" href="{{ url('vote',$booking->id) }}">{{trans('allclient.bl')}}</a>
                                                                @endif
                                                                @if($can == 1)
                                                                {{ Form::open(['route' => ['updatebooking.update',$booking->id], 'method' => 'put','enctype '=>'multipart/form-data', 'class'=>'row ml-2']) }}
                                                                <input type="submit" class="btn btn-orange btn-block btn-lg" name="" value="Cancel booking">
                                                            </div>
                                                            {{ Form::close() }}
                                                            @endif
                                                        </div>
                                                    </div>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>         
                        </div>
                    </section>
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
                  @section('script1')
                  @endsection
