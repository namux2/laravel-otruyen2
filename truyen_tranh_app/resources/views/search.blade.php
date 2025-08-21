@extends('layouts.app')

@section('title', 'NovelHub - Tìm kiếm')

@section('content')
<div class="mb-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-2">Kết quả tìm kiếm cho "<span id="search-query"></span>"</h1>
</div>

<!-- Novels Grid -->
<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
    <!-- Search results will be dynamically inserted here -->
</div>
@endsection

@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        const query = urlParams.get('q');
        document.getElementById('search-query').textContent = query;
    });
</script>
@endsection