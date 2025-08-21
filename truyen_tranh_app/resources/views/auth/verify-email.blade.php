@extends('layouts.app')

@section('title', 'NovelHub - Xác thực Email')

@section('content')
<div class="flex justify-center items-center min-h-screen py-12">
    <div class="bg-white rounded-lg shadow-lg p-8 w-full max-w-md">
        <div class="text-center mb-8">
            <i class="fas fa-envelope text-blue-500 text-4xl mb-4"></i>
            <h1 class="text-3xl font-bold text-gray-800">Xác thực Email</h1>
            <p class="text-gray-600 mt-2">Vui lòng xác thực địa chỉ email của bạn</p>
        </div>

        @if(session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        <div class="bg-blue-50 border border-blue-200 text-blue-700 px-4 py-3 rounded mb-6">
            <p class="text-sm">
                Chúng tôi đã gửi email xác thực đến <strong>{{ auth()->user()->email }}</strong>. 
                Vui lòng kiểm tra hộp thư và nhấp vào link xác thực.
            </p>
        </div>

        <div class="text-center">
            <p class="text-gray-600 mb-4">Không nhận được email?</p>
            
            <form method="POST" action="{{ route('verification.send') }}">
                @csrf
                <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-lg transition duration-200">
                    Gửi lại email xác thực
                </button>
            </form>
        </div>
        
        <div class="text-center mt-6">
            <p class="text-gray-600">
                <a href="{{ route('logout') }}" class="text-blue-500 hover:text-blue-700 font-medium hover:underline">
                    Đăng xuất
                </a>
            </p>
        </div>
    </div>
</div>
@endsection
