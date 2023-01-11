<?php
Auth::routes(['verify' => true]);


Route::namespace('Client')->group(function () {
  //Google
  Route::get('auth/google', 'LoginController@redirectToGoogle');
  Route::get('auth/google/callback', 'LoginController@handleGoogleCallback');
  //Da Ngon Ngu
  Route::get('clientlang/{lang}','HomeController@changeLang')->name('clientlang');
  //Login
  Route::get('/login', 'LoginController@showLoginForm')->name('client.login');
  Route::post('/login', 'LoginController@clientLogin')->name('client.login');
  Route::get('/register', 'RegistrationController@view')->name('client.register');

  //Logout
  Route::post('/logout', 'LoginController@logout')->name('client.logout');
  Route::get('term','HomeController@term')->name('term');



  //Home
  Route::get('/', 'HomeController@home')->name('home.client');

  //RoomType
  Route::get('kind-of-room', 'HomeController@roomType')->name('home.roomType');

  //Room In Room Type
  Route::get('room-in-roomtype/{id}/', 'HomeController@roomInRoomType')->name('roomtype.room');

  //Room Detail
  Route::get('room-detail/{id}/', 'HomeController@roomDetail')->name('roomtype.room.detail');

  //Room in Tag
  Route::get('room-in-tag/{id}/', 'HomeController@roomInTag')->name('roomintag');

  //Invoice
  Route::get('invoice','InvoiceController@index')->name('invoice');
  Route::get('addinvoice/{id}','InvoiceController@addinvoice')->name('addinvoice');
  Route::get('deleteall','InvoiceController@deleteall')->name('deleteall');
  Route::get('delete/{id}','InvoiceController@delete')->name('delete');
  
  //Room
  Route::get('room','HomeController@room')->name('room');

  //New
  Route::get('news','HomeController@news')->name('news');
  Route::get('news/{slug}','HomeController@newsDetail')->name('news_detail');

  //Feedback
  Route::get('feedback','FeedbackController@index')->name('feedback');
  Route::post('feedback/store','FeedbackController@store')->name('feedback.store');


  //Member
  Route::post('member/store','HomeController@member')->name('member.store');

  //Introduce
  Route::get('introduce','HomeController@introduce')->name('introduce');

	Route::get('searchall', 'HomeController@searchall')->name('searchall');
  Route::get('filter', 'HomeController@filter')->name('filter');
  Route::get('filter_room', 'HomeController@filterRoom')->name('filter_room');
  Route::get('emptyRoom/{id}', 'HomeController@roomDetail')->name('emptyRoom');
  
  Route::group(['middleware' => ['auth']], function () {

      // Checkout
      Route::get('payment/{id}','InvoiceController@payment')->name('payment');
      Route::get('result_payment','InvoiceController@result_payment')->name('result_payment');
      Route::get('check_price','InvoiceController@check_price')->name('check_price')->middleware('verified');
      Route::post('checkout','InvoiceController@checkout')->name('checkout')->middleware('verified');
      Route::post('quick_checkout/{id}','InvoiceController@quick_checkout')->name('quick_checkout')->middleware('verified');
      
      // Vote booking
      Route::get('vote/{id}','InvoiceController@vote')->name('vote');
      Route::post('vote_store/{id}','InvoiceController@vote_store')->name('vote.store');

      //profileUser
		  Route::group(['prefix'=>'profile'],function () {

        Route::get('user', 'UserController@profileUser')->name('profile.profileUser');
        Route::put('updateuser/{id}', 'UserController@profileUpdate')->name('profile.updateuser');

        Route::get('history', 'UserController@history')->name('profile.history');
        Route::get('booking_detail/{id}','UserController@bookingdetail')->name('booking_detail');
        Route::put('/{id}','UserController@delete_booking')->name('updatebooking.update');
        Route::get('/changePassword', 'UserController@changePassword')->name('profile.changePassword');
        Route::post('/changePass','UserController@postPassword')->name('changePass');
		});
  });
});

    
        


