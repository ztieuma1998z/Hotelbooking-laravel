<nav class="navbar navbar-default main-navbar navbar-custom navbar-white" id="mynavbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" id="menu-button">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="header-search hidden-lg">
                <a href="javascript:void(0)" class="search-button"><span><i class="fa fa-search"></i></span></a>
            </div>
            <a href="{{ url('/') }}" class="navbar-brand"><span><i class="fa fa-building"></i>ELA</span>HOTEL</a>
        </div><!-- end navbar-header -->

        <div class="collapse navbar-collapse" id="myNavbar1">
            <ul class="nav navbar-nav navbar-right">
                <li class="home-status active"><a href="{{route('home.client')}}"   >{{trans('allclient.home')}}</a></li>
                <li class="room-status"><a href="{{route('home.roomType')}}">{{trans('allclient.roomtype')}}</a></li>
                <li class="top-room-status"><a href="{{route('room')}}">{{trans('allclient.room')}}</a></li>
                <li class="news-status"><a href="{{ route('news') }}">{{trans('allclient.new')}}</a></li>
                <li class="introduce-status"><a href="{{ route('introduce') }}">{{trans('allclient.introduce')}}</a></li>
                <li class="contact-status"><a href="{{ route('feedback') }}">{{trans('allclient.contact')}}</a></li>
                <li class="invoice-status"><a href="{{ route('invoice') }}">{{trans('allclient.invoice')}}</a></li>
                <li><a href="javascript:void(0)" class="search-button" onclick="display()"><span><i class="fa fa-search"></i></span></a></li>
            </ul>
        </div><!-- end navbar collapse -->
    </div><!-- end container -->
</nav><!-- end navbar -->

<div class="sidenav-content">
    <div id="mySidenav" class="sidenav" >
        <h2 id="web-name"><span><i class="fa fa-plane"></i></span>Star Travel</h2>

        <div id="main-menu">
            <div class="closebtn">
                <button class="btn btn-default" id="closebtn">&times;</button>
            </div><!-- end close-btn -->
            <div class="list-group panel">
                <a href="{{route('home.client')}}" class="home-status list-group-item active"  ><span><i class="fa fa-home link-icon"></i></span>{{trans('allclient.home')}} </a>
                <a href="{{route('home.roomType')}}" class="room-status list-group-item"  ><span><i class="fa fa-building link-icon"></i></span>{{trans('allclient.roomtype')}}</a>
                <a href="{{route('room')}}" class="top-room-status list-group-item"  ><span><i class="fa fa-building link-icon"></i></span>{{trans('allclient.room')}}</a>
                <a href="{{ route('news') }}" class="news-status list-group-item"  ><span><i class="fa fa-newspaper-o link-icon"></i></span>{{trans('allclient.new')}} </a>
                <a href="{{ route('introduce') }}" class="introduce-status list-group-item"  ><span><i class="fa fa-ship link-icon"></i></span>{{trans('allclient.introduce')}}</a>
                <a href="{{ route('invoice') }}" class="contact-status list-group-item"  ><span><i class="fa fa-compress link-icon"></i></span>{{trans('allclient.contact')}}</a>
                <a href="{{ route('invoice') }}" class="invoice-status list-group-item"  ><span><i class="fa fa-id-card-o link-icon"></i></span>{{trans('allclient.invoice')}}</a>
            </div><!-- end list-group -->
        </div><!-- end main-menu -->
    </div><!-- end mySidenav -->
</div><!-- end sidenav-content -->