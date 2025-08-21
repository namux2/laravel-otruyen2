@extends('layouts.app')

@section('title', 'NovelHub - Đăng ký')

@section('content')
<div class="flex justify-center items-center min-h-screen py-12">
    <div class="bg-white rounded-lg shadow-lg p-8 w-full max-w-md">
        <div class="text-center mb-8">
            <i class="fas fa-user-plus text-blue-500 text-4xl mb-4"></i>
            <h1 class="text-3xl font-bold text-gray-800">Đăng ký tài khoản</h1>
            <p class="text-gray-600 mt-2">Tham gia cộng đồng NovelHub ngay hôm nay</p>
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

        <form method="POST" action="{{ route('register.post') }}">
            @csrf
            <div class="mb-6">
                <label for="name" class="block text-gray-700 font-medium mb-2">Họ và tên</label>
                <input type="text" id="name" name="name" value="{{ old('name') }}" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập họ và tên của bạn" required>
            </div>
            
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
                       placeholder="Nhập mật khẩu (tối thiểu 6 ký tự)" required>
            </div>
            
            <div class="mb-6">
                <label for="password_confirmation" class="block text-gray-700 font-medium mb-2">Xác nhận mật khẩu</label>
                <input type="password" id="password_confirmation" name="password_confirmation" 
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                       placeholder="Nhập lại mật khẩu" required>
            </div>
            
            <button type="submit" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-4 rounded-lg transition duration-200 transform hover:scale-105">
                Đăng ký
            </button>
        </form>
        
        <div class="text-center mt-6">
            <p class="text-gray-600">Đã có tài khoản? 
                <a href="{{ route('login') }}" class="text-blue-500 hover:text-blue-700 font-medium hover:underline">
                    Đăng nhập ngay
                </a>
            </p>
        </div>
    </div>
</div>
@endsection
