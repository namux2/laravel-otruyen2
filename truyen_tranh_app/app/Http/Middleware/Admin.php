<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        // Kiểm tra xem user có phải là admin không
        // Có thể thêm field 'role' vào bảng users hoặc tạo bảng riêng
        if (!Auth::user()->is_admin) {
            return redirect('/')->with('error', 'Bạn không có quyền truy cập trang admin!');
        }

        return $next($request);
    }
}
