<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\Booking\BookingInterface;

use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Booking;
use Mail;

class CheckInController extends Controller
{

    protected $bookingRP;

    public function __construct(BookingInterface $bookingInterface)
    {
        $this->middleware('permission:checkin-checkout-list|checkin-checkout-edit|checkin-checkout-show', ['only' => ['test']]);

        $this->middleware('permission:checkin-checkout-edit', ['only' => ['store','update']]);
        $this->bookingRP = $bookingInterface;
    }

    public function test()
    {
    	$result = 0;
    	return view('admin.checkin.ad',compact('result'));
    }

	public function store(Request $request) 
    {
		$result = $this->bookingRP->getOnBookingByCode($request->id);
		if ($result) {
			return view('admin.checkin.ad',compact('result'));
		}else{
            $notification = array(
            'message' => trans('admin.wrong_booking'),
            'alert-type' => 'info'
            );
            return back()->with($notification);
        }

	}

    public function update(Request $request, $id)
    { 
        $booking = $this->bookingRP->find($id);
        $booking->status = $request->status;
        $result = $this->bookingRP->update($booking->id, $booking->toArray());
        if($booking->status==3){
            // Gui mail
                $qr = QrCode::format('png')->size(200)->generate(url('vote',$booking->id));
                Mail::send('email.vote',[
                    'id' => $booking->id,
                    'name' => $booking->fullname,
                    'png' => $qr

                ], function($message) use ($booking) {
                    $message->to($booking->email);
                    $message->subject('Please evaluate the quality of the service');
                });
        }
        return redirect()->route('checkin.test')->with('message', trans('message.success-edit'));
    }
}
