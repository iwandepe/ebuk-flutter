<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        return User::all();
    }

    public function show($id)
    {
        return User::find($id);
    }

    public function login(Request $request)
    {
        $user = User::where('email', $request->get('email'))
            ->where('password', $request->get('password'))->firstOrFail();

        return response()->json([$user]);
    }

    public function register(Request $request)
    {
        return User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => $request->get('password'),
        ]);
    }
}
