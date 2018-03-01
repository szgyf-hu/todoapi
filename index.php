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

    $connection->setAttribute(
        PDO::ATTR_EMULATE_PREPARES,
        false);

    $connection->setAttribute(
        PDO::ATTR_STRINGIFY_FETCHES,
        false);

    return $connection;
}

$app->get('/', function ($request, $response, $args) {

    $data = array();
    $data["name"] = "todoapi";
    $data["version"] = "0.1 beta";

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

    if (count($data)>0)
        return $response
            ->withStatus(200)
            ->withJson($data[0]);
    else
        return $response
            ->withStatus(404);
});

///////////////////////////////////////////////////
/// POST
///////////////////////////////////////////////////

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

    $rd = getdb();

    $xx = $rd->prepare('CALL getUserTodos(:gid);');
    $xx->bindParam(":gid",$args["gid"]);
    $xx->execute();
    $ads = $xx->fetchAll(PDO::FETCH_ASSOC);

    return $response
        ->withStatus(200)
        ->withJson($ads);
});

$app->post('/users/{gid}/todos', function ($request, $response, $args) {

    $rd = getdb();

    $xx = $rd->prepare('CALL addUserTodoBygid(:user_gid, :note, :priority, :created_timestamp, @todo_gid);');

    $js = $request->getParsedBody();

    $xx->bindParam(":user_gid",$args["gid"]);
    $xx->bindParam(":note",$js["note"]);
    $xx->bindParam(":priority",$js["priority"]);
    $xx->bindParam(":created_timestamp",$js["created_timestamp"]);
    $xx->execute();
    $xx->closeCursor();

    $output = $rd
        ->query("SELECT @todo_gid;")
        ->fetch(PDO::FETCH_ASSOC);

    return $response
        ->withStatus(200)
        ->withJson($output);
});

$app->put("/todos/{gid}", function ($request, $response, $args) {

    $js = $request->getParsedBody();

    $rd = getdb();
    $xx = $rd->prepare("
UPDATE todo
SET
	note = :note,
    priority = :priority,
    done = :done
WHERE
	gid = :gid");

    $xx->bindParam(":note",$js["note"]);
    $xx->bindParam(":priority",$js["priority"]);
    $xx->bindParam(":done",$js["done"]);
    $xx->bindParam(":gid",$args["gid"]);
    $xx->execute();

    return $response
        ->withStatus(200);
});

$app->post("/usergroup/{gid}",
    function ($request, $response, $args) {

    $js = $request->getParsedBody();

    $rd = getdb();
    $xx = $rd->prepare(
        "CALL addUserToUsergroupBygid(
        :user_gid, :usergroup_gid);");

    $xx->bindParam(":user_gid",
        $js["user_gid"]);
    $xx->bindParam(":usergroup_gid",
        $args["gid"]);
    $xx->execute();

    return $response->withStatus(200);
});

$app->run();



