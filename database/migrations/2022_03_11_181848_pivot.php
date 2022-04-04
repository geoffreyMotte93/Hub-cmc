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
        Schema::create('category_documentation', function(Blueprint $table) 
        {
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('documentation_id');
            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreign('documentation_id')->references('id')->on('documentations');
        });

        Schema::create('documentation_tag', function (Blueprint $table) {
            $table->unsignedBigInteger('tag_id');
            $table->unsignedBigInteger('documentation_id');
            $table->foreign('tag_id')->references('id')->on('tags');
            $table->foreign('documentation_id')->references('id')->on('documentations');
        });

        Schema::create('documentation_site', function(Blueprint $table) 
        {
            $table->unsignedBigInteger('site_id');
            $table->unsignedBigInteger('documentation_id');
            $table->foreign('site_id')->references('id')->on('sites');
            $table->foreign('documentation_id')->references('id')->on('documentations');
        });

        Schema::create('document_site', function(Blueprint $table) 
        {
            $table->unsignedBigInteger('site_id');
            $table->unsignedBigInteger('document_id');
            $table->foreign('site_id')->references('id')->on('sites');
            $table->foreign('document_id')->references('id')->on('documents');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('category_documentation');
        Schema::dropIfExists('documentation_tag');
        Schema::dropIfExists('documentation_site');
        Schema::dropIfExists('document_site');
    }
};
