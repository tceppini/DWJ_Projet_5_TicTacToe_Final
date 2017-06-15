<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateGamesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('games', function (Blueprint $table) {
            $table->boolean('is_started')->default(false);
            $table->integer('first_player_id')->references('id')->on('users');
            $table->integer('second_player_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('games', function (Blueprint $table) {
            $table->removeColumn('is_started');
            $table->removeColumn('first_player_id');
            $table->removeColumn('second_player_id');
        });
    }
}
