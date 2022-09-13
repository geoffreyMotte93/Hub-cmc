<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Analytics;
use Spatie\Analytics\Period;

   
class PopularPost extends BaseController
{
    public function index()
    {
        $analyticsData = Analytics::fetchMostVisitedPages( Period::days(7), 12 );
        return $analyticsData;
    }
   
}
