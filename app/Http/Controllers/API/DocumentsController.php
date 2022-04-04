<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Document;
use App\Models\Site;
use Illuminate\Support\Facades\DB;

class DocumentsController extends BaseController
{
    public function list_documents(Request $request)
    {
        $input = $request;
        $host = $input['host'];
        // verifier si le site est dans la bdd
        $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$host}%")->first();
        if (is_null($siteInfos)) {
            return $this->sendError('Site does not exist.');
        }

        $site = Site::find($siteInfos->id);

        if (is_null($site->documents)) {
            return $this->sendError('Documents does not exist for this website.');
        }

        return $this->sendResponse($site->documents, 'Post fetched.');

    }


    public function last_documents(Request $request)
    {
        $input = $request;
        $host = $input['host'];
        // verifier si le site est dans la bdd
        $siteInfos = DB::table('sites')->where('url', 'LIKE', "%{$host}%")->first();
        if (is_null($siteInfos)) {
            return $this->sendError('Site does not exist.');
        }

        $documentationsList = Document::orderBy('updated_at','DESC')->limit(5)->get();

        if (is_null($documentationsList)) {
            return $this->sendError('Documents does not exist for this website.');
        }

        return $this->sendResponse($documentationsList, 'Post fetched.');

    }
    
}