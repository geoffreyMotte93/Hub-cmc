<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Tag as ResourcesTag;
use App\Models\Tag;
use Validator;

   
class TagController extends BaseController
{
    public function index()
    {
        $categories = Tag::all();
        return $this->sendResponse(ResourcesTag::collection($categories), 'Posts fetched.');
    }
    
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors());       
        }
        $blog = Tag::create($input);
        return $this->sendResponse(new ResourcesTag($blog), 'Post created.');
    }
   
    public function show($id)
    {
        $Category = Tag::find($id);
        if (is_null($Category)) {
            return $this->sendError('Post does not exist.');
        }
        return $this->sendResponse(new ResourcesTag($Category), 'Post fetched.');
    }
    
    public function update(Request $request, Tag $Tag)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors());       
        }
        $Tag->title = $input['title'];
        $Tag->description = $input['description'];
        $Tag->save();
        
        return $this->sendResponse(new ResourcesTag($Tag), 'Post updated.');
    }
   
    public function destroy(Tag $Tag)
    {
        $Tag->delete();
        return $this->sendResponse([], 'Post deleted.');
    }
}