@extends('layouts.app')

@section('title', 'NovelHub - Xếp hạng')

@section('content')
<div class="mb-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-2">Xếp hạng truyện</h1>
    <p class="text-gray-600">Bảng xếp hạng các truyện hot nhất theo ngày, tuần, tháng.</p>
</div>

<!-- Ranking List -->
<div class="bg-white rounded-lg shadow-md p-6">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-xl font-bold text-gray-800">Top 10 truyện đọc nhiều nhất</h2>
        <div class="flex space-x-2">
            <button class="bg-blue-500 text-white px-4 py-2 rounded-full text-sm font-medium">Ngày</button>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-full text-sm font-medium">Tuần</button>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-full text-sm font-medium">Tháng</button>
        </div>
    </div>

    <ul class="space-y-4">
        <li class="flex items-center space-x-4">
            <div class="text-2xl font-bold text-gray-400">1</div>
            <img src="https://via.placeholder.com/60x80" alt="Truyện 1" class="w-12 h-16 object-cover rounded">
            <div>
                <h3 class="font-bold text-gray-800">Đấu Phá Thương Khung</h3>
                <p class="text-sm text-gray-600">Thiên Tàm Thổ Đậu</p>
            </div>
            <div class="ml-auto text-sm text-gray-500"><i class="fas fa-eye mr-1"></i> 2.4M</div>
        </li>
        <li class="flex items-center space-x-4">
            <div class="text-2xl font-bold text-gray-400">2</div>
            <img src="https://via.placeholder.com/60x80" alt="Truyện 2" class="w-12 h-16 object-cover rounded">
            <div>
                <h3 class="font-bold text-gray-800">Thần Mộ</h3>
                <p class="text-sm text-gray-600">Thần Đông</p>
            </div>
            <div class="ml-auto text-sm text-gray-500"><i class="fas fa-eye mr-1"></i> 2.1M</div>
        </li>
        <li class="flex items-center space-x-4">
            <div class="text-2xl font-bold text-gray-400">3</div>
            <img src="https://via.placeholder.com/60x80" alt="Truyện 3" class="w-12 h-16 object-cover rounded">
            <div>
                <h3 class="font-bold text-gray-800">Phàm Nhân Tu Tiên</h3>
                <p class="text-sm text-gray-600">Vong Ngữ</p>
            </div>
            <div class="ml-auto text-sm text-gray-500"><i class="fas fa-eye mr-1"></i> 3.5M</div>
        </li>
    </ul>
</div>
@endsection