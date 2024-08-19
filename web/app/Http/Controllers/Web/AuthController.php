<?php


namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\WebUser;

class AuthController extends Controller
{
    public function indexLogin() {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:8',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::guard('web')->attempt($credentials, $request->remember)) {
            $request->session()->regenerate();

            $role = Auth::guard('web')->user()->role;
            if ($role === 'Administrator') {
                return redirect()->route('admin-dashboard')->with('success', 'You have successfully logged in');
            } elseif ($role === 'User') {
                return redirect()->route('user-dashboard')->with('success', 'You have successfully logged in');
            }
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }


    public function indexRegister() {
        return view('auth.register');
    }
    
    public function register(Request $request) 
    { 
        $request->validate([
            'username' => 'required',
            'email' => 'required|email|unique:web_users,email',
            'phone_number' => 'required|max:15',
            'password' => 'required|min:8',
        ]);

        $data = $request->all();
        $this->create($data);

        Auth::attempt(['email' => $data['email'], 'password' => $data['password']]);
        return redirect()->route('user-dashboard')->with('success', 'You have successfully registered');
    }

    protected function create(array $data)
    {
        return WebUser::create([
            'username' => $data['username'],
            'email' => $data['email'],
            'phone_number' => $data['phone_number'],
            'password' => Hash::make($data['password']),
            'role' => 'User',
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login-form')->with('success', 'You have been logged out');
    }
}
