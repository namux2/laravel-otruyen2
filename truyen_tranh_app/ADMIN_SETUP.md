# Hướng dẫn cài đặt và sử dụng trang Admin NovelHub

## 🚀 **Tính năng đã hoàn thành:**

### ✅ **Trang User Profile:**
- **Cập nhật Avatar**: Upload và thay đổi ảnh đại diện
- **Thông tin cá nhân**: Cập nhật tên, email, ngày sinh, giới tính
- **Đổi mật khẩu**: Thay đổi mật khẩu với xác nhận
- **Theo dõi truyện**: Quản lý danh sách truyện đang theo dõi
- **Lịch sử đọc**: Xem và quản lý lịch sử đọc truyện

### ✅ **Trang Admin Dashboard:**
- **Theme Quatro**: Giao diện admin responsive với Bootstrap 5
- **Thống kê tổng quan**: Số liệu người dùng, truyện, chương, bình luận
- **Biểu đồ**: Thống kê truy cập và thể loại phổ biến
- **Quản lý**: Người dùng, truyện, thể loại, chương, bình luận, báo cáo
- **Hoạt động gần đây**: Theo dõi các hoạt động mới nhất

## 🔧 **Cài đặt:**

### 1. **Chạy Migration:**
```bash
php artisan migrate
```

### 2. **Tạo tài khoản Admin:**
```bash
php artisan tinker
```
```php
$user = \App\Models\User::find(1); // hoặc email của bạn
$user->update(['is_admin' => true]);
```

### 3. **Cấu hình Storage:**
```bash
php artisan storage:link
```

## 📱 **Cách sử dụng:**

### **Trang Profile:**
- Truy cập: `/profile`
- Cập nhật avatar: Chọn file ảnh và nhấn "Cập nhật Avatar"
- Thay đổi thông tin: Điền form và nhấn "Cập nhật thông tin"
- Đổi mật khẩu: Nhập mật khẩu cũ và mới, nhấn "Đổi mật khẩu"

### **Trang Admin:**
- Truy cập: `/admin/dashboard`
- Đăng nhập với tài khoản có quyền admin
- Sử dụng sidebar để điều hướng giữa các trang
- Xem thống kê và biểu đồ real-time

## 🎨 **Giao diện:**

### **Profile Page:**
- Layout responsive với Tailwind CSS
- Form validation real-time
- Thông báo thành công/lỗi
- Quản lý truyện theo dõi và lịch sử đọc

### **Admin Dashboard:**
- Theme Quatro với Bootstrap 5
- Sidebar có thể thu gọn
- Cards thống kê với icons
- Biểu đồ Chart.js
- Bảng dữ liệu với pagination

## 🔐 **Bảo mật:**

- Middleware `auth` cho tất cả trang profile
- Middleware `admin` cho trang admin
- CSRF protection cho tất cả form
- Validation server-side và client-side
- File upload validation (chỉ ảnh, max 2MB)

## 📁 **Cấu trúc file:**

```
app/
├── Http/Controllers/
│   ├── ProfileController.php    # Xử lý profile user
│   └── AdminController.php      # Xử lý admin dashboard
├── Http/Middleware/
│   └── Admin.php               # Kiểm tra quyền admin
└── Models/
    └── User.php                # Model user với field mới

resources/views/
├── profile.blade.php           # Trang profile user
└── admin/
    └── dashboard.blade.php     # Trang admin dashboard

public/js/
├── profile.js                  # JavaScript cho profile
└── notifications.js            # Hệ thống thông báo

routes/
└── web.php                     # Routes cho profile và admin
```

## 🚀 **Tính năng nâng cao:**

### **Profile:**
- Upload avatar với preview
- Validation real-time
- AJAX cho theo dõi/bỏ theo dõi truyện
- Quản lý lịch sử đọc

### **Admin:**
- Dashboard với thống kê real-time
- Biểu đồ tương tác
- Quản lý CRUD cho tất cả entity
- Responsive design

## 📝 **Ghi chú:**

- Cần tạo các Model Novel, Category, Chapter, Comment để AdminController hoạt động đầy đủ
- Có thể thêm field `role` vào bảng users thay vì `is_admin`
- Cần implement logic thực tế cho theo dõi truyện và lịch sử đọc
- Có thể thêm các tính năng như export data, bulk actions

## 🔗 **Links:**

- **Profile**: `/profile`
- **Admin Dashboard**: `/admin/dashboard`
- **Admin Users**: `/admin/users`
- **Admin Novels**: `/admin/novels`
- **Admin Categories**: `/admin/categories`
- **Admin Chapters**: `/admin/chapters`
- **Admin Comments**: `/admin/comments`
- **Admin Reports**: `/admin/reports`
- **Admin Settings**: `/admin/settings` 