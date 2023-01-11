<?php
namespace App\Repositories\Booking;

interface BookingInterface
{
    public function getAllBooking();
    public function getOnBookingByCode($id);
    public function countBookingByMonthYear($month, $year);
    public function revenueBookingByYear($year);
    public function revenueBookingByMonth($month,$year);
    public function getAllRoomAboutToCheckOut();
}