@extends('layouts.app')

@section('title', 'NovelHub - Tác giả')

@section('content')
<div class="mb-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-2">Tác giả nổi bật</h1>
    <p class="text-gray-600">Khám phá các tác giả và truyện của họ.</p>
</div>

<!-- Authors Grid -->
<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
    <!-- Author Card 1 -->
    <div class="bg-white rounded-lg shadow-md p-6 text-center">
        <img src="https://via.placeholder.com/100x100" alt="Tác giả 1" class="w-24 h-24 rounded-full mx-auto mb-4">
        <h3 class="font-bold text-gray-800">Thiên Tàm Thổ Đậu</h3>
        <p class="text-sm text-gray-600">10 truyện</p>
    </div>

    <!-- Author Card 2 -->
    <div class="bg-white rounded-lg shadow-md p-6 text-center">
        <img src="https://via.placeholder.com/100x100" alt="Tác giả 2" class="w-24 h-24 rounded-full mx-auto mb-4">
        <h3 class="font-bold text-gray-800">Thần Đông</h3>
        <p class="text-sm text-gray-600">8 truyện</p>
    </div>

    <!-- Author Card 3 -->
    <div class="bg-white rounded-lg shadow-md p-6 text-center">
        <img src="https://via.placeholder.com/100x100" alt="Tác giả 3" class="w-24 h-24 rounded-full mx-auto mb-4">
        <h3 class="font-bold text-gray-800">Vong Ngữ</h3>
        <p class="text-sm text-gray-600">5 truyện</p>
    </div>

    <!-- Author Card 4 -->
    <div class="bg-white rounded-lg shadow-md p-6 text-center">
        <img src="https://via.placeholder.com/100x100" alt="Tác giả 4" class="w-24 h-24 rounded-full mx-auto mb-4">
        <h3 class="font-bold text-gray-800">Nhĩ Căn</h3>
        <p class="text-sm text-gray-600">7 truyện</p>
    </div>
</div>
@endsection