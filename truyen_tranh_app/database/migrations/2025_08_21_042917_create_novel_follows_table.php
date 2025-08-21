<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('novel_follows', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('novel_id')->constrained('novels')->onDelete('cascade');
            $table->timestamp('last_read_at')->nullable();
            $table->integer('last_read_chapter')->nullable();
            $table->timestamps();

            $table->unique(['user_id', 'novel_id']);
            $table->index(['user_id', 'last_read_at']);
            $table->index(['novel_id', 'created_at']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('novel_follows');
    }
};
