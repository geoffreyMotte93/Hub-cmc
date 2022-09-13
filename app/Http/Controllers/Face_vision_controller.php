<?php

namespace App\Http\Controllers;

use Google\Cloud\Core\ServiceBuilder;
use Illuminate\Http\Request;

class Face_vision_controller extends Controller
{
    public function detectFaces()
    {
        $path = public_path('face-detection.json');
        $cloud = new ServiceBuilder([
            'keyFilePath' => $path,
            'projectId' => 'face-detection-362408'
        ]);
        $vision = $cloud->vision();
        $output = imagecreatefromjpeg(public_path('friends.jpeg'));
        $image = $vision->image(file_get_contents(public_path('friends.jpeg')), ['FACE_DETECTION']);
        //$results = $vision->annotate($image);

        var_dump($image);
    }
}
