<?php
if(!empty($_POST['url'])){
    if($_POST['url'] == 'https://www.lobservateur.fr'){
        $view_ID = 103751082;
    }elseif($_POST['url'] == 'https://www.lobservateurdebeauvais.fr'){
        $view_ID = 83597514;
    }elseif($_POST['url'] == 'https://www.lejournaldeham.fr'){
        $view_ID = 83597106;
    }elseif($_POST['url'] == 'https://www.lecourrierdhirson.fr'){
        $view_ID = 61174801;
    }elseif($_POST['url'] == 'https://www.lechoduthelle.fr'){
        $view_ID = 93971949;
    }elseif($_POST['url'] == 'https://www.ledemocratedebergerac.fr'){
        $view_ID = 83591739;
    }elseif($_POST['url'] == 'https://www.lebonhommepicard.fr'){
        $view_ID = 83596909;
    }elseif($_POST['url'] == 'https://www.lasemainedespyrenees.fr'){
        $view_ID = 83597110;
    }elseif($_POST['url'] == 'https://www.lasemainedesardennes.fr'){
        $view_ID = 83594141;
    }elseif($_POST['url'] == 'https://www.lasemainedelallier.fr'){
        $view_ID = 83565899;
    }elseif($_POST['url'] == 'https://www.la-thierache.fr'){
        $view_ID = 83573888;
    }elseif($_POST['url'] == 'https://www.echoidf.fr'){
        $view_ID = 68857781;
    }else{
        // default ID OBS
        $view_ID = 83597110;
    }

    return [
        'view_id' => $view_ID,
        'service_account_credentials_json' => storage_path('app/analytics/service-account-credentials.json'),
        'cache_lifetime_in_minutes' => 60 * 24,
        'cache' => [
            'store' => 'file',
        ],
    ];


} else {

    return [
        /*
        * The view id of which you want to display data.
        */
        'view_id' => env('GOOGLE_ANALYTICS_VIEW_ID'),
        /*
        * Path to the client secret json file. Take a look at the README of this package
        * to learn how to get this file. You can also pass the credentials as an array
        * instead of a file path.
        */
        'service_account_credentials_json' => storage_path('app/analytics/service-account-credentials.json'),
        /*
        * The amount of minutes the Google API responses will be cached.
        * If you set this to zero, the responses won't be cached at all.
        */
        'cache_lifetime_in_minutes' => 60 * 24,
        /*
        * Here you may configure the "store" that the underlying Google_Client will
        * use to store it's data.  You may also add extra parameters that will
        * be passed on setCacheConfig (see docs for google-api-php-client).
        *
        * Optional parameters: "lifetime", "prefix"
        */
        'cache' => [
            'store' => 'file',
        ],
    ];

}

