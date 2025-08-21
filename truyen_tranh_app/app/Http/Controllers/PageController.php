<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index()
    {
        return view('index');
    }

    public function author()
    {
        return view('author');
    }

    public function category()
    {
        return view('category');
    }

    public function chapter()
    {
        return view('chapter');
    }

    public function login()
    {
        return view('login');
    }

    public function novelDetails()
    {
        return view('novel-details');
    }

    public function profile()
    {
        return view('profile');
    }

    public function ranking()
    {
        return view('ranking');
    }

    public function register()
    {
        return view('register');
    }

    public function search()
    {
        return view('search');
    }

    public function testCowl()
    {
        return view('test-cowl');
    }
}
{
    //
}
