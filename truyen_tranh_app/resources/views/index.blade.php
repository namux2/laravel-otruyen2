@extends('layouts.app')

@section('title', 'NovelHub - Đọc truyện online')

@section('content')
<!-- Cowl (Màn hình chào) -->
<div id="cowl" class="fixed inset-0 z-50 flex items-center justify-center cowl-overlay cowl-animation">
    <div class="text-center p-8 max-w-2xl">
        <div class="flex justify-center mb-6">
            <div class="w-24 h-24 bg-blue-500 rounded-full flex items-center justify-center shadow-lg">
                <i class="fas fa-book-open text-white text-4xl"></i>
            </div>
        </div>
        <h1 class="text-4xl md:text-5xl font-bold text-white mb-4">Chào mừng đến với NovelHub</h1>
        <p class="text-xl text-gray-200 mb-8">Kho truyện online lớn nhất với hàng ngàn tác phẩm đa dạng thể loại</p>
        <button id="enter-site" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-8 rounded-full text-lg transition duration-300 transform hover:scale-105">
            Bắt đầu khám phá
        </button>
    </div>
</div>

<!-- Hero Section -->
<section class="bg-gradient-to-r from-blue-500 to-purple-600 text-white py-16">
    <div class="container mx-auto px-4">
        <div class="flex flex-col md:flex-row items-center">
            <div class="md:w-1/2 mb-8 md:mb-0">
                <h2 class="text-4xl md:text-5xl font-bold mb-4">Đọc truyện mọi lúc, mọi nơi</h2>
                <p class="text-xl mb-6">Hơn 10,000 truyện đa dạng thể loại được cập nhật hàng ngày</p>
                <div class="flex space-x-4">
                    <button class="bg-white text-blue-600 hover:bg-gray-100 px-6 py-3 rounded-full font-bold shadow-lg transition duration-300 transform hover:scale-105">
                        <i class="fas fa-fire mr-2"></i> Truyện hot
                    </button>
                    <button class="bg-transparent border-2 border-white hover:bg-white hover:text-blue-600 px-6 py-3 rounded-full font-bold shadow-lg transition duration-300 transform hover:scale-105">
                        <i class="fas fa-star mr-2"></i> Truyện mới
                    </button>
                </div>
            </div>
            <div class="md:w-1/2 flex justify-center">
                <div class="relative w-full max-w-md">
                    <div class="absolute -top-6 -left-6 w-32 h-32 bg-yellow-400 rounded-lg opacity-20"></div>
                    <div class="absolute -bottom-6 -right-6 w-32 h-32 bg-pink-400 rounded-lg opacity-20"></div>
                    <div class="relative bg-white bg-opacity-20 backdrop-filter backdrop-blur-lg rounded-xl overflow-hidden shadow-2xl">
                        <img src="https://via.placeholder.com/500x300" alt="Truyện nổi bật" class="w-full h-auto">
                        <div class="p-4">
                            <h3 class="text-xl font-bold mb-2">Thiên Tài Trở Về Từ Địa Ngục</h3>
                            <div class="flex justify-between items-center">
                                <span class="text-sm"><i class="fas fa-eye mr-1"></i> 1.2M lượt xem</span>
                                <span class="text-sm"><i class="fas fa-bookmark mr-1"></i> 250 chương</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Ranking Section -->
<section class="py-12 bg-white ranking-section">
    <div class="container mx-auto px-4">
        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-8 text-center">Bảng Xếp Hạng Truyện</h2>
        
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Đọc nhiều (Most Read) -->
            <div class="bg-gray-50 rounded-xl p-6 shadow-sm">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-bold text-gray-800 flex items-center">
                        <i class="fas fa-fire text-red-500 mr-2"></i>
                        Đọc nhiều
                    </h3>
                    <a href="{{ route('ranking') }}" class="text-blue-500 hover:text-blue-700 text-sm">Xem tất cả</a>
                </div>
                
                <!-- Top 1 with cover -->
                <div class="mb-6 p-4 bg-white rounded-lg shadow-sm top-novel-card">
                    <div class="flex items-start space-x-4">
                        <div class="relative">
                            <div class="absolute -top-2 -left-2 w-8 h-8 bg-yellow-400 rounded-full flex items-center justify-center text-white font-bold text-sm ranking-badge">
                                1
                            </div>
                            <img src="https://via.placeholder.com/80x100" alt="Võ hiệp, tiểu thuyết gia" class="w-20 h-24 object-cover rounded">
                        </div>
                        <div class="flex-1">
                            <h4 class="font-bold text-gray-800 mb-2 line-clamp-2">Võ hiệp, tiểu thuyết gia</h4>
                            <div class="flex items-center text-sm text-gray-600 mb-1">
                                <i class="fas fa-user mr-1"></i>
                                <span>Thiên Thông Đạo Nhân</span>
                            </div>
                            <div class="flex items-center text-sm text-gray-600">
                                <i class="fas fa-list-ul mr-1"></i>
                                <span>Huyền huyễn</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Other rankings -->
                <div class="space-y-3">
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-300 rounded-full flex items-center justify-center text-white font-bold text-sm">2</div>
                        <span class="text-gray-800 font-medium">Vu sư: Ám tinh chi thư</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-orange-400 rounded-full flex items-center justify-center text-white font-bold text-sm">3</div>
                        <span class="text-gray-800 font-medium">Xu cát tị hung, từ tạp dịch đệ tử bắt đầu</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">4</div>
                        <span class="text-gray-800 font-medium">Đạo gia muốn trường sinh</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">5</div>
                        <span class="text-gray-800 font-medium">Địa Sát Thất Thập Nhị Biến - Tế Tửu</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">6</div>
                        <span class="text-gray-800 font-medium">Võ hiệp: Giang hồ đệ nhất thần y</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">7</div>
                        <span class="text-gray-800 font-medium">Đô thị thổ địa tiên</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">8</div>
                        <span class="text-gray-800 font-medium">Về ta cần thiết điều nghiên địa hình cốt...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">9</div>
                        <span class="text-gray-800 font-medium">Long năm, ta thế nhưng trọng sinh vì...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">10</div>
                        <span class="text-gray-800 font-medium">Vai ác chính là bộ dáng này</span>
                    </div>
                </div>
            </div>

            <!-- Thịnh hành (Trending) -->
            <div class="bg-gray-50 rounded-xl p-6 shadow-sm">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-bold text-gray-800 flex items-center">
                        <i class="fas fa-chart-line text-blue-500 mr-2"></i>
                        Thịnh hành
                    </h3>
                    <a href="{{ route('ranking') }}" class="text-blue-500 hover:text-blue-700 text-sm">Xem tất cả</a>
                </div>
                
                <!-- Top 1 with cover -->
                <div class="mb-6 p-4 bg-white rounded-lg shadow-sm top-novel-card">
                    <div class="flex items-start space-x-4">
                        <div class="relative">
                            <div class="absolute -top-2 -left-2 w-8 h-8 bg-yellow-400 rounded-full flex items-center justify-center text-white font-bold text-sm ranking-badge">
                                1
                            </div>
                            <img src="https://via.placeholder.com/80x100" alt="Đỉnh Cấp Khí Vận, Lặng Lẽ Tu Luyện Ngàn Năm" class="w-20 h-24 object-cover rounded">
                        </div>
                        <div class="flex-1">
                            <h4 class="font-bold text-gray-800 mb-2 line-clamp-2">Đỉnh Cấp Khí Vận, Lặng Lẽ Tu Luyện Ngàn Năm</h4>
                            <div class="flex items-center text-sm text-gray-600 mb-1">
                                <i class="fas fa-user mr-1"></i>
                                <span>Nhâm Ngã Tiếu</span>
                            </div>
                            <div class="flex items-center text-sm text-gray-600">
                                <i class="fas fa-list-ul mr-1"></i>
                                <span>Tiên hiệp</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Other rankings -->
                <div class="space-y-3">
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-300 rounded-full flex items-center justify-center text-white font-bold text-sm">2</div>
                        <span class="text-gray-800 font-medium">Vạn Cổ Thần Đế</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-orange-400 rounded-full flex items-center justify-center text-white font-bold text-sm">3</div>
                        <span class="text-gray-800 font-medium">Vừa Thành Tiên Thần, Con Cháu Cầu Ta...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">4</div>
                        <span class="text-gray-800 font-medium">Quang Âm Chi Ngoại</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">5</div>
                        <span class="text-gray-800 font-medium">Đế Bá</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">6</div>
                        <span class="text-gray-800 font-medium">Từ Hài Nhi Bắt Đầu Nhập Đạo</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">7</div>
                        <span class="text-gray-800 font-medium">Bắt Đầu Đánh Dấu Hoang Cổ Thánh Thể</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">8</div>
                        <span class="text-gray-800 font-medium">Cẩu Thả Tại Nữ Ma Đầu Bên Người Vụn...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">9</div>
                        <span class="text-gray-800 font-medium">Đấu La Đại Lục V Trùng Sinh Đường Tam</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">10</div>
                        <span class="text-gray-800 font-medium">Xích Tâm Tuần Thiên</span>
                    </div>
                </div>
            </div>

            <!-- Đề cử (Recommended) -->
            <div class="bg-gray-50 rounded-xl p-6 shadow-sm">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-bold text-gray-800 flex items-center">
                        <i class="fas fa-star text-yellow-500 mr-2"></i>
                        Đề cử
                    </h3>
                    <a href="{{ route('ranking') }}" class="text-blue-500 hover:text-blue-700 text-sm">Xem tất cả</a>
                </div>
                
                <!-- Top 1 with cover -->
                <div class="mb-6 p-4 bg-white rounded-lg shadow-sm top-novel-card">
                    <div class="flex items-start space-x-4">
                        <div class="relative">
                            <div class="absolute -top-2 -left-2 w-8 h-8 bg-yellow-400 rounded-full flex items-center justify-center text-white font-bold text-sm ranking-badge">
                                1
                            </div>
                            <img src="https://via.placeholder.com/80x100" alt="Người Đang Cao Võ Ta Có Thể Mô Phỏng..." class="w-20 h-24 object-cover rounded">
                        </div>
                        <div class="flex-1">
                            <h4 class="font-bold text-gray-800 mb-2 line-clamp-2">Người Đang Cao Võ Ta Có Thể Mô Phỏng...</h4>
                            <div class="flex items-center text-sm text-gray-600 mb-1">
                                <i class="fas fa-user mr-1"></i>
                                <span>Nguyệt Hồn Tai Họa</span>
                            </div>
                            <div class="flex items-center text-sm text-gray-600">
                                <i class="fas fa-list-ul mr-1"></i>
                                <span>Huyền huyễn</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Other rankings -->
                <div class="space-y-3">
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-300 rounded-full flex items-center justify-center text-white font-bold text-sm">2</div>
                        <span class="text-gray-800 font-medium">Đại Đạo Thù Cần : Từ Tam Quốc Bắt Đầ...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-orange-400 rounded-full flex items-center justify-center text-white font-bold text-sm">3</div>
                        <span class="text-gray-800 font-medium">Giết Một Người Bạo Một Binh, Bắt Đầu...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">4</div>
                        <span class="text-gray-800 font-medium">Phản Phái Npc: Bị Người Chơi Công Kíc...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">5</div>
                        <span class="text-gray-800 font-medium">Ta Ở Thế Giới Khác Ở Trong Giới</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">6</div>
                        <span class="text-gray-800 font-medium">Thôn Thiên Võ Thần</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">7</div>
                        <span class="text-gray-800 font-medium">Võng Du: Ta Tiễn Thuật Phụ Gia Vô Hạn...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">8</div>
                        <span class="text-gray-800 font-medium">Kẻ Hèn Này Chỉ Muốn Kiếm Tiền, Cản T...</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">9</div>
                        <span class="text-gray-800 font-medium">Ta Tại Dị Thế Giới Xây Dựng Chủ Thành</span>
                    </div>
                    <div class="flex items-center space-x-3 p-2 hover:bg-white rounded-lg transition duration-200 cursor-pointer ranking-item">
                        <div class="w-6 h-6 bg-gray-400 rounded-full flex items-center justify-center text-white font-bold text-sm">10</div>
                        <span class="text-gray-800 font-medium">Vừa Thành Nhân Tiên, Nữ Đế Quỳ Cầu...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Novels -->
<section class="py-12 bg-white">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center mb-8">
            <h2 class="text-2xl md:text-3xl font-bold text-gray-800">Truyện đề cử</h2>
            <a href="#" class="text-blue-500 hover:text-blue-700 font-medium flex items-center">
                Xem thêm <i class="fas fa-chevron-right ml-1 text-sm"></i>
            </a>
        </div>
        
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
            <!-- Novel Card 1 -->
            <a href="{{ route('novel-details') }}" class="novel-card bg-white rounded-lg overflow-hidden shadow-md hover:shadow-xl transition duration-300">
                <div class="relative overflow-hidden h-48">
                    <img src="https://via.placeholder.com/300x400" alt="Truyện 1" class="w-full h-full object-cover novel-image transition duration-500">
                    <div class="absolute top-2 left-2 bg-red-500 text-white text-xs px-2 py-1 rounded">Hot</div>
                </div>
                <div class="p-3">
                    <h3 class="font-bold text-gray-800 mb-1 truncate">Đấu Phá Thương Khung</h3>
                    <p class="text-gray-600 text-sm mb-2">Thiên Tàm Thổ Đậu</p>
                    <div class="flex justify-between items-center text-xs text-gray-500">
                        <span><i class="fas fa-eye mr-1"></i> 2.4M</span>
                        <span><i class="fas fa-list-ul mr-1"></i> 1,500</span>
                    </div>
                </div>
            </a>
            
            <!-- Novel Card 2 -->
            <a href="{{ route('novel-details') }}" class="novel-card bg-white rounded-lg overflow-hidden shadow-md hover:shadow-xl transition duration-300">
                <div class="relative overflow-hidden h-48">
                    <img src="https://via.placeholder.com/300x400" alt="Truyện 2" class="w-full h-full object-cover novel-image transition duration-500">
                    <div class="absolute top-2 left-2 bg-blue-500 text-white text-xs px-2 py-1 rounded">Mới</div>
                </div>
                <div class="p-3">
                    <h3 class="font-bold text-gray-800 mb-1 truncate">Toàn Chức Cao Thủ</h3>
                    <p class="text-gray-600 text-sm mb-2">Hồi Ốc</p>
                    <div class="flex justify-between items-center text-xs text-gray-500">
                        <span><i class="fas fa-eye mr-1"></i> 1.8M</span>
                        <span><i class="fas fa-list-ul mr-1"></i> 1,200</span>
                    </div>
                </div>
            </a>
            
            <!-- Novel Card 3 -->
            <a href="{{ route('novel-details') }}" class="novel-card bg-white rounded-lg overflow-hidden shadow-md hover:shadow-xl transition duration-300">
                <div class="relative overflow-hidden h-48">
                    <img src="https://via.placeholder.com/300x400" alt="Truyện 3" class="w-full h-full object-cover novel-image transition duration-500">
                    <div class="absolute top-2 left-2 bg-green-500 text-white text-xs px-2 py-1 rounded">Full</div>
                </div>
                <div class="p-3">
                    <h3 class="font-bold text-gray-800 mb-1 truncate">Thần Đạo Đan Tôn</h3>
                    <p class="text-gray-600 text-sm mb-2">Cô Đơn Địa Phi</p>
                    <div class="flex justify-between items-center text-xs text-gray-500">
                        <span><i class="fas fa-eye mr-1"></i> 1.5M</span>
                        <span><i class="fas fa-list-ul mr-1"></i> 1,800</span>
                    </div>
                </div>
            </a>
            
            <!-- Novel Card 4 -->
            <a href="{{ route('novel-details') }}" class="novel-card bg-white rounded-lg overflow-hidden shadow-md hover:shadow-xl transition duration-300">
                <div class="relative overflow-hidden h-48">
                    <img src="https://via.placeholder.com/300x400" alt="Truyện 4" class="w-full h-full object-cover novel-image transition duration-500">
                </div>
                <div class="p-3">
                    <h3 class="font-bold text-gray-800 mb-1 truncate">Ma Thổi Đèn</h3>
                    <p class="text-gray-600 text-sm mb-2">Thiên Hạ Bá Xướng</p>
                    <div class="flex justify-between items-center text-xs text-gray-500">
                        <span><i class="fas fa-eye mr-1"></i> 1.3M</span>
                        <span><i class="fas fa-list-ul mr-1"></i> 800</span>
                    </div>
                </div>
            </a>
            
            <!-- Novel Card 5 -->
            <a href="{{ route('novel-details') }}" class="novel-card bg-white rounded-lg overflow-hidden shadow-md hover:shadow-xl transition duration-300">
                <div class="relative overflow-hidden h-48">
                    <img src="https://via.placeholder.com/300x400" alt="Truyện 5" class="w-full h-full object-cover novel-image transition duration-500">
                    <div class="absolute top-2 left-2 bg-purple-500 text-white text-xs px-2 py-1 rounded">VIP</div>
                </div>
                <div class="p-3">
                    <h3 class="font-bold text-gray-800 mb-1 truncate">Ngạo Thế Cửu Trọng Thiên</h3>
                    <p class="text-gray-600 text-sm mb-2">Phong Thiên Hạo</p>
                    <div class="flex justify-between items-center text-xs text-gray-500">
                        <span><i class="fas fa-eye mr-1"></i> 2.1M</span>
                        <span><i class="fas fa-list-ul mr-1"></i> 2,000</span>
                    </div>
                </div>
            </a>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-12 bg-gray-100">
    <div class="container mx-auto px-4">
        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-8">Thể loại truyện</h2>
        
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
    </div>
</section>

<!-- Latest Updates -->
<section class="py-12 bg-white">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center mb-8">
            <h2 class="text-2xl md:text-3xl font-bold text-gray-800">Truyện mới cập nhật</h2>
            <div class="flex space-x-2">
                <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-l-full text-sm font-medium">Ngày</button>
                <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 text-sm font-medium">Tuần</button>
                <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-r-full text-sm font-medium">Tháng</button>
            </div>
        </div>
        
        <div class="bg-gray-50 rounded-xl overflow-hidden shadow-sm">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 divide-y md:divide-y-0 md:divide-x divide-gray-200">
                <!-- Column 1 -->
                <div class="p-4">
                    <div class="flex items-center mb-4">
                        <img src="https://via.placeholder.com/60x80" alt="Truyện 1" class="w-12 h-16 object-cover rounded">
                        <div class="ml-3">
                            <h3 class="font-bold text-gray-800">Đại Chúa Tể</h3>
                            <p class="text-sm text-gray-600">Thiên Tàm Thổ Đậu</p>
                        </div>
                    </div>
                    
                    <div class="space-y-3">
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 1500: Đại kết cục</span>
                                <span class="text-xs text-gray-500">2 giờ trước</span>
                            </div>
                            <p class="text-xs text-gray-500 truncate">Cuối cùng thì Thiên Tàm Thổ Đậu cũng đã hoàn thành bộ truyện dài kỳ này với chương cuối cùng đầy cảm xúc...</p>
                        </div>
                        
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 1499: Chung cục</span>
                                <span class="text-xs text-gray-500">5 giờ trước</span>
                            </div>
                        </div>
                        
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 1498: Phong vân tụ hội</span>
                                <span class="text-xs text-gray-500">8 giờ trước</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Column 2 -->
                <div class="p-4">
                    <div class="flex items-center mb-4">
                        <img src="https://via.placeholder.com/60x80" alt="Truyện 2" class="w-12 h-16 object-cover rounded">
                        <div class="ml-3">
                            <h3 class="font-bold text-gray-800">Thánh Vực</h3>
                            <p class="text-sm text-gray-600">Thiên Tàm Thổ Đậu</p>
                        </div>
                    </div>
                    
                    <div class="space-y-3">
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 120: Thánh giả xuất thế</span>
                                <span class="text-xs text-gray-500">1 giờ trước</span>
                            </div>
                            <p class="text-xs text-gray-500 truncate">Mục Trần cuối cùng cũng đạt tới cảnh giới Thánh giả, một bước lên trời...</p>
                        </div>
                        
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 119: Đột phá</span>
                                <span class="text-xs text-gray-500">4 giờ trước</span>
                            </div>
                        </div>
                        
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 118: Thánh lôi luyện thể</span>
                                <span class="text-xs text-gray-500">7 giờ trước</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Column 3 -->
                <div class="p-4">
                    <div class="flex items-center mb-4">
                        <img src="https://via.placeholder.com/60x80" alt="Truyện 3" class="w-12 h-16 object-cover rounded">
                        <div class="ml-3">
                            <h3 class="font-bold text-gray-800">Vạn Cổ Thần Đế</h3>
                            <p class="text-sm text-gray-600">Thiên Tàm Thổ Đậu</p>
                        </div>
                    </div>
                    
                    <div class="space-y-3">
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 80: Thần đế chi uy</span>
                                <span class="text-xs text-gray-500">30 phút trước</span>
                            </div>
                            <p class="text-xs text-gray-500 truncate">Mục Trần thức tỉnh thần lực cổ xưa, một chiêu diệt thiên địa...</p>
                        </div>
                        
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 79: Thần lực thức tỉnh</span>
                                <span class="text-xs text-gray-500">3 giờ trước</span>
                            </div>
                        </div>
                        
                        <!-- Chapter Item -->
                        <div class="chapter-list-item p-2 rounded-lg transition duration-200 cursor-pointer">
                            <div class="flex justify-between items-center">
                                <span class="font-medium text-gray-800">Chương 78: Cổ lão truyền thừa</span>
                                <span class="text-xs text-gray-500">6 giờ trước</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="bg-gray-100 p-4 text-center">
                <button class="bg-white hover:bg-gray-200 text-gray-800 font-medium py-2 px-6 rounded-full shadow-sm transition duration-300">
                    <i class="fas fa-sync-alt mr-2"></i> Xem thêm cập nhật
                </button>
            </div>
        </div>
    </div>
</section>

<!-- Comment Section -->
<section class="py-12 bg-gray-100">
    <div class="container mx-auto px-4">
        <div class="flex flex-col md:flex-row gap-8">
            <!-- Main Content -->
            <div class="w-full md:w-2/3">
                <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-6">Thế Giới </h2>
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <!-- Comment Form -->
                    <div class="mb-6">
                        <textarea class="w-full p-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4" placeholder="Viết bình luận của bạn..."></textarea>
                        <button class="mt-3 bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-6 rounded-full transition duration-300">
                            Gửi bình luận
                        </button>
                    </div>
                    <!-- Comment List -->
                    <div class="space-y-6">
                        <!-- Comment Item -->
                        <div class="flex space-x-4">
                            <img src="https://via.placeholder.com/50" alt="Avatar" class="w-12 h-12 rounded-full">
                            <div>
                                <div class="flex items-center space-x-2 mb-1">
                                    <h4 class="font-bold">Tên Người Dùng</h4>
                                    <span class="text-xs text-gray-500">2 giờ trước</span>
                                </div>
                                <p>Truyện hay quá! Hóng chương mới từng ngày.</p>
                            </div>
                        </div>
                        <!-- More Comments -->
                    </div>
                </div>
            </div>
            <!-- Sidebar -->
            <div class="w-full md:w-1/3 space-y-8">
                <!-- Top Comments -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Top bình luận</h3>
                    <div class="bg-white p-4 rounded-lg shadow-md space-y-4">
                        <!-- Top Comment Item -->
                        <div class="flex items-center space-x-3">
                            <span class="text-lg font-bold text-gray-400">1</span>
                            <img src="https://via.placeholder.com/40" alt="Avatar" class="w-10 h-10 rounded-full">
                            <div>
                                <h5 class="font-semibold">Fan Cứng</h5>
                                <p class="text-sm text-gray-600">"Bình luận siêu chất..."</p>
                            </div>
                        </div>
                        <!-- More Top Comments -->
                    </div>
                </div>
                <!-- Top Members -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Top thành viên</h3>
                    <div class="bg-white p-4 rounded-lg shadow-md space-y-4">
                        <!-- Top Member Item -->
                        <div class="flex items-center space-x-3">
                            <img src="https://via.placeholder.com/40" alt="Avatar" class="w-10 h-10 rounded-full">
                            <div>
                                <h5 class="font-semibold">Cao Thủ Đọc Giả</h5>
                                <p class="text-sm text-gray-500">Level 99</p>
                            </div>
                        </div>
                        <!-- More Top Members -->
                    </div>
                </div>
                <!-- Top Wealth -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Top tài phú</h3>
                    <div class="bg-white p-4 rounded-lg shadow-md space-y-4">
                        <!-- Top Wealth Item -->
                        <div class="flex items-center space-x-3">
                            <img src="https://via.placeholder.com/40" alt="Avatar" class="w-10 h-10 rounded-full">
                            <div>
                                <h5 class="font-semibold">Đại Gia Truyện</h5>
                                <p class="text-sm text-yellow-500">999,999 Vàng</p>
                            </div>
                        </div>
                        <!-- More Top Wealth -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
