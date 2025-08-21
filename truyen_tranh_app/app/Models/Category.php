<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'slug',
        'color',
        'icon',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    // Relationships
    public function novels()
    {
        return $this->hasMany(Novel::class);
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopePopular($query)
    {
        return $query->withCount('novels')->orderBy('novels_count', 'desc');
    }

    // Accessors
    public function getNovelsCountAttribute()
    {
        return $this->novels()->count();
    }

    public function getColorClassAttribute()
    {
        $colors = [
            'primary' => 'bg-blue-500',
            'success' => 'bg-green-500',
            'warning' => 'bg-yellow-500',
            'danger' => 'bg-red-500',
            'info' => 'bg-cyan-500',
            'secondary' => 'bg-gray-500',
        ];

        return $colors[$this->color] ?? 'bg-gray-500';
    }
}
