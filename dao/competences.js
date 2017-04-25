/*
 * GET users listing.
 */

exports.selectAll = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM competence', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.json(rows);

        });

        //console.log(query.sql);
    });

};

exports.selectByIdCompetence = function (req, res) {

    var id = req.params.id;
    console.log(id);

    req.getConnection(function (err, connection) {

        var query = connection.query("SELECT * FROM competence WHERE idCompetence=?", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.json(rows);

        });

        //console.log(query.sql);
    });

};

exports.insertCompetence = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    console.log("input" ,input);

    req.getConnection(function (err, connection) {

        var data = {
            titre : input.titre,
            description: input.description,
        };


        var query = connection.query("INSERT INTO competence set ? ", data, function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/api/competence');


        });

        //console.log(query.sql);
    });

};

exports.updateCompetence = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = {

            titre : input.titre,
            description: input.description,

        };

        var query = connection.query("UPDATE competence set ? WHERE idCompetence = ? ", [data, id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/api/competence');


        });

        //console.log(query.sql);
    });

};

exports.activerCompetence = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query("UPDATE competence set active=1 WHERE idCompetence = ? ", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/api/competence');


        });

        //console.log(query.sql);
    });

};


exports.desactiverCompetence = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query("UPDATE competence set active=0 WHERE idCompetence = ? ", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/api/competence');


        });

        //console.log(query.sql);
    });

};

exports.deleteCompetence = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

      var query = connection.query("DELETE FROM niveau WHERE idCompetence= ? ", [id], function (err, rows) {

          if (err)
              console.log("Error Selecting : %s ", err);

      });

      var query = connection.query("DELETE FROM offre_has_competence WHERE idCompetence= ? ", [id], function (err, rows) {

          if (err)
              console.log("Error Selecting : %s ", err);


      });

        var query = connection.query("DELETE FROM competence  WHERE idCompetence= ? ", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

        });

        res.redirect('/api/competence');



        //console.log(query.sql);
    });

};

exports.supprimerCompetenceOffre = function (req, res) {

    var idcompetence = req.params.idcompetence;
    var idOffre = req.params.idOffre;

    console.log(idcompetence);
    console.log(idOffre);

    req.getConnection(function (err, connection) {

        var query = connection.query("DELETE FROM offre_has_competence WHERE idcompetence=? AND idOffre= ? ", [idcompetence,idOffre], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/api/competence');
        });

        //console.log(query.sql);
    });

};

exports.ajouterCompetenceOffre = function (req, res) {

    var idcompetence = req.params.idcompetence;
    var idOffre = req.params.idOffre;

    console.log(idcompetence);
    console.log(idOffre);

    req.getConnection(function (err, connection) {

        var query = connection.query("SELECT * FROM offre_has_competence WHERE idcompetence=? AND idOffre=?", [idcompetence,idOffre], function (err, rows) {

          if (err)
              console.log("Error Selecting : %s ", err);

          if(rows.length===0){

            var query = connection.query("INSERT INTO offre_has_competence (idcompetence,idOffre) VALUES (?,?) ", [idcompetence,idOffre], function (err, rows) {

                if (err)
                    console.log("Error Selecting : %s ", err);

            });
          }

          res.redirect('/api/competence');
        });
        //console.log(query.sql);
    });

};

exports.ajouterNiveau = function (req, res) {

    var idUtilisateur = req.params.idUtilisateur;
    var idOffre = req.params.idOffre;
    var idcompetence = req.params.idcompetence;
    var niveau = req.params.niveau;

    console.log(idUtilisateur);
    console.log(idOffre);
    console.log(idcompetence);
    console.log(niveau);

    req.getConnection(function (err, connection) {

        var query = connection.query("SELECT * from niveau where idUtilisateur=? AND idOffre=? AND idcompetence=? ", [idUtilisateur,idOffre,idcompetence], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);
                console.log(rows);

            if(rows.length===1){

                console.log("update niveau");
                var query = connection.query("UPDATE niveau SET niveau=? WHERE idUtilisateur=? AND idOffre=? AND idcompetence=?  ", [niveau,idUtilisateur,idOffre,idcompetence], function (err, rows) {

                    if (err)
                        console.log("Error Selecting : %s ", err);
                });
            }else{
                console.log("insert niveau");
                var query = connection.query("INSERT INTO niveau (idUtilisateur,idOffre,idcompetence,niveau) VALUES (?,?,?,?) ", [idUtilisateur,idOffre,idcompetence,niveau], function (err, rows) {

                    if (err)
                        console.log("Error Selecting : %s ", err);
                });
            }

            res.redirect('/api/competence');
        });
    });
};

exports.supprimerNiveau = function (req, res) {

    var idUtilisateur = req.params.idUtilisateur;
    var idOffre = req.params.idOffre;
    var idcompetence = req.params.idcompetence;

    console.log(idUtilisateur);
    console.log(idOffre);
    console.log(idcompetence);

    req.getConnection(function (err, connection) {


        var query = connection.query("DELETE FROM niveau WHERE idUtilisateur=? AND idOffre=? AND idcompetence =?", [idUtilisateur,idOffre,idcompetence], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);
        });

        res.redirect('/api/competence');

    });
};

exports.rechercherCompetenceNiveau = function (req, res) {

    var idUtilisateur = req.params.idUtilisateur;
    var idOffre = req.params.idOffre;
    var idcompetence = req.params.idcompetence;

    console.log(idUtilisateur);
    console.log(idOffre);
    console.log(idcompetence);

    req.getConnection(function (err, connection) {

        var query = connection.query("SELECT * from niveau where idUtilisateur=? AND idOffre=? AND idcompetence=? ", [idUtilisateur,idOffre,idcompetence], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.json(rows);
        });
    });
};


/**
 * Created by P10-PCIE-MAF on 19/08/2016.
 */
