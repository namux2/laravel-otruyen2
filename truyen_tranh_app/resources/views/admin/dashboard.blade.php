<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovelHub Admin - Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        :root {
            --sidebar-width: 250px;
            --header-height: 60px;
            --primary-color: #4e73df;
            --secondary-color: #858796;
            --success-color: #1cc88a;
            --info-color: #36b9cc;
            --warning-color: #f6c23e;
            --danger-color: #e74a3b;
        }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9fc;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: var(--sidebar-width);
            background: linear-gradient(180deg, var(--primary-color) 0%, #224abe 100%);
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .sidebar.collapsed {
            width: 70px;
        }

        .sidebar-header {
            height: var(--header-height);
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-brand {
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }

        .sidebar-nav {
            padding: 1rem 0;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            color: rgba(255,255,255,0.8);
            padding: 0.75rem 1rem;
            display: flex;
            align-items: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: white;
            background-color: rgba(255,255,255,0.1);
        }

        .nav-link.active {
            color: white;
            background-color: rgba(255,255,255,0.2);
        }

        .nav-link i {
            width: 20px;
            margin-right: 0.75rem;
        }

        /* Main Content */
        .main-content {
            margin-left: var(--sidebar-width);
            transition: all 0.3s ease;
        }

        .main-content.expanded {
            margin-left: 70px;
        }

        /* Header */
        .top-header {
            height: var(--header-height);
            background: white;
            border-bottom: 1px solid #e3e6f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 1.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }

        .header-left {
            display: flex;
            align-items: center;
        }

        .sidebar-toggle {
            background: none;
            border: none;
            color: var(--secondary-color);
            font-size: 1.25rem;
            cursor: pointer;
            padding: 0.5rem;
            margin-right: 1rem;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-dropdown {
            position: relative;
        }

        .user-dropdown-toggle {
            background: none;
            border: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--secondary-color);
            cursor: pointer;
            padding: 0.5rem;
        }

        .user-dropdown-menu {
            position: absolute;
            top: 100%;
            right: 0;
            background: white;
            border: 1px solid #e3e6f0;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            min-width: 200px;
            z-index: 1000;
            display: none;
        }

        .user-dropdown-menu.show {
            display: block;
        }

        .user-dropdown-item {
            display: block;
            padding: 0.75rem 1rem;
            color: var(--secondary-color);
            text-decoration: none;
            border-bottom: 1px solid #e3e6f0;
        }

        .user-dropdown-item:hover {
            background-color: #f8f9fc;
            color: var(--primary-color);
        }

        /* Dashboard Cards */
        .dashboard-card {
            background: white;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            border: 1px solid #e3e6f0;
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-2px);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .card-icon.primary { background-color: var(--primary-color); }
        .card-icon.success { background-color: var(--success-color); }
        .card-icon.info { background-color: var(--info-color); }
        .card-icon.warning { background-color: var(--warning-color); }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.show {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <a href="#" class="sidebar-brand">
                <i class="fas fa-book-open me-2"></i>
                <span class="brand-text">NovelHub</span>
            </a>
        </div>
        
        <ul class="sidebar-nav">
            <li class="nav-item">
                <a href="#dashboard" class="nav-link active" data-section="dashboard">
                    <i class="fas fa-tachometer-alt"></i>
                    <span class="nav-text">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#users" class="nav-link" data-section="users">
                    <i class="fas fa-users"></i>
                    <span class="nav-text">Quản lý người dùng</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#novels" class="nav-link" data-section="novels">
                    <i class="fas fa-book"></i>
                    <span class="nav-text">Quản lý truyện</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#categories" class="nav-link" data-section="categories">
                    <i class="fas fa-tags"></i>
                    <span class="nav-text">Thể loại</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#chapters" class="nav-link" data-section="chapters">
                    <i class="fas fa-list-ol"></i>
                    <span class="nav-text">Chương truyện</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#comments" class="nav-link" data-section="comments">
                    <i class="fas fa-comments"></i>
                    <span class="nav-text">Bình luận</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#reports" class="nav-link" data-section="reports">
                    <i class="fas fa-flag"></i>
                    <span class="nav-text">Báo cáo</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#settings" class="nav-link" data-section="settings">
                    <i class="fas fa-cog"></i>
                    <span class="nav-text">Cài đặt</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content" id="main-content">
        <!-- Top Header -->
        <header class="top-header">
            <div class="header-left">
                <button class="sidebar-toggle" id="sidebar-toggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h4 class="mb-0">Dashboard</h4>
            </div>
            
            <div class="header-right">
                <div class="user-dropdown">
                    <button class="user-dropdown-toggle" id="user-dropdown-toggle">
                        <img src="https://via.placeholder.com/32x32" alt="Avatar" class="rounded-circle me-2" width="32" height="32">
                        <span>Admin</span>
                        <i class="fas fa-chevron-down"></i>
                    </button>
                    <div class="user-dropdown-menu" id="user-dropdown-menu">
                        <a href="#" class="user-dropdown-item">
                            <i class="fas fa-user me-2"></i> Hồ sơ
                        </a>
                        <a href="#" class="user-dropdown-item">
                            <i class="fas fa-cog me-2"></i> Cài đặt
                        </a>
                        <a href="#" class="user-dropdown-item">
                            <i class="fas fa-sign-out-alt me-2"></i> Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Dashboard Content -->
        <div class="container-fluid p-4">
            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card p-4">
                        <div class="d-flex align-items-center">
                            <div class="card-icon primary me-3">
                                <i class="fas fa-users"></i>
                            </div>
                            <div>
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Tổng người dùng
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">2,356</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card p-4">
                        <div class="d-flex align-items-center">
                            <div class="card-icon success me-3">
                                <i class="fas fa-book"></i>
                            </div>
                            <div>
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    Tổng truyện
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">1,234</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card p-4">
                        <div class="d-flex align-items-center">
                            <div class="card-icon info me-3">
                                <i class="fas fa-list-ol"></i>
                            </div>
                            <div>
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                    Tổng chương
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">45,678</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card p-4">
                        <div class="d-flex align-items-center">
                            <div class="card-icon warning me-3">
                                <i class="fas fa-comments"></i>
                            </div>
                            <div>
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Bình luận mới
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">89</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts Row -->
            <div class="row mb-4">
                <div class="col-xl-8 col-lg-7">
                    <div class="dashboard-card p-4">
                        <h6 class="m-0 font-weight-bold text-primary">Thống kê truy cập</h6>
                        <div class="chart-area">
                            <canvas id="myAreaChart" height="300"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-5">
                    <div class="dashboard-card p-4">
                        <h6 class="m-0 font-weight-bold text-primary">Thể loại phổ biến</h6>
                        <div class="chart-pie">
                            <canvas id="myPieChart" height="300"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="dashboard-card p-4">
                        <h6 class="m-0 font-weight-bold text-primary">Hoạt động gần đây</h6>
                        <div class="mt-3">
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img class="rounded-circle" src="https://via.placeholder.com/40x40" alt="User" width="40" height="40">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <div class="text-sm font-weight-bold text-gray-800">Nguyễn Văn A</div>
                                    <div class="text-sm text-gray-600">Đã đăng ký tài khoản mới</div>
                                    <div class="text-xs text-gray-500">2 phút trước</div>
                                </div>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img class="rounded-circle" src="https://via.placeholder.com/40x40" alt="User" width="40" height="40">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <div class="text-sm font-weight-bold text-gray-800">Truyện "Đấu Phá Thương Khung"</div>
                                    <div class="text-sm text-gray-600">Đã cập nhật chương mới</div>
                                    <div class="text-xs text-gray-500">15 phút trước</div>
                                </div>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <div class="flex-shrink-0">
                                    <img class="rounded-circle" src="https://via.placeholder.com/40x40" alt="User" width="40" height="40">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <div class="text-sm font-weight-bold text-gray-800">Bình luận mới</div>
                                    <div class="text-sm text-gray-600">Có bình luận mới cần duyệt</div>
                                    <div class="text-xs text-gray-500">1 giờ trước</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="dashboard-card p-4">
                        <h6 class="m-0 font-weight-bold text-primary">Truyện mới nhất</h6>
                        <div class="mt-3">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://via.placeholder.com/60x80" alt="Novel" class="me-3" width="60" height="80">
                                <div>
                                    <div class="text-sm font-weight-bold text-gray-800">Thiên Tài Trở Về Từ Địa Ngục</div>
                                    <div class="text-sm text-gray-600">Tác giả: Thiên Thông Đạo Nhân</div>
                                    <div class="text-xs text-gray-500">Đăng 2 giờ trước</div>
                                </div>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://via.placeholder.com/60x80" alt="Novel" class="me-3" width="60" height="80">
                                <div>
                                    <div class="text-sm font-weight-bold text-gray-800">Võ hiệp, tiểu thuyết gia</div>
                                    <div class="text-sm text-gray-600">Tác giả: Thiên Thông Đạo Nhân</div>
                                    <div class="text-xs text-gray-500">Đăng 4 giờ trước</div>
                                </div>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://via.placeholder.com/60x80" alt="Novel" class="me-3" width="60" height="80">
                                <div>
                                    <div class="text-sm font-weight-bold text-gray-800">Vu sư: Ám tinh chi thư</div>
                                    <div class="text-sm text-gray-600">Tác giả: Thiên Thông Đạo Nhân</div>
                                    <div class="text-xs text-gray-500">Đăng 6 giờ trước</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script>
        // Sidebar Toggle
        document.getElementById('sidebar-toggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('main-content').classList.toggle('expanded');
        });

        // User Dropdown
        document.getElementById('user-dropdown-toggle').addEventListener('click', function() {
            document.getElementById('user-dropdown-menu').classList.toggle('show');
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            if (!event.target.closest('.user-dropdown')) {
                document.getElementById('user-dropdown-menu').classList.remove('show');
            }
        });

        // Navigation
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Remove active class from all links
                document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
                
                // Add active class to clicked link
                this.classList.add('active');
                
                // Update header title
                const section = this.getAttribute('data-section');
                const title = this.querySelector('.nav-text').textContent;
                document.querySelector('.header-left h4').textContent = title;
            });
        });

        // Sample Charts
        const ctx = document.getElementById('myAreaChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
                datasets: [{
                    label: 'Truy cập',
                    data: [65, 59, 80, 81, 56, 55, 40],
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        const ctxPie = document.getElementById('myPieChart').getContext('2d');
        new Chart(ctxPie, {
            type: 'doughnut',
            data: {
                labels: ['Tiên Hiệp', 'Huyền Huyễn', 'Ngôn Tình', 'Đô Thị'],
                datasets: [{
                    data: [30, 25, 25, 20],
                    backgroundColor: [
                        '#4e73df',
                        '#1cc88a',
                        '#36b9cc',
                        '#f6c23e'
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    </script>
</body>
</html> 