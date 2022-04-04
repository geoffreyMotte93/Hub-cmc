<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
    use HasFactory;

    protected $fillable = [
        'question',
        'response',
        'doc_id',
    ];

    public function documentations()
    {
        return $this->belongsTo(Documentation::class);
    }
}
