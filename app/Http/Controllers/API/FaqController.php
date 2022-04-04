<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Faq as ResourcesFaq;
use App\Models\Faq;
use Illuminate\Support\Facades\DB;
use Validator;

   
class FaqController extends BaseController
{
    public function index()
    {
        $ressources = Faq::all();
        return $this->sendResponse(ResourcesFaq::collection($ressources), 'Posts fetched.');
    }
    
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'doc_id' => 'required',
            'question' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors());       
        }
        $faq = Faq::create($input);
        return $this->sendResponse(new ResourcesFaq($faq), 'Post created.');
    }
   
    public function show($id)
    {
        $faq = DB::table('faqs')->where('doc_id', $id)->get();
        if (is_null($faq)) {
            return $this->sendError('Site does not exist.');
        }
        return $this->sendResponse(ResourcesFaq::collection($faq), 'Posts fetched.');
    }
    
    public function update(Request $request, Faq $faq)
    {
        // $input = $request->all();
        // $validator = Validator::make($input, [
        //     'title' => 'required',
        //     'description' => 'required'
        // ]);
        // if($validator->fails()){
        //     return $this->sendError($validator->errors());       
        // }
        // $Category->title = $input['title'];
        // $Category->description = $input['description'];
        // $Category->save();
        
        // return $this->sendResponse(new ResourcesCategory($Category), 'Post updated.');
    }
   
    public function destroy(Faq $faq)
    {
        // $Category->delete();
        // return $this->sendResponse([], 'Post deleted.');
    }
}