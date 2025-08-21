<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Novel;
use App\Models\Category;
use App\Models\Chapter;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function dashboard()
    {
        // Thống kê tổng quan
        $stats = [
            'total_users' => User::count(),
            'total_novels' => Novel::count(),
            'total_chapters' => Chapter::count(),
            'total_comments' => Comment::count(),
            'new_users_today' => User::whereDate('created_at', today())->count(),
            'new_novels_today' => Novel::whereDate('created_at', today())->count(),
        ];

        // Hoạt động gần đây
        $recent_activities = $this->getRecentActivities();

        // Truyện mới nhất
        $latest_novels = Novel::with('author')
            ->latest()
            ->take(5)
            ->get();

        return view('admin.dashboard', compact('stats', 'recent_activities', 'latest_novels'));
    }

    public function users()
    {
        $users = User::withCount(['novels', 'comments'])
            ->latest()
            ->paginate(20);

        return view('admin.users.index', compact('users'));
    }

    public function novels()
    {
        $novels = Novel::with(['author', 'category'])
            ->withCount(['chapters', 'comments'])
            ->latest()
            ->paginate(20);

        return view('admin.novels.index', compact('novels'));
    }

    public function categories()
    {
        $categories = Category::withCount(['novels'])
            ->latest()
            ->paginate(20);

        return view('admin.categories.index', compact('categories'));
    }

    public function chapters()
    {
        $chapters = Chapter::with(['novel', 'author'])
            ->latest()
            ->paginate(20);

        return view('admin.chapters.index', compact('chapters'));
    }

    public function comments()
    {
        $comments = Comment::with(['user', 'novel'])
            ->latest()
            ->paginate(20);

        return view('admin.comments.index', compact('comments'));
    }

    public function reports()
    {
        $reports = DB::table('reports')
            ->join('users', 'reports.reporter_id', '=', 'users.id')
            ->join('novels', 'reports.novel_id', '=', 'novels.id')
            ->select('reports.*', 'users.name as reporter_name', 'novels.title as novel_title')
            ->latest()
            ->paginate(20);

        return view('admin.reports.index', compact('reports'));
    }

    public function settings()
    {
        return view('admin.settings.index');
    }

    // Helper methods
    private function getRecentActivities()
    {
        $activities = collect();

        // Người dùng mới
        $new_users = User::latest()->take(3)->get();
        foreach ($new_users as $user) {
            $activities->push([
                'type' => 'user_registered',
                'title' => $user->name . ' đã đăng ký tài khoản mới',
                'time' => $user->created_at->diffForHumans(),
                'icon' => 'fas fa-user-plus',
                'color' => 'text-success'
            ]);
        }

        // Truyện mới
        $new_novels = Novel::latest()->take(3)->get();
        foreach ($new_novels as $novel) {
            $activities->push([
                'type' => 'novel_added',
                'title' => 'Truyện "' . $novel->title . '" đã được thêm',
                'time' => $novel->created_at->diffForHumans(),
                'icon' => 'fas fa-book',
                'color' => 'text-info'
            ]);
        }

        // Chương mới
        $new_chapters = Chapter::latest()->take(3)->get();
        foreach ($new_chapters as $chapter) {
            $activities->push([
                'type' => 'chapter_added',
                'title' => 'Chương ' . $chapter->chapter_number . ' của "' . $chapter->novel->title . '"',
                'time' => $chapter->created_at->diffForHumans(),
                'icon' => 'fas fa-list-ol',
                'color' => 'text-warning'
            ]);
        }

        // Sắp xếp theo thời gian
        return $activities->sortByDesc('time')->take(10);
    }

    // API methods for AJAX requests
    public function getStats()
    {
        $stats = [
            'users' => [
                'total' => User::count(),
                'new_today' => User::whereDate('created_at', today())->count(),
                'new_week' => User::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count(),
            ],
            'novels' => [
                'total' => Novel::count(),
                'new_today' => Novel::whereDate('created_at', today())->count(),
                'new_week' => Novel::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count(),
            ],
            'chapters' => [
                'total' => Chapter::count(),
                'new_today' => Chapter::whereDate('created_at', today())->count(),
                'new_week' => Chapter::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count(),
            ],
            'comments' => [
                'total' => Comment::count(),
                'new_today' => Comment::whereDate('created_at', today())->count(),
                'new_week' => Comment::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count(),
            ]
        ];

        return response()->json($stats);
    }

    public function getChartData()
    {
        // Dữ liệu cho biểu đồ truy cập (7 ngày gần nhất)
        $access_data = [];
        $labels = [];
        
        for ($i = 6; $i >= 0; $i--) {
            $date = now()->subDays($i);
            $labels[] = $date->format('d/m');
            
            // Giả lập dữ liệu truy cập
            $access_data[] = rand(100, 1000);
        }

        // Dữ liệu cho biểu đồ thể loại
        $category_data = Category::withCount('novels')
            ->orderBy('novels_count', 'desc')
            ->take(5)
            ->get()
            ->map(function ($category) {
                return [
                    'label' => $category->name,
                    'value' => $category->novels_count
                ];
            });

        return response()->json([
            'access' => [
                'labels' => $labels,
                'data' => $access_data
            ],
            'categories' => $category_data
        ]);
    }
} 