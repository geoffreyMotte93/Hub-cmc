<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Documentation extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'author_id' => $this->author_id,
            'title' => $this->title,
            'slug' => $this->slug,
            'exerpt' => $this->exerpt,
            'image' => $this->image,
            'content' => $this->content,
            'status' => $this->status,
            'meta' => $this->meta,
        ];
    }
}
