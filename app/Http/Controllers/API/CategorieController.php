<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Category as ResourcesCategory;
use App\Models\Category;
use Validator;

   
class CategorieController extends BaseController
{
    public function index()
    {
        $categories = Category::where('visibility', 'oui')->get();
        return $this->sendResponse(ResourcesCategory::collection($categories), 'Posts fetched.');
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
        $blog = Category::create($input);
        return $this->sendResponse(new ResourcesCategory($blog), 'Post created.');
    }
   
    public function show($id)
    {
        $Category = Category::find($id);
        if (is_null($Category)) {
            return $this->sendError('Post does not exist.');
        }
        return $this->sendResponse(new ResourcesCategory($Category), 'Post fetched.');
    }
    
    public function update(Request $request, Category $Category)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors());       
        }
        $Category->title = $input['title'];
        $Category->description = $input['description'];
        $Category->save();
        
        return $this->sendResponse(new ResourcesCategory($Category), 'Post updated.');
    }
   
    public function destroy(Category $Category)
    {
        $Category->delete();
        return $this->sendResponse([], 'Post deleted.');
    }
}
