<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    public $fillable = ['end_date', 'winner_id', 'first_player_id', 'second_player_id', 'is_started'];

    public function turns()
    {
        return $this->hasMany(Turn::class, 'game_id');
    }

    public function winner()
    {
        return $this->belongsTo(User::class, 'winner_id');
    }

    public function first_player()
    {
        return $this->belongsTo(User::class, 'first_player_id');
    }

    public function second_player()
    {
        return $this->belongsTo(User::class, 'second_player_id');
    }
}
