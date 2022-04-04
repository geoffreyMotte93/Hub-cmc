<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TagSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach($this->get() as $item){
            DB::table('tags')->insert([
                'name' => $item['name'],
            ]);
        }
    }

    private function get()
    {
        $categories = array(
            array(
                "name" => "thumbnail",
            ),
            array(
                "name" => "video",
            ),
            array(
                "name" => "pdf",
            ),
            array(
                "name" => "pub",
            ),
            array(
                "name" => "menu",
            ),
        );
        return (object) $categories;        
    }
}
