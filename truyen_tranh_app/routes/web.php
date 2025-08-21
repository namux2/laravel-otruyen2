<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AdminController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PageController::class, 'index'])->name('index');
Route::get('/author', [PageController::class, 'author'])->name('author');
Route::get('/category', [PageController::class, 'category'])->name('category');
Route::get('/chapter', [PageController::class, 'chapter'])->name('chapter');
// Auth Routes
Route::middleware('guest')->group(function () {
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login'])->name('login.post');
    Route::get('/register', [AuthController::class, 'showRegister'])->name('register');
    Route::post('/register', [AuthController::class, 'register'])->name('register.post');
    Route::get('/forgot-password', [AuthController::class, 'showForgotPassword'])->name('password.request');
    Route::post('/forgot-password', [AuthController::class, 'forgotPassword'])->name('password.email');
    Route::get('/reset-password/{token}', [AuthController::class, 'showResetPassword'])->name('password.reset');
    Route::post('/reset-password', [AuthController::class, 'resetPassword'])->name('password.update');
});

Route::middleware('auth')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
    Route::get('/email/verify', function () {
        return view('auth.verify-email');
    })->name('verification.notice');
    Route::get('/email/verify/{id}/{hash}', [AuthController::class, 'verifyEmail'])->middleware(['signed'])->name('verification.verify');
    Route::post('/email/verification-notification', [AuthController::class, 'resendVerificationEmail'])->middleware(['throttle:6,1'])->name('verification.send');
    
    // Profile routes
    Route::get('/profile', [ProfileController::class, 'show'])->name('profile');
    Route::put('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::post('/profile/avatar', [ProfileController::class, 'updateAvatar'])->name('profile.avatar');
    Route::post('/profile/password', [ProfileController::class, 'updatePassword'])->name('profile.password');
    
    // Profile API routes
    Route::get('/profile/followed-novels', [ProfileController::class, 'getFollowedNovels'])->name('profile.followed-novels');
    Route::get('/profile/reading-history', [ProfileController::class, 'getReadingHistory'])->name('profile.reading-history');
    Route::post('/profile/toggle-follow', [ProfileController::class, 'toggleFollowNovel'])->name('profile.toggle-follow');
    Route::delete('/profile/remove-history', [ProfileController::class, 'removeFromHistory'])->name('profile.remove-history');
});

// Admin routes
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');
    Route::get('/users', [AdminController::class, 'users'])->name('users');
    Route::get('/novels', [AdminController::class, 'novels'])->name('novels');
    Route::get('/categories', [AdminController::class, 'categories'])->name('categories');
    Route::get('/chapters', [AdminController::class, 'chapters'])->name('chapters');
    Route::get('/comments', [AdminController::class, 'comments'])->name('comments');
    Route::get('/reports', [AdminController::class, 'reports'])->name('reports');
    Route::get('/settings', [AdminController::class, 'settings'])->name('settings');
    
    // Admin API routes
    Route::get('/stats', [AdminController::class, 'getStats'])->name('stats');
    Route::get('/chart-data', [AdminController::class, 'getChartData'])->name('chart-data');
});

Route::get('/novel-details', [PageController::class, 'novelDetails'])->name('novel-details');
Route::get('/profile', [PageController::class, 'profile'])->name('profile');
Route::get('/ranking', [PageController::class, 'ranking'])->name('ranking');
Route::get('/search', [PageController::class, 'search'])->name('search');
Route::get('/test-cowl', [PageController::class, 'testCowl'])->name('test-cowl');
