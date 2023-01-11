<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\Booking\BookingInterface;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\BookingDetail;
use App\Models\Booking_Cost;
use App\Models\Price;
use App\Exports\BookingsExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class BookingController extends Controller
{

    protected $bookingRP;

    public function __construct(BookingInterface $bookingInterface)
    {
        $this->middleware('permission:booking-list|booking-edit|booking-delete|booking-export', ['only' => ['index']]);
        $this->middleware('permission:booking-export', ['only' => ['create','store']]);
        $this->middleware('permission:booking-edit', ['only' => ['show','update']]);
        $this->middleware('permission:booking-delete', ['only' => ['destroy']]);
        $this->bookingRP = $bookingInterface;
    }

    public function index()
    {
        $booking = $this->bookingRP->getAllBooking();
        return view('admin.booking.index',compact('booking'));
    }

    public function indexCheckout()
    {
        $booking = $this->bookingRP->getAllRoomAboutToCheckOut();
         return view('admin.booking.indexcheckout',compact('booking'));
    }


    public function create()
    {
        //
    }


    public function store(Request $request)
    {
        //
    }


    public function show($id)
    {
        $booking = $this->bookingRP->find($id);
        $cost = Booking_Cost::wherebooking_id($id)->get();
        $booking_detail = BookingDetail::where('booking_id','like',$id)->get();
        for ($currentDate = strtotime($booking->check_in_date); $currentDate <= strtotime($booking->check_out_date);  
                $currentDate += (86400)) { 
                $array[] = date('Y-m-d', $currentDate); 
        }
        $tongtien = 0;
        $sum = 0;
        $total_sv = Booking_Cost::wherebooking_id($id)->sum('price');
        // $specialday = SpecialDay::wherebooking_id($id)->get();
        // foreach ($specialday as $key => $value) {
        //     $specialday[$key] = $value->price;
        // }
        $specialday = Price::pluck('date','id')->where('isdeleted',0)->toArray();
        $result = array_intersect($array,$specialday);
        $sum = BookingDetail::wherebooking_id($id)->sum('price');
        foreach ($array as $key=> $value) {
            if(in_array($value, $specialday)){
                $array[$key] = date('d-m-Y',strtotime($value)).' : '.($total_sv+$sum+($sum*Price::where('date',$result[$key])->value('percent')/100)).' VND || ('.Price::where('date',$result[$key])->value('description').' : '.Price::where('date',$result[$key])->value('percent').'%)<br>';
            }
            else{
                $array[$key] = date('d-m-Y',strtotime($value)).' : '.($total_sv+$sum).' VND <br>';
            }  
        }// end foreach
        // Xu ly phan trang cho collection
        Collection::macro('paginate', function($perPage, $total = null, $page = null, $pageName = 'page') {
            $page = $page ?: LengthAwarePaginator::resolveCurrentPage($pageName);

            return new LengthAwarePaginator(
                $this->forPage($page, $perPage),
                $total ?: $this->count(),
                $perPage,
                $page,
                [
                    'path' => LengthAwarePaginator::resolveCurrentPath(),
                    'pageName' => $pageName,
                ]
            );
        });
        $detail_price = (new Collection($array))->paginate(10);
        return view('admin.booking.detail', compact('booking','booking_detail', 'cost', 'detail_price'));
    }


    public function edit($id)
    {
        //
    }


    public function update(Request $request, $id)
    {
        $booking = $this->bookingRP->find($id);
        $booking->status = $request->status;
        $result = $this->bookingRP->update($booking->id, $booking->toArray());

        if ($result) { 
            return back()->with('message', trans('message.success-edit'));
        } else {
             return back()->with('message',trans('message.update_error'));
        }
        
    }


    public function destroy(Request $request)
    {
        $booking = $this->bookingRP->find($request->id);
        $booking->isdeleted = true;
        $result = $this->bookingRP->update($booking->id, $booking->toArray());

        if ($result) { 
            return back()->with('message', trans('message.success-delete'));
        } else {
            return back()->with('message',trans('message.delete_failse'));
        }
    }

    public function export() 
    {
        return Excel::download(new BookingsExport, 'bookings.xlsx');
    }
}
