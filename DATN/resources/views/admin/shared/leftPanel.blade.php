<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="{{route('dashboard')}}"><i class="menu-icon fa fa-laptop"></i>{{ trans('admin.dashboard') }} </a>
                </li>
                <!-- //User Managerment -->

                <li class="menu-title">{{ trans('admin.user_manager') }}</li>
                @can('user-list')
                <li>
                    <a href="{{route('user.index')}}"> <i class="menu-icon fa fa-users"></i>{{ trans('admin.user') }} </a>
                </li>
                @endcan
                @can('admin-list')
                <li>
                    <a href="{{route('admin.index')}}"> <i class="menu-icon fa fa-user-secret"></i>{{ trans('admin.admin') }} </a>
                </li>
                @endcan
                @can('role-list')
                <li>
                    <a href="{{route('roles.index')}}"> <i class="menu-icon fa fa-users"></i>{{ trans('admin.role') }} </a>
                </li>
                @endcan

                <!-- //RoomManagerment -->

                <li class="menu-title">{{ trans('admin.room_manager') }}</li>
                @can('roomtype-list')
                <li>
                    <a href="{{route('roomtype.index')}}"> <i class="menu-icon fa fa-address-card-o"></i>{{ trans('admin.roomtype') }}</a>
                </li>
                @endcan
                @can('tag-list')
                <li>
                    <a href="{{route('tag.index')}}"> <i class="menu-icon fa fa-tags"></i>{{ trans('admin.tag') }}</a>
                </li>
                @endcan
                @can('service-list')
                <li>
                    <a href="{{route('service.index')}}"> <i class="menu-icon fa fa-server"></i>{{ trans('admin.service') }}</a>
                </li>
                @endcan
                @can('room-list')
                <li>
                    <a href="{{route('room.index')}}"> <i class="menu-icon fa fa-bed"></i>{{ trans('admin.room') }}</a>
                </li>
                @endcan
                @can('price-list')
                <li>
                    <a href="{{route('price.index')}}"> <i class="menu-icon fa fa-usd"></i>{{trans('admin.price')}}</a>
                </li>
                @endcan
                @can('cost-list')
                <li>
                    <a href="{{route('cost.index')}}"> <i class="menu-icon fa fa-list"></i>{{ trans('admin.cost_overrun_manager') }}</a>
                </li>
                @endcan

                <!-- //Booking Managermetn -->                            
                @can('booking-list')            
                <li class="menu-title">{{ trans('admin.booking_manager') }}</li>
                <li>
                    <a href="{{route('booking.index')}}"> <i class="menu-icon fa fa-bookmark"></i>{{trans('admin.booking')}} </a>
                </li>
                <li>
                    <a href="{{route('expire')}}"> <i class="menu-icon fa fa-modx"></i>{{ trans('admin.booking_expire') }}</a>
                </li>
                @endcan
                <!-- //Checkin & checkout -->
                @can('checkin-checkout-list')
                <li class="menu-title">Check</li>
                <li>
                    <a href="{{route('checkin.test')}}"> <i class="menu-icon fa fa-list-alt"></i>Check In & Check Out</a>
                </li>
                @endcan
                <!-- //Other Managerment -->                        
  
                <li class="menu-title">{{ trans('admin.other') }}</li>

                @can('new-list')
                <li>
                    <a href="{{route('news.index')}}"> <i class="menu-icon fa fa-newspaper-o"></i>{{ trans('admin.new') }}</a>
                </li>
                @endcan
                @can('feedback-list')
                <li>
                    <a href="{{route('feedback.index')}}"> <i class="menu-icon fa fa-commenting-o"></i>{{ trans('admin.feedback') }}</a>
                </li>
                @endcan
                @can('audit-list')
                <li>
                    <a href="{{route('audit')}}"> <i class="menu-icon fa fa-braille"></i>{{ trans('admin.audit') }}</a>
                </li>
                @endcan
                @can('vote-list')
                <li>
                    <a href="{{route('vote.index')}}"> <i class="menu-icon fa fa-vimeo"></i>{{ trans('admin.vote') }}</a>
                </li>

                @endcan
                <!-- //Char  -->
                @can('revenue-statistics-by-year','revenue-statistics-by-month')
                <li class="menu-title">{{ trans('admin.chart') }}</li>
                @can('revenue-statistics-by-year')
                <li>
                    <a href="{{route('statistic.year')}}"> <i class="menu-icon fa fa-line-chart"></i>{{ trans('admin.byyear') }}</a>
                </li>
                @endcan
                @can('revenue-statistics-by-month')
                <li>
                    <a href="{{route('statistic.month')}}"> <i class="menu-icon fa fa-area-chart"></i>{{ trans('admin.bymonth') }}</a>
                </li>
                @endcan
                <li>
                    <a href="{{route('statistic.calendar')}}"> <i class="menu-icon fa fa-calendar-check-o"></i>{{trans('admin.calendar')}}</a>
                </li>   
                @endcan 
                     
            </ul>
        </div>
    </nav>
</aside>