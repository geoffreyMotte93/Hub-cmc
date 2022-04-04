<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;

class Documentation extends Model
{
    use HasFactory;

    protected $fillable = [
        'author_id',
        'title',
        'slug',
        'exerpt',
        'image',
        'content',
        'status',
        'meta',
    ];

    public function authorId()
    {
        return $this->belongsTo(User::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function sites()
    {
        return $this->belongsToMany(Site::class);
    }

    public function logs()
    {
        return $this->morphToMany(Log::class, 'logs');
    }

    public function faqs()
    {
        return $this->belongsTo(Faq::class);
    }
}
