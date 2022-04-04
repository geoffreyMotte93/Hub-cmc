<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class GetRessourcesTest extends TestCase
{
    /**
     * Get a ressources After login
     *
     * @return void
     */
    public function test_get_category_api_returns_a_successful_response()
    {
        $response = $this->post('categories');

        $response->assertStatus(200);
    }
}
