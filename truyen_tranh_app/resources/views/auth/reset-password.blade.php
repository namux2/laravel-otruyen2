@extends('layouts.app')

@section('title', 'NovelHub - Đặt lại mật khẩu')

@section('content')
<div class="flex justify-center items-center min-h-screen py-12">
    <div class="bg-white rounded-lg shadow-lg p-8 w-full max-w-md">
        <div class="text-center mb-8">
            <i class="fas fa-lock text-blue-500 text-4xl mb-4"></i>
            <h1 class="text-3xl font-bold text-gray-800">Đặt lại mật khẩu</h1>
            <p class="text-gray-600 mt-2">Nhập mật khẩu mới cho tài khoản của bạn</p>
        </div>

        @if($errors->any())
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                <ul class="list-disc list-inside">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form method="POST" action="{{ route('password.update') }}">
            @csrf
            <input type="hidden" name="token" value="{{ $token }}">
            
            <div class="mb-6">
                <label for="email" class="block text-gray-700 font-medium mb-2">Email</label>
                <input type="email" id="email" name="email" value="{{ $email ?? old('email') }}" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập email của bạn" required>
            </div>
            
            <div class="mb-6">
                <label for="password" class="block text-gray-700 font-medium mb-2">Mật khẩu mới</label>
                <input type="password" id="password" name="password" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập mật khẩu mới (tối thiểu 6 ký tự)" required>
            </div>
            
            <div class="mb-6">
                <label for="password_confirmation" class="block text-gray-700 font-medium mb-2">Xác nhận mật khẩu mới</label>
                <input type="password" id="password_confirmation" name="password_confirmation" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập lại mật khẩu mới" required>
            </div>
            
            <button type="submit" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-4 rounded-lg transition duration-200 transform hover:scale-105">
                Đặt lại mật khẩu
            </button>
        </form>
        
        <div class="text-center mt-6">
            <p class="text-gray-600">
                <a href="{{ route('login') }}" class="text-blue-500 hover:text-blue-700 font-medium hover:underline">
                    ← Quay lại đăng nhập
                </a>
            </p>
        </div>
    </div>
</div>
@endsection
