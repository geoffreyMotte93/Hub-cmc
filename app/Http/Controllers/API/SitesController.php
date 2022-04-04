<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Site;
use App\Models\Site as ModelsSite;
use Validator;

   
class SitesController extends BaseController
{
    public function index()
    {
        $categories = ModelsSite::all();
        return $this->sendResponse(Site::collection($categories), 'Posts fetched.');
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
        $blog = ModelsSite::create($input);
        return $this->sendResponse(new ModelsSite($blog), 'Post created.');
    }
   
    public function show($id)
    {
        $Category = ModelsSite::find($id);
        if (is_null($Category)) {
            return $this->sendError('Post does not exist.');
        }
        return $this->sendResponse(new ModelsSite($Category), 'Post fetched.');
    }
    
    public function update(Request $request, ModelsSite $Site)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors());       
        }
        $Site->title = $input['title'];
        $Site->description = $input['description'];
        $Site->save();
        
        return $this->sendResponse(new ModelsSite($Site), 'Post updated.');
    }
   
    public function destroy(ModelsSite $Site)
    {
        $Tag->delete();
        return $this->sendResponse([], 'Post deleted.');
    }
}