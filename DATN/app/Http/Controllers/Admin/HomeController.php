<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Session;
use Carbon\Carbon;
use App\Models\Booking;
use App\Repositories\News\NewsInterface;
use App\Repositories\Room\RoomInterface;
use App\Repositories\Vote\VoteInterface;
use App\Repositories\User\UserInterface;
use App\Repositories\Booking\BookingInterface;
use Mail;
class HomeController extends Controller
{

  private $langActive = [
    'vi',
    'en',
  ];

  protected $newRP;
  protected $roomRP;
  protected $voteRP;
  protected $bookingRP;

  public function __construct(NewsInterface $newsRepository, RoomInterface $roomRepository, VoteInterface $voteInterface,UserInterface $userInterface,BookingInterface $bookingInterface)
  {
    $this->newRP = $newsRepository;
    $this->roomRP = $roomRepository;
    $this->voteRP = $voteInterface;
    $this->userRP = $userInterface;
    $this->bookingRP = $bookingInterface;
  }

  public function index()
  {
    $news = $this->newRP->countNew();
    $room_total = $this->roomRP->countRoom();
    $user_total = $this->userRP->countUserclient();
    $votes = $this->voteRP->countVote();
    return view('admin.home.index',compact('news','room_total','user_total','votes'));
  }

  public function chart()
  {
    $result = array();
    $month = Carbon::now()->month;
    $year=  Carbon::now()->year;
    $arrMonth = array();
    $arrUser = array();
    $arrRevenue = array();

    $arrMonth = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
      for ($i = 1; $i <= 12; $i++) {
        $arrUser[] =  $this->userRP->countUserClientByMonthAndYear($i,$year);
        $arrRevenue[] = $this->bookingRP->countBookingByMonthYear($i,$year);
      }
    $result = [$arrMonth, $arrUser, $arrRevenue];
    return response()->json($result);
  }

  public function changeLang(Request $request, $lang)
  {
    if (in_array($lang, $this->langActive)) {
      $request->session()->put(['lang' => $lang]);
      return redirect()->back();
    }
  }

  public function error404()
  {
    return view('admin.error.error404');
  }

  public function expire()
  {
    $data = Booking::where( 'check_out_date', '=', Carbon::now('Asia/Ho_Chi_Minh')->addDays(1)->format('Y-m-d'))->get();
      return view('admin.booking.expire', compact('data'));
  }

  public function sendNoti($email){
    $data = array('name'=>"ElaHotel");
    Mail::send('email.sendnoti',$data,function($message) use ($email){
            $message->to($email);
            $message->subject(trans('admin.out'));
    });
    $notification = array(
          'message' => trans('admin.send_noti_success'),
          'alert-type' => 'success'
    );
    return redirect()->back()->with($notification);
  }
  
  public function testMail()
  {
    $name = 'Ngô Đình Long';
    Mail::send('email.test',compact('name'),function($test) use ($name){
            $test->to('nguyenlinh00981@gmail.com',$name);
            $test->subject('Demo email');
    });
  
  }  
}
