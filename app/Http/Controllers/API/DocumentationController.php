<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\Documentation as ResourcesDocumentation;
use App\Models\Category;
use App\Models\Documentation;
use App\Models\Site;
use App\Models\Tag;
use Illuminate\Support\Facades\DB;
use Validator;

   
class DocumentationController extends BaseController
{
    public function index(Request $request)
    {
      
    }

    public function list_documentations(Request $request)
    {
        $input = $request;
        $host = $input['host'];
        // verifier si le site est dans la bdd
        $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$host}%")->first();
        if (is_null($siteInfos)) {
            return $this->sendError('Site does not exist.');
        }

        $site = Site::find($siteInfos->id);
        if (is_null($site->documentations->where('status', 'PUBLISHED'))) {
            return $this->sendError('Documents does not exist for this website.');
        }

        return $this->sendResponse($site->documentations->where('status', 'PUBLISHED'), 'Post fetched.');

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
        $blog = Documentation::create($input);
        return $this->sendResponse(new ResourcesDocumentation($blog), 'Post created.');
    }
   
    public function show($id)
    {
        $Category = Documentation::find($id);
 
        if (is_null($Category)) {
            return $this->sendError('Post does not exist.');
        }
        return $this->sendResponse(new ResourcesDocumentation($Category), 'Post fetched.');
    }
    
    public function update(Request $request, Documentation $Documentation)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError($validator->errors());       
        }
        $Documentation->title = $input['title'];
        $Documentation->description = $input['description'];
        $Documentation->save();
        
        return $this->sendResponse(new ResourcesDocumentation($Documentation), 'Post updated.');
    }
   
    public function destroy(Documentation $Documentation)
    {
        $Documentation->delete();
        return $this->sendResponse([], 'Post deleted.');
    }


    public function verif_document_site($array, $siteInfos){
        $data = [];

        foreach($array as $key => $item) {
            $documentationsPivot = DB::table( 'documentation_site' )->where('documentation_id', $item->id)->where('site_id', $siteInfos->id)->first();
            if(!is_null($documentationsPivot)){
                $data[] = $item;
            }
            
        }

        if (empty($data)) {
            return $this->sendError('Aucun résultat(s)');
        }else{
           return $data; 
        }

        
    }


    public function get_documentations_category(Request $request)
    {
            $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$request->host}%")->first();

            $category = Category::find($request->id);

            if (empty($category->documentations[0])) {
                return $this->sendError('<p>Aucun résultat(s)</p>');;
            }

            $documentationsList = $category->documentations->where('status', 'PUBLISHED');

            

            $data = $this->verif_document_site($documentationsList, $siteInfos);

            return $this->sendResponse($data, 'Post fetched.');
    }


    public function last_documentations(Request $request)
    {
            $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$request->host}%")->first();

            $documentationsList = Documentation::where('status', 'PUBLISHED')->orderBy('updated_at','DESC')->limit(5)->get();

            $data = $this->verif_document_site($documentationsList, $siteInfos);

            return $this->sendResponse($data, 'Post fetched.');
    }

    public function get_documentations_tag(Request $request)
    {
        $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$request->host}%")->first();

        $tag = Tag::find($request->id);

        if (empty($tag->documentations[0]->where('status', 'PUBLISHED'))) {
            return $this->sendError('<p>Aucun résultat(s)</p>');
        }

        $documentationsList = $tag->documentations->where('status', 'PUBLISHED');
        $data = $this->verif_document_site($documentationsList, $siteInfos);

        return $this->sendResponse($data, 'Post fetched.');
    }


    public function search_documentations(Request $request)
    {
        $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$request->host}%")->first();

        $documentations = [];
        $documentations = Documentation::where('status', 'PUBLISHED')->where('title', 'LIKE', "%{$request->searchTerm}%")->orWhere('exerpt', 'LIKE', "%{$request->searchTerm}%")->orWhere('content', 'LIKE', "%{$request->searchTerm}%")->get();
        if (is_null($documentations)) {
            return $this->sendError('<p>Pas de documentations qui correspont a :' + $request->searchTerm + '</p>');
        }

        $data = $this->verif_document_site($documentations, $siteInfos);


        return $this->sendResponse($data, 'Post fetched.');
    }
}
