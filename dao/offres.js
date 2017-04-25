/*
 * GET users listing.
 */

exports.selectAll = function (req, res) {

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT * FROM offre', function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);
            res.json(rows);
        });
    });

};


exports.selectUtilisateursFromOffre = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT u.*, o.*, uo.* FROM utilisateur u, offre o, utilisateur_has_offre uo WHERE o.idOffre = ? AND o.idOffre = uo.idOffre AND uo.idUtilisateur = u.idUtilisateur;', [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.json(rows);


        });

        //console.log(query.sql);
    });

};


exports.selectCompetencesFromOffre = function (req, res) {

    var idOffre = req.params.idOffre;

    req.getConnection(function (err, connection) {

        var query = connection.query('SELECT c.* FROM competence c, offre o, offre_has_competence oc WHERE o.idOffre = ? AND o.idOffre = oc.idOffre AND oc.idCompetence = c.idCompetence;', [idOffre], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            console.log(rows);

            res.json(rows);

        });

        //console.log(query.sql);
    });

};


exports.selectByIdOffre = function (req, res) {

    var id = req.params.id;
    console.log(id);

    req.getConnection(function (err, connection) {


        var query = connection.query("SELECT * FROM offre WHERE idOffre=?", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.json(rows);


        });

        //console.log(query.sql);
    });

};

exports.insertOffre = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    console.log(input);

    req.getConnection(function (err, connection) {

        var data = {

            titre : input.titre,
            nbDePostes : input.nbDePostes,
            typeDeContrat : input.typeDeContrat,
            statut : input.statut,
            ville_offre : input.ville_offre ,
            code_postal_offre : input.code_postal_offre ,
            zoneDeDeplacement : input.zoneDeDeplacement,
            salaire_offre : input.salaire_offre,
            experience : input.experience,
            suivi : input.suivi,
            description : input.description,
            active : input.active,
            refApec: input.refApec,
            datePublication: input.datePublication,
            dateActualisation: input.dateActualisation
        };

        var query = connection.query("INSERT INTO offre set ? ", data, function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.json(rows);

        });

        //console.log(query.sql);
    });

};

exports.updateOffre = function (req, res) {

    var input = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var data = {

            titre : input.titre,
            nbDePostes : input.nbDePostes,
            typeDeContrat : input.typeDeContrat,
            statut : input.statut,
            ville_offre : input.ville_offre ,
            code_postal_offre : input.code_postal_offre ,
            zoneDeDeplacement : input.zoneDeDeplacement,
            salaire_offre : input.salaire_offre,
            experience : input.experience,
            suivi : input.suivi,
            description : input.description,
            active : input.active,
            refApec: input.refApec,
            datePublication: input.datePublication,
            dateActualisation: input.dateActualisation

        };

        var query = connection.query("UPDATE offre set ? WHERE idOffre = ? ", [data, id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/offre');


        });

        //console.log(query.sql);
    });

};

exports.activerOffre = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query("UPDATE offre set active=1 WHERE idOffre = ? ", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/offre');

        });

        //console.log(query.sql);
    });

};

exports.desactiverOffre = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

        var query = connection.query("UPDATE offre set active=0 WHERE idOffre = ? ", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err);

            res.redirect('/offre');

        });

        //console.log(query.sql);
    });

};

exports.deleteOffre = function (req, res) {

    var id = req.params.id;

    req.getConnection(function (err, connection) {

      var query = connection.query("DELETE FROM niveau WHERE idOffre=? ", [id], function (err, rows) {

          if (err)
              console.log("Error Selecting : %s ", err)
      });

      var query = connection.query("DELETE FROM utilisateur_has_offre  WHERE idOffre= ? ", [id], function (err, rows) {

          if (err)
              console.log("Error Selecting : %s ", err)
      });

      var query = connection.query("DELETE FROM offre_has_competence  WHERE idOffre= ? ", [id], function (err, rows) {

          if (err)
              console.log("Error Selecting : %s ", err)
      });

      var query = connection.query("DELETE FROM offre  WHERE idOffre= ? ", [id], function (err, rows) {

            if (err)
                console.log("Error Selecting : %s ", err)

            res.redirect('/offre');

      });

        //console.log(query.sql);
    });

};
