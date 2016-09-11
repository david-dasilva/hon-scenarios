var express = require('express');
var app = express();
app.listen(3000);
mysql = require('mysql'),
    connectionpool = mysql.createPool({
        host: 'localhost',
        user: 'root',
        password: 'pass',
        database: 'hon_scenarios'
    });

console.log("App listening on port 3000");

// respond with "hello world" when a GET request is made to the homepage
app.get('/', function(req, res) {
    res.send('hello world');
});

app.post('/', function(req, res) {
    res.send('POST request to the homepage');
});

app.get('/scenarios', function(req, res) {

    connectionpool.getConnection(function(err, connection) {
        if (err) {
            console.error('CONNECTION error: ', err);
            res.statusCode = 503;
            res.send({
                result: 'error',
                err: err.code
            });
        } else {
            // query the database using connection
            connection.query('SELECT * FROM scenarios ORDER BY nom_scenario DESC', function(err, rows, fields) {
                if (err) {
                    console.error(err);
                    res.statusCode = 500;
                    res.send({
                        result: 'error',
                        err: err.code
                    });
                }
                res.send({
                    result: 'success',
                    err: '',
                    json: rows,
                    length: rows.length
                });
                connection.release();
            });
        }
    });
});


app.get('/users', function(req, res) {

    connectionpool.getConnection(function(err, connection) {
        if (err) {
            console.error('CONNECTION error: ', err);
            res.statusCode = 503;
            res.send({
                result: 'error',
                err: err.code
            });
        } else {
            // query the database using connection
            connection.query('SELECT * FROM users ORDER BY id_user DESC', function(err, rows, fields) {
                if (err) {
                    console.error(err);
                    res.statusCode = 500;
                    res.send({
                        result: 'error',
                        err: err.code
                    });
                }
                res.send({
                    result: 'success',
                    err: '',
                    json: rows,
                    length: rows.length
                });
                connection.release();
            });
        }
    });
});

app.get('/user/:userId/collection', function(req, res) {

    connectionpool.getConnection(function(err, connection) {
        if (err) {
            console.error('CONNECTION error: ', err);
            res.statusCode = 503;
            res.send({
                result: 'error',
                err: err.code
            });
        } else {
            // query the database using connection
            connection.query('SELECT * FROM user_collection WHERE id_user=' + req.params.userId, function(err, rows, fields) {
                if (err) {
                    console.error(err);
                    res.statusCode = 500;
                    res.send({
                        result: 'error',
                        err: err.code
                    });
                }
                res.send({
                    result: 'success',
                    err: '',
                    json: rows,
                    length: rows.length
                });
                connection.release();
            });
        }
    });

});

app.get('/user/:userId/scenarios', function(req, res) {

    connectionpool.getConnection(function(err, connection) {
        if (err) {
            console.error('CONNECTION error: ', err);
            res.statusCode = 503;
            res.send({
                result: 'error',
                err: err.code
            });
        } else {
            // query the database using connection
            connection.query('SELECT DISTINCT scenarios.nom_scenario FROM hon_scenarios.scenario_prerequis, scenarios '+
            'WHERE scenarios.id_scenario = scenario_prerequis.id_scenario AND'+
            '    EXISTS ('+
            '            SELECT * FROM hon_scenarios.user_collection, users'+
            '            WHERE user_collection.id_addon = scenario_prerequis.id_addon'+
            '            AND user_collection.id_user = users.id_user'+
            '            AND users.id_user = ' + req.params.userId+')', function(err, rows, fields) {
                if (err) {
                    console.error(err);
                    res.statusCode = 500;
                    res.send({
                        result: 'error',
                        err: err.code
                    });
                }
                res.send({
                    result: 'success',
                    err: '',
                    json: rows,
                    length: rows.length
                });
                connection.release();
            });
        }
    });

});
