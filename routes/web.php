<?php


Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('/home', 'HomeController@index');

Route::get('/board/{id}', 'GameController@board');

Route::post('/play/{id}', 'GameController@play');
Route::get('/accept/{id}', 'GameController@accept');
Route::get('/deny/{id}', 'GameController@deny');

Route::post('/game-over/{id}', 'GameController@gameOver');

Route::post('/new-game', 'HomeController@newGame');

Route::post('/chat','ChatController@sendMessage');
Route::post('/report','GameController@report');
Route::get('/chat','ChatController@chatPage');

Route::group([
    'namespace' => 'Admin',
    'prefix' => 'admin',
    'middleware' => [
        'auth',
        \App\Http\Middleware\Admin::class
    ]
], function () {
    Route::get('/', function(){
        return redirect('admin/users');
    });
    Route::get('users', 'UsersController@index');
    Route::get('ban/{id}', 'UsersController@ban')->where('id', '[0-9]+');
    Route::get('ignore-report/{id}', 'UsersController@ignoreReport')->where('id', '[0-9]+');
    Route::get('unban/{id}', 'UsersController@unban')->where('id', '[0-9]+');
});
