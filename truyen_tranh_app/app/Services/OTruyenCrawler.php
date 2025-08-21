<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use App\Models\Novel;

class OTruyenCrawler
{
    /**
     * Base URL for the OTruyen API.
     */
    protected string $baseUrl = 'https://otruyenapi.com/v1/api';

    /**
     * Crawl novels from the OTruyen API and persist them to the database.
     */
    public function crawlNovels(): void
    {
        $response = Http::get("{$this->baseUrl}/danh-sach");

        if (! $response->successful()) {
            return;
        }

        $novels = $response->json('data') ?? [];

        foreach ($novels as $novel) {
            Novel::updateOrCreate(
                ['title' => $novel['name'] ?? ''],
                [
                    'description' => $novel['summary'] ?? null,
                    'cover_image' => $novel['thumb_url'] ?? null,
                    'author_id' => 1,
                    'category_id' => 1,
                    'status' => $novel['status'] ?? 'ongoing',
                    'total_chapters' => $novel['total_chapters'] ?? 0,
                    'views' => $novel['views'] ?? 0,
                    'rating' => $novel['rating'] ?? 0,
                    'is_completed' => ($novel['status'] ?? '') === 'Complete',
                ]
            );
        }
    }
}
