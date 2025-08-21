@extends('layouts.app')

@section('title', 'NovelHub - Chi tiết truyện')

@section('content')
<div class="bg-white rounded-lg shadow-md p-6">
    <div class="flex flex-col md:flex-row">
        <img src="https://via.placeholder.com/300x400" alt="Truyện 1" class="w-full md:w-1/4 object-cover rounded-lg mb-6 md:mb-0 md:mr-6">
        <div class="w-full md:w-3/4">
            <h1 class="text-3xl font-bold text-gray-800 mb-2">Đấu Phá Thương Khung</h1>
            <p class="text-gray-600 text-lg mb-4">Thiên Tàm Thổ Đậu</p>
            <div class="flex items-center mb-4">
                <span class="text-yellow-500">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </span>
                <span class="ml-2 text-gray-600">4.0 (1,234 đánh giá)</span>
            </div>
            <p class="text-gray-700 mb-6">Giới thiệu tóm tắt: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <div class="flex space-x-4">
                <a href="#" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-6 rounded-lg">Đọc từ đầu</a>
                <a href="#" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-6 rounded-lg">Thêm vào tủ sách</a>
            </div>
        </div>
    </div>

    <div class="mt-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Danh sách chương</h2>
        <ul class="space-y-2">
            <li><a href="{{ route('chapter') }}" class="block hover:bg-gray-100 p-2 rounded-lg">Chương 1: Oan gia ngõ hẹp</a></li>
            <li><a href="{{ route('chapter') }}" class="block hover:bg-gray-100 p-2 rounded-lg">Chương 2: Hệ thống thức tỉnh</a></li>
            <li><a href="{{ route('chapter') }}" class="block hover:bg-gray-100 p-2 rounded-lg">Chương 3: Lên cấp</a></li>
        </ul>
    </div>
</div>
@endsection