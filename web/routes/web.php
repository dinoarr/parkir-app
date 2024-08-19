<?php

use App\Http\Controllers\Web\AuthController;
use App\Http\Controllers\Web\PagesController;
use Illuminate\Support\Facades\Route;

// Public routes
Route::get('/', function () {
    return view('landingPage');
});

Route::get('/about', function () {
    return view('pages.about');
});

Route::get('/contact', function () {
    return view('pages.contact');
});

// Authentication routes
Route::get('/login', [AuthController::class, 'indexLogin'])->name('login-form');
Route::post('/login', [AuthController::class, 'login'])->name('login');
Route::get('/register', [AuthController::class, 'indexRegister'])->name('register-form');
Route::post('/register', [AuthController::class, 'register'])->name('register');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Dashboard routes
Route::get('/admin-dashboard', [PagesController::class, 'admin'])->name('admin-dashboard');
Route::get('/user-dashboard', [PagesController::class, 'user'])->name('user-dashboard');
