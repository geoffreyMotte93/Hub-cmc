<?php
   
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Flux_rss;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use SimpleXMLElement;

class SeachPostController extends BaseController
{
    // ajoute l'article quand l'utilsateur wordpress sauvegarde son article
    public function add_post_rss(){
        $slug = $this->slug($_POST['site']);
        $value = DB::table('flux_rss_'.$slug)->where('id_post', $_POST['id_post'])->first();
        if(empty($value)){
            DB::insert('insert into flux_rss_'.$slug.' (id_post, title, link, created_post) values (?, ?, ?, ?)', [$_POST['id_post'], $_POST['title'], $_POST['link'], now()]);
        }else{
            DB::table('flux_rss_'.$slug)->where('id_post', $_POST['id_post'])->update( array('title'=> $_POST['title'], 'link'=> $_POST['link'] , 'updated_at'=> now()) );
        }

    }

    // supprime l'article quand l'utilsateur wordpress supprime son article
    public function delete_post_rss(){
        $slug = $this->slug($_POST['site']);
        $value = DB::table('flux_rss_'.$slug)->where('id_post', $_POST['id_post'])->delete();
    }


    // recherche dans la DBB un post correspondant a la recherche
    public function searchPost(){
        $slug = $this->slug($_POST['site']);
        $value = DB::table('flux_rss_'.$slug)->where('title', 'like', '%' . $_POST['search'] . '%')->orderBy('created_post', 'desc')->get();
        return json_encode($value);
    }

    // recupére le flux rss du wordpress
    public function getRSS()
    {
        $start_date = $_POST['start_date'];
        $numberPage = ceil($_POST['nombre_article'] / 250);
        // slugify name site
        $slug = $this->slug($_POST['site']);
        // test if table exist
        $table = Schema::hasTable('flux_rss_'.$slug);
        $loopNumberPage = 0;
        $loopRaw = 0;

        $notification = [
            'title' => 'FLUX RSS de '.$_POST['site'].' en cours d\'envoi!',
            'body' => 'Il y a '.$_POST['nombre_article'].' articles à importer en ' .$numberPage.' pages XML. Date d\'import: '.$start_date.' (url site: '.$_POST['url_site'].')'
        ];

        \Mail::to($_POST['user_email'])->send(new \App\Mail\RssNotification($notification));

     	if(!$table){
    		// créer la table flux avec le slug du site
    		Schema::create('flux_rss_'.$slug, function (Blueprint $table) {
        		$table->id();
        		$table->integer('id_post');
        		$table->text('title');
        		$table->text('link');
			    $table->string('created_post');
        		$table->timestamps();
   		    });
        }

        for ($i = 1; $i <= $numberPage; $i++) {
            // récupérer tous les articles depuis '0000-00-00 00:00:00'
            $rss = $this->get_RSS_website($_POST['url_site'].'/wp-content/plugins/CMC/inc/RSS/full_rss.php?start_date='.$start_date.'&paged='.$i);
            // parcoure le XMl-rss verifie si il n'existe pas et insérer dans la table

            if( !empty($rss->channel->post) ){

                foreach($rss->channel->post as $item)
                {
                    $value = DB::table('flux_rss_'.$slug)->where('id_post', $item->guid)->first();
                    if(empty($value)){
                        DB::insert('insert into flux_rss_'.$slug.' (id_post, title, link, created_post, created_at) values (?, ?, ?, ?, ?)', [$item->guid, $item->title, $item->link, $item->created_post, now()]);
                    }
                    $loopRaw++;
                }

                $loopNumberPage++;
            }else{
                if(!$table){ die(); }

                $notification = [
                    'title' => 'Erreur flux RSS FLUX RSS'.$_POST['site'],
                    'body' => 'La page '.$i.' est vide. URL='.$_POST['url_site'].'/wp-content/plugins/CMC/inc/RSS/full_rss.php?start_date='.$start_date.'&paged='.$i
                ];

                \Mail::to($_POST['user_email'])->send(new \App\Mail\RssNotification($notification));
            }
            sleep( 120 );
        }

        $notification = [
            'title' => 'FLUX RSS de '.$_POST['site'].' envoyer!',
            'body' => 'Il y a '.$_POST['nombre_article'].' articles à importer en ' .$numberPage.' pages XML. Le HUB a récupéré '.$loopNumberPage.' pages XML, et a traité '.$loopRaw.'  lignes'
        ];

        \Mail::to($_POST['user_email'])->send(new \App\Mail\RssNotification($notification));

    }

    public function get_RSS_website($url){

        $xmlObject = @simplexml_load_file( $url );

        if($xmlObject == false)
        {
            $notification = [
                'title' => 'Erreur Flux!',
                'body' => 'Erreur XML, URL : '.$url
            ];

            \Mail::to('geoffrey.motte@cmc-dev.com')->send(new \App\Mail\RssNotification($notification));
            return ;
        }
        else
        {
            return $xmlObject;
        }
    }

    function slug($str, $charset = 'utf-8'){
        $str = htmlentities($str, ENT_NOQUOTES, $charset);
        $str = preg_replace('#&([A-za-z])(?:acute|cedil|caron|circ|grave|orn|ring|slash|th|tilde|uml);#', '\1', $str);
        $str = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $str);
        $str = preg_replace('#&[^;]+;#', '', $str);
        $str = str_replace( "'", '', $str);
        $str = str_replace( "#039;", '', $str);
        $str = str_replace( " ", '_', $str);
        return strtolower($str);
    }
   
}
