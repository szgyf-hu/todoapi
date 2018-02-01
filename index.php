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

$app->get('/users/{gid}', function ($request, $response, $args) {

    $ab = getdb();
    $xyz = $ab->prepare(
        "SELECT * FROM user WHERE gid = :pgid");
    $xyz->bindParam(":pgid", $args["gid"]);
    $xyz->execute();

    $data = $xyz->fetchAll(PDO::FETCH_ASSOC);
    $xyz->closeCursor();

    return $response
        ->withStatus(200)
        ->withJson($data);
});

$app->post('/users', function ($request, $response, $args) {

    $so = getdb();
    $ff = $so->prepare(
        "CALL addUser(:name, :username, :pwdhash);");
    $o = $request->getParsedBody();
    $kamu = 'abc';
    $ff->bindParam(":name",$o["name"]);
    $ff->bindParam(":username",$o["username"]);
    $ff->bindParam(":pwdhash",$kamu);
    $ff->execute();

    return $response
        ->withStatus(200)
        ->write(
                print_r($request->getParsedBody())
            );
});

$app->get('/users/{gid}/todos', function ($request, $response, $args) {

    $args["gid"]

    $rd = getdb();

});


$app->run();



