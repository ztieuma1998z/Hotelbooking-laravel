<?php

namespace App\Http\Controllers\Client;

use App\Http\Requests\RegistrationRequest;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Laravel\Passport\TokenRepository;
use Session;
use Socialite;
use Exception;
use App\Models\User;

class RegistrationController extends Controller
{
    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */

    protected $redirectTo = '/';
    public function view()
    {
        return view('client.auth.register');
    }

   
}