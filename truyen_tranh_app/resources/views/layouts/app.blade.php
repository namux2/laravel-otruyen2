<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'NovelHub')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100 font-sans">
    <!-- Header -->
    <header class="bg-white shadow-md sticky top-0 z-40">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fas fa-book-open text-blue-500 text-2xl"></i>
                <a href="{{ route('index') }}" class="text-xl font-bold text-gray-800">NovelHub</a>
            </div>
            
            <div class="hidden md:flex space-x-6">
                <a href="{{ route('index') }}" class="text-gray-700 hover:text-blue-500 font-medium">Trang chủ</a>
                <a href="{{ route('category') }}" class="text-gray-700 hover:text-blue-500 font-medium">Thể loại</a>
                <a href="{{ route('ranking') }}" class="text-gray-700 hover:text-blue-500 font-medium">Xếp hạng</a>
                <a href="{{ route('author') }}" class="text-gray-700 hover:text-blue-500 font-medium">Tác giả</a>
            </div>
            
            <div class="flex items-center space-x-4">
                <div class="relative">
                    <input type="text" id="search-input" placeholder="Tìm truyện..." class="pl-10 pr-4 py-2 rounded-full border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent w-40 md:w-64">
                    <i class="fas fa-search absolute left-3 top-2.5 text-gray-400" onclick="search()"></i>
                </div>
                <button class="md:hidden text-gray-700">
                    <i class="fas fa-bars text-xl"></i>
                </button>
                <div class="hidden md:flex space-x-2">
                    @guest
                        <a id="login-button" href="{{ route('login') }}" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full text-sm font-medium">Đăng nhập</a>
                        <a id="register-button" href="{{ route('register') }}" class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-full text-sm font-medium">Đăng ký</a>
                    @else
                        <div class="flex items-center space-x-4">
                            <a href="{{ route('profile') }}" class="text-gray-700 hover:text-blue-500 font-medium">
                                <i class="fas fa-user"></i>
                            </a>
                            <form method="POST" action="{{ route('logout') }}" class="inline">
                                @csrf
                                <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-full text-sm font-medium">
                                    Đăng xuất
                                </button>
                            </form>
                        </div>
                    @endguest
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">
        @if(session('success'))
            <x-alert type="success" :message="session('success')" />
        @endif

        @if(session('error'))
            <x-alert type="error" :message="session('error')" />
        @endif

        @yield('content')
    </main>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white pt-12 pb-6">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
                <div>
                    <h3 class="text-xl font-bold mb-4 flex items-center">
                        <i class="fas fa-book-open mr-2"></i> NovelHub
                    </h3>
                    <p class="text-gray-400">Nền tảng đọc truyện online hàng đầu với kho truyện phong phú đa dạng thể loại.</p>
                </div>
                
                <div>
                    <h4 class="font-bold mb-4">Thể loại</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Tiên Hiệp</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Huyền Huyễn</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Ngôn Tình</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Đô Thị</a></li>
                    </ul>
                </div>
                
                <div>
                    <h4 class="font-bold mb-4">Hỗ trợ</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Hướng dẫn</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Câu hỏi thường gặp</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Điều khoản</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white transition">Bảo mật</a></li>
                    </ul>
                </div>
                
                <div>
                    <h4 class="font-bold mb-4">Liên hệ</h4>
                    <div class="flex space-x-4 mb-4">
                        <a href="#" class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-blue-600 transition">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-pink-600 transition">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-blue-400 transition">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </div>
                    <p class="text-gray-400">Email: support@novelhub.com</p>
                </div>
            </div>
            
            <div class="border-t border-gray-700 pt-6 text-center text-gray-400">
                <p>© 2023 NovelHub. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Back to Top Button -->
    <button id="back-to-top" class="fixed bottom-6 right-6 bg-blue-500 text-white w-12 h-12 rounded-full shadow-lg flex items-center justify-center opacity-0 invisible transition-all duration-300">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    <script src="{{ asset('js/notifications.js') }}"></script>
    <script src="{{ asset('js/profile.js') }}"></script>
    @yield('scripts')
</body>
</html>