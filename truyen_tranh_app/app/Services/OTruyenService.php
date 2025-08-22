<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class OTruyenService
{
    protected string $baseUrl;

    public function __construct()
    {
        $this->baseUrl = rtrim(config('otruyen.base_url'), '/');
    }

    /**
     * Fetch latest novels from OTruyen.
     *
     * @param int $page
     * @return array
     */
    public function fetchLatestNovels(int $page = 1): array
    {
        $response = Http::get("{$this->baseUrl}/danh-sach/truyen-moi", [
            'page' => $page,
        ]);

        if ($response->failed()) {
            return [];
        }

        return $response->json('data') ?? [];
    }

    /**
     * Fetch novel detail by slug.
     *
     * @param string $slug
     * @return array|null
     */
    public function fetchNovel(string $slug): ?array
    {
        $response = Http::get("{$this->baseUrl}/truyen-tranh/{$slug}");

        if ($response->failed()) {
            return null;
        }

        return $response->json('data');
    }
}

