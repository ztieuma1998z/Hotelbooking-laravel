<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use Illuminate\Support\Facades\Auth;    // Must Must use
use Illuminate\Support\Facades\Blade;   // Must Must use

use App\Repositories\RoomType\RoomTypeInterface;
use App\Repositories\RoomType\RoomTypeRepository;

use App\Repositories\Service\ServiceInterface;
use App\Repositories\Service\ServiceRepository;

use App\Repositories\Tag\TagInterface;
use App\Repositories\Tag\TagRepository;

use App\Repositories\Room\RoomInterface;
use App\Repositories\Room\RoomRepository;

use App\Repositories\User\UserInterface;
use App\Repositories\User\UserRepository;

use App\Repositories\Price\PriceInterface;
use App\Repositories\Price\PriceRepository;

use Illuminate\Support\Facades\Schema;
use App\Repositories\News\NewsInterface;
use App\Repositories\News\NewsRepository;

use App\Repositories\Cost\CostInterface;
use App\Repositories\Cost\CostRepository;

use App\Repositories\Admin\AdminInterface;
use App\Repositories\Admin\AdminRepository;

use App\Repositories\Booking\BookingInterface;
use App\Repositories\Booking\BookingRepository;

use App\Repositories\FeedBack\FeedBackInterface;
use App\Repositories\FeedBack\FeedBackRepository;

use App\Repositories\Vote\VoteInterface;
use App\Repositories\Vote\VoteRepository;

use App\Repositories\Notification\NotificationInterface;
use App\Repositories\Notification\NotificationRepository;

use App\Repositories\RoomImage\RoomImageInterface;
use App\Repositories\RoomImage\RoomImageRepository;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(
            RoomTypeInterface::class,
            RoomTypeRepository::class
        );
        $this->app->bind(
            ServiceInterface::class,
            ServiceRepository::class
        );
        $this->app->bind(
            TagInterface::class,
            TagRepository::class
        );
        $this->app->bind(
            RoomInterface::class,
            RoomRepository::class
        );
        $this->app->bind(
            UserInterface::class,
            UserRepository::class
        );
        $this->app->bind(
            PriceInterface::class,
            PriceRepository::class
        );
        $this->app->bind(
            NewsInterface::class,
            NewsRepository::class
        );
        $this->app->bind(
            CostInterface::class,
            CostRepository::class
        );
        $this->app->bind(
            AdminInterface::class,
            AdminRepository::class
        );
        $this->app->bind(
            BookingInterface::class,
            BookingRepository::class
        );
        $this->app->bind(
            FeedBackInterface::class,
            FeedBackRepository::class
        );
        $this->app->bind(
            VoteInterface::class,
            VoteRepository::class
        );
        $this->app->bind(
            NotificationInterface::class,
            NotificationRepository::class
        );
        $this->app->bind(
            RoomImageInterface::class,
            RoomImageRepository::class
        );
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
    }
}
