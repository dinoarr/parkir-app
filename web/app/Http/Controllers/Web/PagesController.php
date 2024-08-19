<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PagesController extends Controller
{
    public function admin() {
        return view('admin.dashboard');
    }

    public function user() {
        return view('user.dashboard');
    }
}
