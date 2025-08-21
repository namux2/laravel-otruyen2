<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show()
    {
        $user = Auth::user();
        return view('profile', compact('user'));
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'birth_date' => 'nullable|date|before:today',
            'gender' => 'nullable|in:male,female,other',
        ], [
            'name.required' => 'Vui lòng nhập họ tên',
            'name.max' => 'Họ tên không được vượt quá 255 ký tự',
            'email.required' => 'Vui lòng nhập email',
            'email.email' => 'Email không hợp lệ',
            'email.unique' => 'Email này đã được sử dụng',
            'birth_date.date' => 'Ngày sinh không hợp lệ',
            'birth_date.before' => 'Ngày sinh phải trước ngày hôm nay',
            'gender.in' => 'Giới tính không hợp lệ',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'birth_date' => $request->birth_date,
            'gender' => $request->gender,
        ]);

        return redirect()->back()
            ->with('success', 'Thông tin cá nhân đã được cập nhật thành công!');
    }

    public function updateAvatar(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ], [
            'avatar.required' => 'Vui lòng chọn ảnh',
            'avatar.image' => 'File phải là ảnh',
            'avatar.mimes' => 'Ảnh phải có định dạng: jpeg, png, jpg, gif',
            'avatar.max' => 'Ảnh không được lớn hơn 2MB',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator);
        }

        $user = Auth::user();

        // Xóa ảnh cũ nếu có
        if ($user->avatar && Storage::disk('public')->exists($user->avatar)) {
            Storage::disk('public')->delete($user->avatar);
        }

        // Lưu ảnh mới
        $avatarPath = $request->file('avatar')->store('avatars', 'public');
        
        $user->update(['avatar' => $avatarPath]);

        return redirect()->back()
            ->with('success', 'Avatar đã được cập nhật thành công!');
    }

    public function updatePassword(Request $request)
    {
        $user = Auth::user();

        $validator = Validator::make($request->all(), [
            'current_password' => 'required|current_password',
            'new_password' => 'required|string|min:6|confirmed',
        ], [
            'current_password.required' => 'Vui lòng nhập mật khẩu hiện tại',
            'current_password.current_password' => 'Mật khẩu hiện tại không chính xác',
            'new_password.required' => 'Vui lòng nhập mật khẩu mới',
            'new_password.min' => 'Mật khẩu mới phải có ít nhất 6 ký tự',
            'new_password.confirmed' => 'Xác nhận mật khẩu mới không khớp',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator);
        }

        $user->update([
            'password' => Hash::make($request->new_password)
        ]);

        return redirect()->back()
            ->with('success', 'Mật khẩu đã được thay đổi thành công!');
    }

    public function getFollowedNovels()
    {
        $user = Auth::user();
        
        // Giả lập dữ liệu truyện đang theo dõi
        $followedNovels = [
            [
                'id' => 1,
                'title' => 'Đấu Phá Thương Khung',
                'cover' => 'https://via.placeholder.com/60x80',
                'latest_chapter' => 'Chương 1500',
                'status' => 'following'
            ],
            [
                'id' => 2,
                'title' => 'Toàn Chức Cao Thủ',
                'cover' => 'https://via.placeholder.com/60x80',
                'latest_chapter' => 'Chương 1200',
                'status' => 'following'
            ],
            [
                'id' => 3,
                'title' => 'Thần Đạo Đan Tôn',
                'cover' => 'https://via.placeholder.com/60x80',
                'latest_chapter' => 'Chương 800',
                'status' => 'following'
            ],
            [
                'id' => 4,
                'title' => 'Ma Thổi Đèn',
                'cover' => 'https://via.placeholder.com/60x80',
                'latest_chapter' => 'Chương 600',
                'status' => 'following'
            ]
        ];

        return response()->json($followedNovels);
    }

    public function getReadingHistory()
    {
        $user = Auth::user();
        
        // Giả lập dữ liệu lịch sử đọc
        $readingHistory = [
            [
                'id' => 1,
                'novel_title' => 'Đấu Phá Thương Khung',
                'cover' => 'https://via.placeholder.com/50x65',
                'chapter' => 'Chương 1500',
                'read_time' => '2 giờ trước'
            ],
            [
                'id' => 2,
                'novel_title' => 'Toàn Chức Cao Thủ',
                'cover' => 'https://via.placeholder.com/50x65',
                'chapter' => 'Chương 1200',
                'read_time' => '5 giờ trước'
            ],
            [
                'id' => 3,
                'novel_title' => 'Thần Đạo Đan Tôn',
                'cover' => 'https://via.placeholder.com/50x65',
                'chapter' => 'Chương 800',
                'read_time' => '1 ngày trước'
            ],
            [
                'id' => 4,
                'novel_title' => 'Ma Thổi Đèn',
                'cover' => 'https://via.placeholder.com/50x65',
                'chapter' => 'Chương 600',
                'read_time' => '2 ngày trước'
            ]
        ];

        return response()->json($readingHistory);
    }

    public function toggleFollowNovel(Request $request)
    {
        $novelId = $request->novel_id;
        $action = $request->action; // 'follow' hoặc 'unfollow'
        
        // Logic để theo dõi/bỏ theo dõi truyện
        // Có thể sử dụng bảng pivot hoặc bảng riêng
        
        $message = $action === 'follow' ? 'Đã theo dõi truyện!' : 'Đã bỏ theo dõi truyện!';
        
        return response()->json([
            'success' => true,
            'message' => $message,
            'action' => $action
        ]);
    }

    public function removeFromHistory(Request $request)
    {
        $historyId = $request->history_id;
        
        // Logic để xóa khỏi lịch sử đọc
        
        return response()->json([
            'success' => true,
            'message' => 'Đã xóa khỏi lịch sử đọc!'
        ]);
    }
} 