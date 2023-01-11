<?php
use App\Notification;
use Illuminate\Support\Facades\Route;


Route::namespace('Admin')->group(function () {

	//Da ngon ngu
	Route::get('lang/{lang}','HomeController@changeLang')->name('lang');
	//Login
	Route::get('/login', 'LoginController@showLoginForm')->name('admin.loginadmin');
	Route::post('/login', 'LoginController@adminLogin')->name('admin.login');
	Route::post('logout', 'LoginController@logout')->name('admin.logout');
	Route::get('/error404','HomeController@error404')->name('error404');
	Route::group(['middleware' => ['auth:admin']], function () {

		Route::get('/dashboard', 'HomeController@index')->name('dashboard');
		Route::get('/chart', 'HomeController@chart');
		Route::get('/expire', 'HomeController@expire')->name('expire');
		Route::get('bookingexpire/{email}', 'HomeController@sendNoti')->name('bookingexpire');
		Route::get('testmail', 'HomeController@testMail')->name('testmail');

	//Roomtype
		Route::resource('roomtype','RoomTypeController');
		Route::delete('roomtype_delete', 'RoomTypeController@destroy')->name('roomtype_delete');
    //Tag
		Route::resource('tag','TagController');
		Route::delete('tag_delete', 'TagController@destroy')->name('tag_delete');
    //Service
		Route::resource('service','ServiceController');
		Route::delete('service_delete', 'ServiceController@destroy')->name('service_delete');
	//Room
		Route::group(['prefix'=>'room'],function () {
			Route::get('/', 'RoomController@index')->name('room.index');
			Route::get('/create', 'RoomController@create')->name('room.create');
			Route::post('/','RoomController@store')->name('room.store');
			Route::put('/{id}','RoomController@update')->name('room.update');
			Route::get('/{id}/edit', 'RoomController@edit')->name('room.edit');
			Route::get('/{id}', 'RoomController@show')->name('room.show');
			Route::post('room_image','RoomController@imageStore')->name('room_image');
			Route::post('delete_image','RoomController@fileDestroy')->name('delete_image');
			Route::get('get/export', 'RoomController@export')->name('room.export');
			Route::get('/{id}/edit-image-room', 'RoomController@editImage')->name('room.editImage');
			Route::post('image','RoomController@updateImage')->name('room.storeImage');
		});
		Route::delete('room_delete', 'RoomController@destroy')->name('room_delete');
		Route::delete('imageRoom_delete', 'RoomController@destroyImage')->name('imageRoom_delete');
	//User
		Route::group(['prefix'=>'user'],function () {
			Route::get('/', 'UserController@index')->name('user.index');
			Route::get('/{id}', 'UserController@show')->name('user.show');
			Route::post('edit/status/{id}', 'UserController@editStatus')->name('user.editStatus');
			Route::get('get/export', 'UserController@export')->name('user.export');
		});
		Route::delete('user_delete', 'UserController@destroy')->name('user_delete');
	//Role
		Route::resource('roles','RoleController');
		Route::delete('role_delete', 'RoleController@destroy')->name('role_delete');
	//Admin	
        Route::resource('admin','AdminController');
        Route::delete('admin_delete', 'AdminController@destroy')->name('admin_delete');
    //Profile Admin
        Route::get('adminProfile/{id}','AdminController@adminProfile')->name('adminProfile');
        Route::post('postchange','AdminController@postchange')->name('postchange');
	//Price Manager
		Route::group(['prefix'=>'price'],function () {
			Route::get('/', 'PriceController@index')->name('price.index');
			Route::get('/create', 'PriceController@create')->name('price.create');
			Route::post('/','PriceController@store')->name('price.store');
			Route::put('/{id}','PriceController@update')->name('price.update');
			Route::get('/{id}/edit', 'PriceController@edit')->name('price.edit');
			Route::get('/{id}', 'PriceController@show')->name('price.show');
		});
		Route::delete('price_delete', 'PriceController@destroy')->name('price_delete');
	//Booking
		Route::group(['prefix'=>'booking'],function () {
			Route::get('/', 'BookingController@index')->name('booking.index');
			Route::get('check-out-listing', 'BookingController@indexCheckout')->name('booking.indexCheckout');
			Route::get('/create', 'BookingController@create')->name('booking.create');
			Route::post('/','BookingController@store')->name('booking.store');
			Route::put('/{id}','BookingController@update')->name('booking.update');
			Route::get('/{id}/edit', 'BookingController@edit')->name('booking.edit');
			Route::get('/{id}', 'BookingController@show')->name('booking.show');
			Route::get('get/export', 'BookingController@export')->name('booking.export');
		});
		Route::delete('booking_delete', 'BookingController@destroy')->name('booking_delete');
	//Checkin
		Route::group(['prefix'=>'checkin'],function () {
			Route::get('test','CheckInController@test')->name('checkin.test');
			Route::post('/testqr','CheckInController@store')->name('test.qr');
			Route::put('/{id}','CheckInController@update')->name('checkin.update');
		});
	//Statistics
		Route::group(['prefix'=>'statistic'],function () {
			Route::get('/statistic', 'StatisticalController@statistic')->name('statistic.year');
			Route::get('/revenueStatistics', 'StatisticalController@revenueStatistics');
			Route::get('/statisticMonth', 'StatisticalController@statisticMonth')->name('statistic.month');
			Route::get('/revenueStatisticsMonth', 'StatisticalController@revenueStatisticsMonth');
			Route::get('/calendar', 'StatisticalController@calendar')->name('statistic.calendar');
		});
	//News
		Route::group(['prefix'=>'news'],function () {
			Route::get('/', 'NewsController@index')->name('news.index');
			Route::get('/create', 'NewsController@create')->name('news.create');
			Route::post('/','NewsController@store')->name('news.store');
			Route::put('/{id}','NewsController@update')->name('news.update');
			Route::get('/{id}/edit', 'NewsController@edit')->name('news.edit');
			Route::get('/{id}', 'NewsController@show')->name('news.show');
		});
		Route::delete('news_delete', 'NewsController@destroy')->name('news_delete');
	// Cost Overrun
		Route::group(['prefix'=>'cost'],function () {
			Route::get('/', 'CostController@index')->name('cost.index');
			Route::get('/create', 'CostController@create')->name('cost.create');
			Route::post('/','CostController@store')->name('cost.store');
			Route::put('/{id}','CostController@update')->name('cost.update');
			Route::get('/{id}/edit', 'CostController@edit')->name('cost.edit');
			Route::get('/{id}', 'CostController@show')->name('cost.show');
		});
		Route::delete('cost_delete', 'CostController@destroy')->name('cost_delete');
	// Feedback
		Route::group(['prefix'=>'feedback'],function () {
			Route::get('/', 'FeedbackController@index')->name('feedback.index');
			Route::get('/{id}', 'FeedbackController@reply')->name('feedback.reply');
			Route::put('/{id}','FeedbackController@update')->name('feedback.update');
		});
	//Audits
		Route::get('audit','AuditController@index')->name('audit');
		Route::get('audit/{id}', 'AuditController@show')->name('audit.show');
	// Vote
		Route::group(['prefix'=>'vote'],function () {
			Route::get('/', 'VoteController@index')->name('vote.index');
			Route::get('/{id}', 'VoteController@show')->name('vote.show');
		});
	//Notification
		Route::get('notification/{id}', 'NotificationController@show')->name ('notification.show');
		Route::get('notificationHight/{id}', 'NotificationController@showHight')->name ('notification.showHight');














	});
});



