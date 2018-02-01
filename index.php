<?php
require 'vendor/autoload.php';

$app = new \Slim\App();

function getdb()
{
    $connection =
        new PDO(
            "mysql:dbname=todoapi;host=localhost;charset=utf8",
            "root",
            "");


    //$connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

    return $connection;
}
$app->get('/', function ($request, $response, $args) {
    $db = getdb();
    $stmt = $db->prepare("SELECT * FROM user");
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();

    return $response
        ->withStatus(200)
        ->withJson($data);
});

$app->get('/kakukk', function ($request, $response, $args) {
    return $response->withStatus(200)->write('kakukk');
});

$app->get('/hello/{name}', function ($request, $response, $args) {
    return $response
        ->withStatus(200)
        ->write('Hello, '. $args["name"] . ' !');
});

$app->get('/hello/{name}/{name2}', function ($request, $response, $args) {
    return $response
        ->withStatus(200)
        ->write('Hello, '. $args["name"]. ' ' . $args["name2"] . ' !');
});

$app->run();



