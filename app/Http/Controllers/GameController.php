<?php


namespace App\Http\Controllers;

use App\Events\GameOver;
use App\Events\Play;
use App\Game;
use App\Report;
use App\Turn;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GameController extends Controller
{

	public function board(Request $request, $id)
	{
		$user = $request->user();

		if(!Auth::check() || !$this->allowed($user->id, $id)){
			return redirect()->back()->with("error", "You are not allowed on that game");
		}

		$players = Turn::where('game_id', '=', $id)->select(['player_id', 'type'])->distinct()->get();
		$playerType = $user->id == $players[0]->player_id ? $players[0]->type : $players[1]->type;
        $otherPlayerId = $user->id == $players[0]->player_id ? $players[1]->player_id : $players[0]->player_id;
        $otherPlayer = User::where('id', $otherPlayerId)->select('id', 'score', 'name')->first();

		$pastTurns = Turn::where('game_id', '=', $id)->whereNotNull('location')->orderBy('id')->get();
		$nextTurn = Turn::where('game_id', '=', $id)->whereNull('location')->orderBy('id')->first();

		$locations = [
			1 => [
				"class" => "top left",
				"checked" => false,
				"type" => ""
			],
			2 => [
				"class" => "top middle",
				"checked" => false,
				"type" => ""
			],
			3 => [
				"class" => "top right",
				"checked" => false,
				"type" => ""
			],
			4 => [
				"class" => "center left",
				"checked" => false,
				"type" => ""
			],
			5 => [
				"class" => "center middle",
				"checked" => false,
				"type" => ""
			],
			6 => [
				"class" => "center right",
				"checked" => false,
				"type" => ""
			],
			7 => [
				"class" => "bottom left",
				"checked" => false,
				"type" => ""
			],
			8 => [
				"class" => "bottom middle",
				"checked" => false,
				"type" => ""
			],
			9 => [
				"class" => "bottom right",
				"checked" => false,
				"type" => ""
			],
		];

		$_messages = Game::where('id', '=', $id)->first()->messages()->get();
		$messages = [];

		foreach ($_messages as $message) {
		    $_message = $message->toArray();
		    $_message['name'] = $_message['user_id'] == Auth::user()->id ? Auth::user()->name : $otherPlayer->name;
		    $messages[] = $_message;
        }
        $messages = json_encode($messages);

		foreach($pastTurns as $pastTurn){
			$locations[$pastTurn->location]["checked"] = true;
			$locations[$pastTurn->location]["type"] = $pastTurn->type;
		}

		return view('board', compact('user', 'otherPlayer', 'messages', 'id', 'nextTurn', 'locations', 'playerType', 'otherPlayerId'));
	}

    public function report(Request $request)
    {
        $report = new Report();
        $report->message_id = $request->messageid;
        $report->user_id = $request->userid;
        $report->save();

        return "true";
    }

	public function play(Request $request, $id)
	{
		$user = $request->user();

		if(!$this->allowed($user->id, $id)){
			return response()->json(["status" => "error", "data" => "You are not in this game"]);
		}

		$location = $request->get('location');
		$turn = Turn::where('game_id', '=', $id)->whereNull('location')->orderBy('id')->first();
		$turn->location = $location;
		$turn->save();
		event(new Play($turn->game_id, $user->id, $location, $turn->type));
		return response()->json(["status" => "success", "data" => "Saved"]);
	}

	public function gameOver(Request $request, $id)
	{
		$user = $request->user();

		if(!$this->allowed($user->id, $id)){
			return response()->json(["status" => "error", "data" => "You are not in this game"]);
		}

		$location = $request->get('location');
		$turn = Turn::where('game_id', '=', $id)->whereNull('location')->orderBy('id')->first();
		$turn->location = $location;
		$turn->save();
        $game = Game::find($id);
        if($request->get('result') == "win"){
            $user->score++;
            $user->save();
            $game->winner_id = $user->id;
        }
        $game->end_date = date("Y-m-d H:i:s");
		$game->save();
		event(new GameOver($id, $user->id, $request->get('result'), $location, $turn->type));
		return response()->json(["status" => "success", "data" => "Saved"]);
	}

    public function accept(Request $request, $id)
    {
        $game = Game::where('id', $id)->firstOrFail();
        if ($game->second_player_id == Auth::user()->id) {
            $game->is_started = true;
            $game->save();

            $user = $request->user();
            $otherUserId = $game->first_player_id;

            for($i = 1; $i <= 9; $i++){
                Turn::insert([
                    "game_id" => $game->id,
                    "turn_id" => $i,
                    "type" => $i % 2 ? 'x' : 'o',
                    "player_id" => $i % 2 ? $user->id : $otherUserId
                ]);
            }

            return redirect('/board/'.$id);
        }
        return response('Unauthorized.', 401);
    }

    public function deny($id)
    {
        $game = Game::where('id', $id)->firstOrFail();
        if ($game->second_player_id == Auth::user()->id) {
            $game->delete();
            return redirect('/home');
        }
        return response('Unauthorized.', 401);
    }

	private function allowed($userId, $gameId)
	{
		$players = Turn::where('game_id', '=', $gameId)->select(['player_id', 'type'])->distinct()->get();
		$allowed = $userId == $players[0]->player_id || $userId == $players[1]->player_id;

		return $allowed;
	}
}