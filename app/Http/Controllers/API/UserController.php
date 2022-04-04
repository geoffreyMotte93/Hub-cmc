<?php

namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Validator;

class UserController  extends BaseController
{
    public function get_equipes(Request $request)
    {
        $users = User::where('role_id', 1)->get();

        return $this->sendResponse($users, 'Users fetched.');
    }
}
