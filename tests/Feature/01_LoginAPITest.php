<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LoginAPITest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_the_login_api_returns_a_successful_response()
    {
        $response = $this->post('login', [
            'email' => 'geoffrey.motte@cmc-dev.com',
            'password' => 'test'
        ]);

        dd($response);

        $response->assertStatus(200);
    }
}
