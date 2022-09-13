<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HUB - Detect faces</title>
</head>
<body>
    <div id="uploadedImage">
        <div id="originalImage" style="width: 50%"><img style="max-width: 100%" src="https://www.lobservateur.fr/wp-content/uploads/2022/09/20220910-125058-767.jpg" alt=""></div>
        <div id="resultImage"></div>
    </div>

    <script src="{{ asset('js/images_AI/dist/face-api.js') }}"></script>
    <script src="{{ asset('js/images_AI/detect_face.js') }}"></script>
</body>
</html>