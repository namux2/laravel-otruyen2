@extends('layouts.app')

@section('title', 'NovelHub - Đăng nhập')

@section('content')
<div class="flex justify-center items-center min-h-screen py-12">
    <div class="bg-white rounded-lg shadow-lg p-8 w-full max-w-md">
        <div class="text-center mb-8">
            <i class="fas fa-book-open text-blue-500 text-4xl mb-4"></i>
            <h1 class="text-3xl font-bold text-gray-800">Đăng nhập</h1>
            <p class="text-gray-600 mt-2">Chào mừng bạn trở lại với NovelHub</p>
        </div>

        @if(session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        @if($errors->any())
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                <ul class="list-disc list-inside">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form method="POST" action="{{ route('login.post') }}">
            @csrf
            <div class="mb-6">
                <label for="email" class="block text-gray-700 font-medium mb-2">Email</label>
                <input type="email" id="email" name="email" value="{{ old('email') }}" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập email của bạn" required>
            </div>
            
            <div class="mb-6">
                <label for="password" class="block text-gray-700 font-medium mb-2">Mật khẩu</label>
                <input type="password" id="password" name="password" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập mật khẩu" required>
            </div>
            
            <div class="flex items-center justify-between mb-6">
                <label class="flex items-center">
                    <input type="checkbox" name="remember" class="rounded border-gray-300 text-blue-600 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50">
                    <span class="ml-2 text-sm text-gray-600">Ghi nhớ đăng nhập</span>
                </label>
                <a href="{{ route('password.request') }}" class="text-sm text-blue-500 hover:text-blue-700 hover:underline">
                    Quên mật khẩu?
                </a>
            </div>
            
            <button type="submit" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-4 rounded-lg transition duration-200 transform hover:scale-105">
                Đăng nhập
            </button>
        </form>
        
        <div class="text-center mt-6">
            <p class="text-gray-600">Chưa có tài khoản? 
                <a href="{{ route('register') }}" class="text-blue-500 hover:text-blue-700 font-medium hover:underline">
                    Đăng ký ngay
                </a>
            </p>
        </div>
    </div>
</div>
@endsection
