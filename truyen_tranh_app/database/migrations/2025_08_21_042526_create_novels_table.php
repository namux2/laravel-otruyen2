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
        Schema::create('novels', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->string('cover_image')->nullable();
            $table->foreignId('author_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('category_id')->constrained('categories')->onDelete('cascade');
            $table->string('status')->default('ongoing');
            $table->integer('total_chapters')->default(0);
            $table->integer('views')->default(0);
            $table->decimal('rating', 3, 2)->default(0.00);
            $table->boolean('is_completed')->default(false);
            $table->timestamps();

            $table->index(['category_id', 'status']);
            $table->index(['author_id', 'created_at']);
            $table->index(['rating', 'views']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('novels');
    }
};
