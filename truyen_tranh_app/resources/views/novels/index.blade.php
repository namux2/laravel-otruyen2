@extends('layouts.app')

@section('title', 'Danh sách truyện')

@section('content')
<div class="container mx-auto px-4 py-8">
    <h1 class="text-2xl font-bold mb-4">Danh sách truyện</h1>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        @forelse($novels as $novel)
            <div class="bg-white p-4 rounded shadow">
                <h2 class="font-semibold">{{ $novel->title }}</h2>
                <p class="text-sm text-gray-600">{{ \Illuminate\Support\Str::limit($novel->description, 100) }}</p>
            </div>
        @empty
            <p>Chưa có truyện nào.</p>
        @endforelse
    </div>
    <div class="mt-4">
        {{ $novels->links() }}
    </div>
</div>
@endsection

