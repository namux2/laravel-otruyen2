<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Novel extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'cover_image',
        'author_id',
        'category_id',
        'status',
        'total_chapters',
        'views',
        'rating',
        'is_completed',
    ];

    protected $casts = [
        'is_completed' => 'boolean',
        'rating' => 'float',
        'views' => 'integer',
        'total_chapters' => 'integer',
    ];

    // Relationships
    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function chapters()
    {
        return $this->hasMany(Chapter::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function followers()
    {
        return $this->belongsToMany(User::class, 'novel_follows', 'novel_id', 'user_id');
    }

    // Scopes
    public function scopeCompleted($query)
    {
        return $query->where('is_completed', true);
    }

    public function scopeOngoing($query)
    {
        return $query->where('is_completed', false);
    }

    public function scopePopular($query)
    {
        return $query->orderBy('views', 'desc');
    }

    public function scopeLatest($query)
    {
        return $query->orderBy('created_at', 'desc');
    }

    // Accessors
    public function getCoverImageUrlAttribute()
    {
        if ($this->cover_image) {
            return asset('storage/' . $this->cover_image);
        }
        return 'https://via.placeholder.com/300x400';
    }

    public function getStatusTextAttribute()
    {
        return $this->is_completed ? 'Hoàn thành' : 'Đang tiến hành';
    }

    public function getRatingStarsAttribute()
    {
        return number_format($this->rating, 1);
    }
}
