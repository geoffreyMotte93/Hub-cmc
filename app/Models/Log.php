<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'index_id',
        'user_id',
    ];


    public function categories()
    {
        return $this->morphedByMany(Categorie::class, 'logs');
    }
 
    public function tags()
    {
        return $this->morphedByMany(Tag::class, 'logs');
    }

    public function post()
    {
        return $this->morphedByMany(Post::class, 'logs');
    }
}
