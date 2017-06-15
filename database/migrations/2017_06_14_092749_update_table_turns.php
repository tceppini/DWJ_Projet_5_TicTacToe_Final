<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableTurns extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('turns', function (Blueprint $table) {
            $table->enum('turn_id', [1,2,3,4,5,6,7,8,9]);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('turns', function (Blueprint $table) {
            $table->removeColumn('turn_id');
        });
    }
}
