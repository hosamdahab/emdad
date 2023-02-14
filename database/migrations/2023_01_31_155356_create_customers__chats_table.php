<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersChatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers__chats', function (Blueprint $table) {
            $table->id();
            $table->string('user_id');
            $table->string('sent_by');
            $table->string('seen_by_customer')->nullable();
            $table->string('seen_by_admin')->nullable();
            $table->longText('message');
            $table->integer('status')->default(1);
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers__chats');
    }
}
