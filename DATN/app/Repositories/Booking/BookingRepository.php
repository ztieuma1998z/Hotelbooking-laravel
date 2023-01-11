<?php
namespace App\Repositories\Booking;

use App\Repositories\EloquentRepository;
use Carbon\Carbon;

class BookingRepository extends EloquentRepository implements BookingInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Booking::class;
    }

    public function getALLBooking()
    {

        return $this->_model->where('isdeleted',false)->orderBy('status', 'asc')->orderBy('created_at', 'desc')->get();
    }

    public function getOnBookingByCode($id)
    {
        return $this->_model->where('booking_code',$id)->where('isdeleted',false)->first();
    }

    public function countBookingByMonthYear($month, $year)
    {
        return $this->_model->where('isdeleted',0)->whereMonth('transaction_date', $month)->whereYear('transaction_date', $year)->count();
    }

    public function revenueBookingByYear($year)
    {
        return $this->_model->where('isdeleted',0)->where('status','>=',2)->whereYear('check_out_date', $year)->sum('total_amount');
    }

    public function revenueBookingByMonth($month,$year)
    {
        return $this->_model->where('isdeleted',0)->where('status','>=',2)->whereMonth('check_out_date',$month)->whereYear('check_out_date', $year)->sum('total_amount');
    }

    public function getAllRoomAboutToCheckOut()
    {
        $year=  Carbon::now()->year;
        $month = Carbon::now()->month;
        $day = Carbon::now()->day;
        $day = $day + 1;

        return $this->_model->where('isdeleted',0)->where('status','>=',2)->whereMonth('check_out_date',$month)->whereYear('check_out_date', $year)->whereDay('check_out_date', $day)->get();

    }

}