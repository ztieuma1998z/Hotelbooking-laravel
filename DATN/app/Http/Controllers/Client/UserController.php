<?php

namespace App\Http\Controllers\Client;

use App\Helpers\Helper;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Booking;
use App\Models\BookingDetail;
use App\Models\Price;
use App\Models\Booking_Cost;
use App\Models\Vote;
use Auth;
use Session;
use Carbon\Carbon;
use Illuminate\Support\Str;
use App\Repositories\User\UserInterface;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\ChangePasswordRequest;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
class UserController extends Controller
{
	protected $userRP;

    public function __construct(UserInterface $userInterface)
    {
        $this->userRP = $userInterface;
        $this->middleware('verified');
    }

    public function profileUser()
    {
        $user = $this->userRP->find(Auth::id());
    	return view('client.user.userProfile',compact('user'));
    }
    public function profileUpdate(Request $request, $id)
    {
        
        $user = $this->userRP->find($id);

        $imageName = $user->image;

        if($request->hasFile('image')){
                $helper = new Helper();
                $imageName = $helper->uploadFile(request('image'));
        }

        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->gender = $request->gender;
        // $user->email = $request->email;
        $user->image = $imageName;
        $user->street = $request->street;
        $user->state = $request->state;
        $user->city = $request->city;
        $user->phone = $request->phone;
        $user->nationality = $request->nationality;
        $user->dateofbirth = $request->dateofbirth;
        
        $result = $this->userRP->update($id, $user->toArray());
        if ($result){
            $notification = array(
            'message' => trans('allclient.update_infor_success'),
            'alert-type' => 'success'
            );
            return back()->with($notification);
        }else{
            return back()->with('err','Update error!');
        }

    }

    public function changePassword()
    {
    	return view('client.user.changePassword');
    }

    public function postPassword (ChangePasswordRequest $request){

        if (!(Hash::check($request->get('current-password'), Auth::user()->password))) {
             $notification1 = array(
            'message' => trans('allclient.changepassword'),
            'alert-type' => 'warning'
            );
            return redirect()->back()->with($notification1);
        }

        if(strcmp($request->get('current-password'), $request->get('new-password')) == 0){
            $notification2 = array(
            'message' => trans('allclient.samepassword'),
            'alert-type' => 'warning'
            );
            return redirect()->back()->with($notification2);
        }

        $user = Auth::user();
        $user->password = bcrypt($request->get('new-password'));
        $user->save();

        $notification3 = array(
            'message' => trans('allclient.success'),
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification3);

    }

    public function history()
    {
        $booking = Booking::where('user_id',Auth::id())->where('isdeleted',0)->orderBy('status', 'asc')->orderBy('created_at', 'desc')->get();
        return view('client.user.history', compact('booking'));
    }

    public function bookingdetail($id)
    {
        $booking_detail = BookingDetail::where('booking_id',$id)->get();
        $user = User::findOrfail(Auth::id());
        $booking = Booking::findOrfail($id);
        $price = Price::pluck('date','id')->toArray();
        $checkin = $booking->check_in_date;
        $checkout = $booking->check_out_date;
        // $vote = Vote::wherebooking_id($id)->first();
        for ($currentDate = strtotime($checkin); $currentDate <= strtotime($checkout);  
                $currentDate += (86400)) { 
                $array[] = date('Y-m-d', $currentDate); 
        }
        $result = array_intersect($array,$price);
        $canDeleteBooking = strtotime($booking->transaction_date) + (86400 * 4);
        $current = strtotime(Carbon::now('Asia/Ho_Chi_Minh')->format('Y-m-d'));
        $can = null;
        if ($current <= $canDeleteBooking) {
            if ($booking->status == '0') {
                $can = 1;
            }else{
                $can = 0;
            }
        }else{
            $can = 0;
        }

        $cost_overrun = Booking_Cost::where('booking_id',$id)->get();

        // Show detail price
        // for ($currentDate = strtotime($checkin); $currentDate <= strtotime($checkout);  
        //         $currentDate += (86400)) { 
        //         $array[] = date('Y-m-d', $currentDate); 
        // }
        // dd($array);

        $tongtien = 0;
        $sum = 0;
        $total_sv = Booking_Cost::wherebooking_id($id)->sum('price');
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
        return view('client.user.booking_detail', compact('booking_detail','user','booking','cost_overrun','can', 'detail_price'));
    }


    public function delete_booking($id)
    {
        $booking =Booking::findOrfail($id);
        $booking->update([
           'isdeleted' => true,
        ]);
        return redirect()->route('profile.history');
    }


}
