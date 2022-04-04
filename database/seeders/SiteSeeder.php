<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SiteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach($this->get() as $item){
            DB::table('sites')->insert([
                'name' => $item['name'],
                'url' => $item['url'],
            ]);
        }
    }

    private function get()
    {
        $sites = array(
            array(
                "name" => "L'Observateur",
                "url" => "https://www.lobservateur.fr",
            ),
            array(
                "name" => "L'Observateur de Beauvais",
                "url" => "https://www.lobservateurdebeauvais.fr",
            ),
            array(
                "name" => "Le journal de Ham",
                "url" => "https://www.lejournaldeham.fr/",
            ),
            array(
                "name" => "Le courier d'Hirson",
                "url" => "https://www.lecourrierdhirson.fr/",
            ),
            array(
                "name" => "L'Écho du Thelle",
                "url" => "https://www.lechoduthelle.fr/",
            ),
            array(
                "name" => "Le democrate de Bergerac",
                "url" => "https://www.ledemocratedebergerac.fr/",
            ),
            array(
                "name" => "Le Bonhomme Picard",
                "url" => "https://www.lebonhommepicard.fr/",
            ),
            array(
                "name" => "La Semaine des Pyrennées",
                "url" => "https://www.lasemainedespyrenees.fr/",
            ),
            array(
                "name" => "La Semaine des Ardennes",
                "url" => "https://www.lasemainedesardennes.fr/",
            ),
            array(
                "name" => "La Semaine de l'Allier",
                "url" => "https://www.lasemainedelallier.fr/",
            ),
            array(
                "name" => "La Thierache",
                "url" => "https://www.la-thierache.fr/",
            ),
            array(
                "name" => "Écho IDF",
                "url" => "https://www.echoidf.fr/",
            ),
        );
        return (object) $sites;        
    }
}
