<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;
use App\User;
use Auth;
use App\Events\ChatMessage;

class ChatController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Send chat message
     * @param $request
     * @return void
     */
    public function sendMessage(Request $request)
    {
        $event = [
            "id" => $request->receiverid,
            "sourceuserid" => Auth::user()->id,
            "name" => Auth::user()->name,
            "message" => $request->message,
            "gameid" => $request->gameid,
            "user_id" => Auth::user()->id
        ];

        $message = new Message();
        $message->message = $request->message;
        $message->user_id = Auth::user()->id;
        $message->game_id = $request->gameid;
        $message->save();

        event(new ChatMessage($event));
        return "true";
    }

    public function chatPage()
    {
       
        $users = User::all();
        return view('chat',['users'=> $users]);
    }
}
