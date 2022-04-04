<?php
  
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
  
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BlogController;
use App\Http\Controllers\API\CategorieController;
use App\Http\Controllers\API\DocumentationController;
use App\Http\Controllers\API\DocumentsController;
use App\Http\Controllers\API\FaqController;
use App\Http\Controllers\API\TagController;
use App\Http\Controllers\API\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/
  
Route::post('login', [AuthController::class, 'signin']);
     
Route::middleware('auth:sanctum')->group( function () {
    Route::resource('blogs', BlogController::class);
});


Route::middleware('auth:sanctum')->group( function () {
    Route::resource('categories', CategorieController::class);
});

Route::middleware('auth:sanctum')->group( function () {
    Route::resource('tags', TagController::class);
});


Route::middleware('auth:sanctum')->group( function () {
    Route::resource('documentations', DocumentationController::class);
});

Route::middleware('auth:sanctum')->group( function () {
    Route::resource('faqs', FaqController::class);
});

Route::middleware('auth:sanctum')->post('get_documentations_category' , [DocumentationController::class, 'get_documentations_category']);

Route::middleware('auth:sanctum')->post('get_documentations_tag' , [DocumentationController::class, 'get_documentations_tag']);

Route::middleware('auth:sanctum')->post('search_documentations' , [DocumentationController::class, 'search_documentations']);

Route::middleware('auth:sanctum')->post('list_documentations' , [DocumentationController::class, 'list_documentations']);

Route::middleware('auth:sanctum')->post('last_documentations' , [DocumentationController::class, 'last_documentations']);

Route::middleware('auth:sanctum')->post('list_documents' , [DocumentsController::class, 'list_documents']);

Route::middleware('auth:sanctum')->post('last_documents' , [DocumentsController::class, 'last_documents']);

Route::post('get_equipes' , [UserController::class, 'get_equipes']);