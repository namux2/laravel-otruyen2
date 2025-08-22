<?php

namespace App\Console\Commands;

use App\Jobs\CrawlOTruyenNovel;
use App\Services\OTruyenService;
use Illuminate\Console\Command;

class OTruyenCrawlCommand extends Command
{
    protected $signature = 'otruyen:crawl {--page=1 : Page to crawl}';

    protected $description = 'Fetch novel list from OTruyen API and dispatch crawl jobs';

    public function handle(OTruyenService $service): int
    {
        $page = (int) $this->option('page');
        $novels = $service->fetchLatestNovels($page);

        foreach ($novels as $novel) {
            if (!empty($novel['slug'])) {
                CrawlOTruyenNovel::dispatch($novel['slug']);
            }
        }

        $this->info('Dispatched crawl jobs for '.count($novels).' novels.');

        return 0;
    }
}

