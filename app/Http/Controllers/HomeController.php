<?php

namespace App\Http\Controllers;


use App\Events\NewGame;
use App\Game;
use App\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $user = $request->user();
        $usersQuery = User::where('id', '!=', $user->id);

        if($request->has('search')){
            $usersQuery->where('name', 'like', "%{$request->get('search')}%");
        }

        $country = $request->get('country');
        if($request->has('country') && $country != 'all' && array_key_exists($country, $this->_countries)){
            $usersQuery->where('country', $request->get('country'));
        }

        $users = $usersQuery->paginate(5);

        return view('home', compact('users', 'country'));
    }

    public function newGame(Request $request)
    {
        $user = $request->user();
        $otherUserId = $request->get('user_id');

        $game = Game::where([
            'first_player_id' => $user->id,
            'second_player_id' => $otherUserId,
            'is_started' => false
        ])->first();

        if(is_null($game)) {
            $game = new Game();
            $game->first_player_id = $user->id;
            $game->second_player_id = $otherUserId;
            $game->is_started = false;
            $game->save();
        }

        event(new NewGame($otherUserId, $game->id, $user->name));
        // @TODO Send notification
        return redirect("/home");
    }
}
