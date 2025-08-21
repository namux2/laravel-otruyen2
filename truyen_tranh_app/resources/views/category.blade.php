@extends('layouts.app')

@section('title', 'NovelHub - Thể loại')

@section('content')
<div class="mb-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-2">Thể loại truyện</h1>
    <p class="text-gray-600">Khám phá truyện theo từng thể loại yêu thích của bạn.</p>
</div>

<!-- Categories Grid -->
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
    <a href="#" class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition duration-300 text-center">
        <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-2">
            <i class="fas fa-fire text-red-500 text-xl"></i>
        </div>
        <h3 class="font-medium text-gray-800">Tiên Hiệp</h3>
        <p class="text-xs text-gray-500">1,200 truyện</p>
    </a>
    
    <a href="#" class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition duration-300 text-center">
        <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-2">
            <i class="fas fa-dragon text-blue-500 text-xl"></i>
        </div>
        <h3 class="font-medium text-gray-800">Huyền Huyễn</h3>
        <p class="text-xs text-gray-500">980 truyện</p>
    </a>
    
    <a href="#" class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition duration-300 text-center">
        <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-2">
            <i class="fas fa-user-ninja text-green-500 text-xl"></i>
        </div>
        <h3 class="font-medium text-gray-800">Võ Hiệp</h3>
        <p class="text-xs text-gray-500">750 truyện</p>
    </a>
    
    <a href="#" class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition duration-300 text-center">
        <div class="w-12 h-12 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-2">
            <i class="fas fa-heart text-yellow-500 text-xl"></i>
        </div>
        <h3 class="font-medium text-gray-800">Ngôn Tình</h3>
        <p class="text-xs text-gray-500">1,500 truyện</p>
    </a>
    
    <a href="#" class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition duration-300 text-center">
        <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center mx-auto mb-2">
            <i class="fas fa-ghost text-purple-500 text-xl"></i>
        </div>
        <h3 class="font-medium text-gray-800">Kinh Dị</h3>
        <p class="text-xs text-gray-500">320 truyện</p>
    </a>
    
    <a href="#" class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition duration-300 text-center">
        <div class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center mx-auto mb-2">
            <i class="fas fa-atom text-indigo-500 text-xl"></i>
        </div>
        <h3 class="font-medium text-gray-800">Khoa Huyễn</h3>
        <p class="text-xs text-gray-500">450 truyện</p>
    </a>
</div>
@endsection