<?php

namespace App\Http\Controllers;

use App\Models\Novel;

/**
 * Controller responsible for novel APIs and basic views.
 */
class NovelController extends Controller
{
    /**
     * Return novels as JSON.
     */
    public function index()
    {
        return response()->json(Novel::latest()->get());
    }

    /**
     * Display novels using a simple Blade view.
     */
    public function list()
    {
        $novels = Novel::latest()->paginate(20);

        return view('novels.index', compact('novels'));
    }
}
