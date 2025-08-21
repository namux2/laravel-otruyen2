@extends('layouts.app')

@section('title', 'NovelHub - Hồ sơ cá nhân')

@section('content')
<div class="container mx-auto px-4 py-8">
    <!-- Profile Header -->
    <div class="bg-white rounded-lg shadow-md p-6 mb-8">
        <div class="flex items-center justify-between">
            <div class="flex items-center space-x-6">
                <div class="relative">
                    <img src="{{ Auth::user()->avatar ?? 'https://via.placeholder.com/120x120' }}" 
                         alt="Avatar" 
                         class="w-24 h-24 rounded-full object-cover border-4 border-blue-200">
                    <button class="absolute bottom-0 right-0 bg-blue-500 text-white p-2 rounded-full hover:bg-blue-600 transition duration-200">
                        <i class="fas fa-camera text-sm"></i>
                    </button>
                </div>
                <div>
                    <h1 class="text-2xl font-bold text-gray-800">{{ Auth::user()->name }}</h1>
                    <p class="text-gray-600">{{ Auth::user()->email }}</p>
                    <p class="text-sm text-gray-500">Thành viên từ {{ Auth::user()->created_at->format('d/m/Y') }}</p>
                    @if(Auth::user()->is_admin)
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-purple-100 text-purple-800 mt-2">
                            <i class="fas fa-crown mr-1"></i>
                            Quản trị viên
                        </span>
                    @endif
                </div>
            </div>
            
            <!-- Admin Navigation Buttons -->
            @if(Auth::user()->is_admin)
                <div class="flex flex-col space-y-3">
                    <a href="{{ route('admin.dashboard') }}" 
                       class="inline-flex items-center px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 transition duration-200">
                        <i class="fas fa-tachometer-alt mr-2"></i>
                        Dashboard Admin
                    </a>
                    <div class="flex space-x-2">
                        <a href="{{ route('admin.users') }}" 
                           class="inline-flex items-center px-3 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-200 text-sm">
                            <i class="fas fa-users mr-1"></i>
                            Quản lý User
                        </a>
                        <a href="{{ route('admin.novels') }}" 
                           class="inline-flex items-center px-3 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition duration-200 text-sm">
                            <i class="fas fa-book mr-1"></i>
                            Quản lý Truyện
                        </a>
                        <a href="{{ route('admin.categories') }}" 
                           class="inline-flex items-center px-3 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition duration-200 text-sm">
                            <i class="fas fa-tags mr-1"></i>
                            Quản lý Thể loại
                        </a>
                    </div>
                </div>
            @endif
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Left Column - Profile Settings -->
        <div class="lg:col-span-1 space-y-6">
            <!-- Avatar Upload -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Cập nhật Avatar</h3>
                <form action="{{ route('profile.avatar') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Chọn ảnh</label>
                        <input type="file" name="avatar" accept="image/*" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <button type="submit" class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition duration-200">
                        Cập nhật Avatar
                    </button>
                </form>
            </div>

            <!-- Personal Information -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Thông tin cá nhân</h3>
                <form action="{{ route('profile.update') }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Họ và tên</label>
                        <input type="text" name="name" value="{{ Auth::user()->name }}" 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                        <input type="email" name="email" value="{{ Auth::user()->email }}" 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Ngày sinh</label>
                        <input type="date" name="birth_date" value="{{ Auth::user()->birth_date ?? '' }}" 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Giới tính</label>
                        <select name="gender" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">Chọn giới tính</option>
                            <option value="male" {{ Auth::user()->gender == 'male' ? 'selected' : '' }}>Nam</option>
                            <option value="female" {{ Auth::user()->gender == 'female' ? 'selected' : '' }}>Nữ</option>
                            <option value="other" {{ Auth::user()->gender == 'other' ? 'selected' : '' }}>Khác</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600 transition duration-200">
                        Cập nhật thông tin
                    </button>
                </form>
            </div>

            <!-- Change Password -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Đổi mật khẩu</h3>
                <form action="{{ route('profile.password') }}" method="POST">
                    @csrf
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mật khẩu hiện tại</label>
                        <input type="password" name="current_password" 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mật khẩu mới</label>
                        <input type="password" name="new_password" 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Xác nhận mật khẩu mới</label>
                        <input type="password" name="new_password_confirmation" 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <button type="submit" class="w-full bg-yellow-500 text-white py-2 px-4 rounded-md hover:bg-yellow-600 transition duration-200">
                        Đổi mật khẩu
                    </button>
                </form>
            </div>
        </div>

        <!-- Right Column - Reading History & Followed Novels -->
        <div class="lg:col-span-2 space-y-6">
            <!-- Followed Novels -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Truyện đang theo dõi</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <!-- Followed Novel Item -->
                    <div class="flex items-center space-x-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <img src="https://via.placeholder.com/60x80" alt="Novel" class="w-12 h-16 object-cover rounded">
                        <div class="flex-1">
                            <h4 class="font-medium text-gray-800">Đấu Phá Thương Khung</h4>
                            <p class="text-sm text-gray-600">Chương 1500</p>
                            <div class="flex items-center space-x-2 mt-1">
                                <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded">Đang theo dõi</span>
                                <button class="text-xs text-red-600 hover:text-red-800">Bỏ theo dõi</button>
                            </div>
                        </div>
                    </div>

                    <div class="flex items-center space-x-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <img src="https://via.placeholder.com/60x80" alt="Novel" class="w-12 h-16 object-cover rounded">
                        <div class="flex-1">
                            <h4 class="font-medium text-gray-800">Toàn Chức Cao Thủ</h4>
                            <p class="text-sm text-gray-600">Chương 1200</p>
                            <div class="flex items-center space-x-2 mt-1">
                                <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded">Đang theo dõi</span>
                                <button class="text-xs text-red-600 hover:text-red-800">Bỏ theo dõi</button>
                            </div>
                        </div>
                    </div>

                    <div class="flex items-center space-x-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <img src="https://via.placeholder.com/60x80" alt="Novel" class="w-12 h-16 object-cover rounded">
                        <div class="flex-1">
                            <h4 class="font-medium text-gray-800">Thần Đạo Đan Tôn</h4>
                            <p class="text-sm text-gray-600">Chương 800</p>
                            <div class="flex items-center space-x-2 mt-1">
                                <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded">Đang theo dõi</span>
                                <button class="text-xs text-red-600 hover:text-red-800">Bỏ theo dõi</button>
                            </div>
                        </div>
                    </div>

                    <div class="flex items-center space-x-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <img src="https://via.placeholder.com/60x80" alt="Novel" class="w-12 h-16 object-cover rounded">
                        <div class="flex-1">
                            <h4 class="font-medium text-gray-800">Ma Thổi Đèn</h4>
                            <p class="text-sm text-gray-600">Chương 600</p>
                            <div class="flex items-center space-x-2 mt-1">
                                <span class="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded">Đang theo dõi</span>
                                <button class="text-xs text-red-600 hover:text-red-800">Bỏ theo dõi</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Reading History -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Lịch sử đọc truyện</h3>
                <div class="space-y-3">
                    <!-- History Item -->
                    <div class="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <div class="flex items-center space-x-3">
                            <img src="https://via.placeholder.com/50x65" alt="Novel" class="w-10 h-13 object-cover rounded">
                            <div>
                                <h4 class="font-medium text-gray-800">Đấu Phá Thương Khung</h4>
                                <p class="text-sm text-gray-600">Chương 1500 - 2 giờ trước</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2">
                            <button class="text-blue-600 hover:text-blue-800 text-sm">Tiếp tục đọc</button>
                            <button class="text-gray-400 hover:text-gray-600">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>

                    <div class="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <div class="flex items-center space-x-3">
                            <img src="https://via.placeholder.com/50x65" alt="Novel" class="w-10 h-13 object-cover rounded">
                            <div>
                                <h4 class="font-medium text-gray-800">Toàn Chức Cao Thủ</h4>
                                <p class="text-sm text-gray-600">Chương 1200 - 5 giờ trước</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2">
                            <button class="text-blue-600 hover:text-blue-800 text-sm">Tiếp tục đọc</button>
                            <button class="text-gray-400 hover:text-gray-600">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>

                    <div class="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <div class="flex items-center space-x-3">
                            <img src="https://via.placeholder.com/50x65" alt="Novel" class="w-10 h-13 object-cover rounded">
                            <div>
                                <h4 class="font-medium text-gray-800">Thần Đạo Đan Tôn</h4>
                                <p class="text-sm text-gray-600">Chương 800 - 1 ngày trước</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2">
                            <button class="text-blue-600 hover:text-blue-800 text-sm">Tiếp tục đọc</button>
                            <button class="text-gray-400 hover:text-gray-600">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>

                    <div class="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition duration-200">
                        <div class="flex items-center space-x-3">
                            <img src="https://via.placeholder.com/50x65" alt="Novel" class="w-10 h-13 object-cover rounded">
                            <div>
                                <h4 class="font-medium text-gray-800">Ma Thổi Đèn</h4>
                                <p class="text-sm text-gray-600">Chương 600 - 2 ngày trước</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2">
                            <button class="text-blue-600 hover:text-blue-800 text-sm">Tiếp tục đọc</button>
                            <button class="text-gray-400 hover:text-gray-600">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Admin Quick Stats Section -->
    @if(Auth::user()->is_admin)
        <div class="bg-white rounded-lg shadow-md p-6 mt-8">
            <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
                <i class="fas fa-chart-bar text-purple-600 mr-2"></i>
                Thống kê nhanh (Admin)
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div class="bg-blue-50 p-4 rounded-lg border border-blue-200">
                    <div class="flex items-center">
                        <div class="p-2 bg-blue-500 rounded-lg">
                            <i class="fas fa-users text-white"></i>
                        </div>
                        <div class="ml-3">
                            <p class="text-sm font-medium text-blue-600">Tổng User</p>
                            <p class="text-lg font-semibold text-blue-900">{{ \App\Models\User::count() }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-green-50 p-4 rounded-lg border border-green-200">
                    <div class="flex items-center">
                        <div class="p-2 bg-green-500 rounded-lg">
                            <i class="fas fa-book text-white"></i>
                        </div>
                        <div class="ml-3">
                            <p class="text-sm font-medium text-green-600">Tổng Truyện</p>
                            <p class="text-lg font-semibold text-green-900">{{ \App\Models\Novel::count() }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-yellow-50 p-4 rounded-lg border border-yellow-200">
                    <div class="flex items-center">
                        <div class="p-2 bg-yellow-500 rounded-lg">
                            <i class="fas fa-list-ol text-white"></i>
                        </div>
                        <div class="ml-3">
                            <p class="text-sm font-medium text-yellow-600">Tổng Chương</p>
                            <p class="text-lg font-semibold text-yellow-900">{{ \App\Models\Chapter::count() }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-purple-50 p-4 rounded-lg border border-purple-200">
                    <div class="flex items-center">
                        <div class="p-2 bg-purple-500 rounded-lg">
                            <i class="fas fa-comments text-white"></i>
                        </div>
                        <div class="ml-3">
                            <p class="text-sm font-medium text-purple-600">Tổng Bình luận</p>
                            <p class="text-lg font-semibold text-purple-900">{{ \App\Models\Comment::count() }}</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mt-6 flex justify-center">
                <a href="{{ route('admin.dashboard') }}" 
                   class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-purple-600 to-blue-600 text-white rounded-lg hover:from-purple-700 hover:to-blue-700 transition duration-200 font-medium">
                    <i class="fas fa-arrow-right mr-2"></i>
                    Xem Dashboard Admin đầy đủ
                </a>
            </div>
        </div>
    @endif
</div>
@endsection