<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach($this->get() as $item){
            DB::table('categories')->insert([
                // 'id' => $item['id'],
                'name' => $item['name'],
                'description' => $item['description'],
                'parent_id' => $item['parent_id'],
                'visibility' => 'oui'
            ]);
        }
    }

    private function get()
    {
        $categories = array(
            array(
                "id" => 1,
                "name" => "Wordpress",
                "description" => "Contiens tous les documents de Wordpress",
                "parent_id" => null,
            ),
            array(
                "id" => 2,
                "name" => "Ma Presse Locale",
                "description" => "Contiens tous les documents de Ma Presse Locale",
                "parent_id" => null,
            ),
            array(
                "id" => 3,
                "name" => "Centre de ressources",
                "description" => "Contiens tous les documents du centre de ressources",
                "parent_id" => null,
            ),
        );
        return (object) $categories;        
    }
}
