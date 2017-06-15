<?php

namespace App\Http\Controllers;

use App\Game;
use App\Http\Middleware\Banned;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $_countries = [
        'US' => 'United States',
        'FR' => 'France'
    ];

    public function __construct()
    {
        $this->middleware(function (Request $request, \Closure $next) {
            $countries = $this->_countries;
            if (Auth::check()) {
                $user = Auth::user();

                $challenges = Game::with('first_player')->where([
                    'second_player_id' => $user->id,
                    'is_started' => false
                ])->get();

                $games_in_progress = Game::with(['first_player', 'second_player', 'turns' => function ($query) {
                    $query->whereNull('location')->orderBy('id')->first();
                }])
                    ->where([
                        'is_started' => true,
                        'winner_id' => null,
                        'end_date' => null
                    ])
                    ->where(function ($query) use ($user) {
                        $query->where('first_player_id', $user->id)
                            ->orWhere('second_player_id', $user->id);
                    })->get();

                view()->composer('*', function ($view) use ($challenges, $games_in_progress, $user, $countries) {
                    $turns_count = 0;
                    foreach ($games_in_progress as $game) {
                        if (isset($game->turns[0]) && $game->turns[0]->player_id == $user->id) {
                            $turns_count++;
                        }
                    }
                    $view->with(compact('challenges', 'games_in_progress', 'turns_count', 'countries', 'user'));
                });
            } else {
                view()->composer('*', function ($view) use ($countries) {
                    $view->with(compact('countries'));
                });
            }
            return $next($request);
        });
        $this->middleware(Banned::class);
    }
}
