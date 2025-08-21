<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chapter extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'content',
        'chapter_number',
        'novel_id',
        'author_id',
        'word_count',
        'views',
        'is_published',
        'published_at',
    ];

    protected $casts = [
        'is_published' => 'boolean',
        'published_at' => 'datetime',
        'word_count' => 'integer',
        'views' => 'integer',
        'chapter_number' => 'integer',
    ];

    // Relationships
    public function novel()
    {
        return $this->belongsTo(Novel::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    // Scopes
    public function scopePublished($query)
    {
        return $query->where('is_published', true);
    }

    public function scopeByNovel($query, $novelId)
    {
        return $query->where('novel_id', $novelId);
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('chapter_number', 'asc');
    }

    // Accessors
    public function getFormattedChapterNumberAttribute()
    {
        return 'Chương ' . $this->chapter_number;
    }

    public function getReadingTimeAttribute()
    {
        // Giả sử đọc 200 từ/phút
        $minutes = ceil($this->word_count / 200);
        return $minutes . ' phút';
    }

    public function getExcerptAttribute()
    {
        return \Illuminate\Support\Str::limit(strip_tags($this->content), 200);
    }

    // Mutators
    public function setTitleAttribute($value)
    {
        $this->attributes['title'] = $value;
        $this->attributes['word_count'] = str_word_count(strip_tags($value));
    }

    public function setContentAttribute($value)
    {
        $this->attributes['content'] = $value;
        $this->attributes['word_count'] = str_word_count(strip_tags($value));
    }
}
