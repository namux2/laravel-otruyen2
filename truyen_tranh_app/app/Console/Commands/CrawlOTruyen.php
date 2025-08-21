<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\OTruyenCrawler;

class CrawlOTruyen extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'otruyen:crawl';

    /**
     * The console command description.
     */
    protected $description = 'Crawl novels from OTruyen API and store them in the database';

    public function __construct(private OTruyenCrawler $crawler)
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $this->crawler->crawlNovels();
        $this->info('OTruyen crawl completed.');

        return Command::SUCCESS;
    }
}
