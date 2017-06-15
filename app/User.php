<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'country'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public static function hasPendingChallenge($sender_id, $receiver_id) {
        return Game::where([
            'first_player_id' => $sender_id,
            'second_player_id' => $receiver_id,
            'is_started' => false
        ])->count() > 0 ? true : false;
    }
}
