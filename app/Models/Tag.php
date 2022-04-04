<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
    ];

    public function documentations()
    {
        return $this->belongsToMany(Documentation::class);
    }

    public function logs()
    {
        return $this->morphToMany(Log::class, 'logs');
    }
}
