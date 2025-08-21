<?php

namespace App\Http\Controllers;

use App\Models\Novel;

class NovelController extends Controller
{
    /**
     * Display a listing of the novels.
     */
    public function index()
    {
        return response()->json(Novel::latest()->get());
    }
}
