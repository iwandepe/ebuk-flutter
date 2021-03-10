<?php

use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Routing with improvements by using implicite route model binding
Route::get('books', 'BookController@index');
Route::get('book/{book}', 'BookController@show');
Route::post('book', 'BookController@store');
Route::put('book/{book}', 'BookController@update');
Route::delete('book/{book}', 'BookController@delete');
