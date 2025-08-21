<?php

namespace App\Jobs;

use App\Models\Category;
use App\Models\Novel;
use App\Services\OTruyenService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Str;

class CrawlOTruyenNovel implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public string $slug;

    /**
     * Create a new job instance.
     */
    public function __construct(string $slug)
    {
        $this->slug = $slug;
    }

    /**
     * Execute the job.
     */
    public function handle(OTruyenService $service): void
    {
        $data = $service->fetchNovel($this->slug);

        if (!$data) {
            return;
        }

        $categoryName = $data['category'] ?? 'Uncategorized';
        $category = Category::firstOrCreate(
            ['slug' => Str::slug($categoryName)],
            ['name' => $categoryName]
        );

        Novel::updateOrCreate(
            ['title' => $data['title'] ?? $this->slug],
            [
                'description' => $data['content'] ?? null,
                'cover_image' => $data['thumb_url'] ?? null,
                'author_id' => 1,
                'category_id' => $category->id,
                'status' => $data['status'] ?? 'ongoing',
            ]
        );
    }
}

