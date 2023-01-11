@extends('admin.layouts.main')
@section('title',trans('admin.calendar'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
      <div id='calendar' class="col-md-12"></div>
    </div>
</div><!-- .animated -->
@endsection
@section('script')
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js'></script>
<script>
    $(document).ready(function() {
        // page is now ready, initialize the calendar...
        $('#calendar').fullCalendar({
            events : [
                @foreach($tasks as $task)
                {
                    title : '{{ $task->fullname }}, {{ $task->booking_code }}',
                    start : '{{ $task->check_in_date }}',
                    end: '{{$task->check_out_date}}',
                    url : '{{ route('booking.show', $task->id) }}',

                },
                @endforeach
            ],
             
        })
    });
</script>


@endsection
