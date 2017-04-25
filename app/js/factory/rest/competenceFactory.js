/**
 * Created by P10-PCIE-MAF on 19/08/2016.
 */
PCIE.factory("competenceFactory", function( RestService, $q) {
    var rest = RestService.create('/');
    return {

        enregistrerCompetence: function (competence) {
            var deffered = $q.defer();
            rest.all("api/competence/add/").post(competence).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        mettreAJourCompetence: function (idCompetence,competence) {
            var deffered = $q.defer();
            rest.all("api/competence/update/"+idCompetence).post(competence).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        rechercherCompetences : function() {
            var deferred = $q.defer();
            rest.get("api/competence").then(function (data) {
                deferred.resolve(data.plain());
            });
            return deferred.promise;
        },

        supprimerCompetence: function (idCompetence) {
            var deffered = $q.defer();
            rest.all("api/competence/delete/").get(idCompetence).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        supprimerCompetence: function (idcompetence) {
            var deffered = $q.defer();
            rest.get("api/competence/delete/"+idcompetence).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        supprimerCompetenceOffre: function (idcompetence,idOffre) {
            var deffered = $q.defer();
            rest.get("api/competence/offre/delete/"+idcompetence+"/"+idOffre).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        ajouterCompetenceOffre: function (idcompetence,idOffre) {
            var deffered = $q.defer();
            rest.get("api/competence/offre/add/"+idcompetence+"/"+idOffre).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        ajouterNiveau: function (idUtilisateur,idOffre,idCompetence,niveau) {
            var deffered = $q.defer();
            rest.get("api/competence/offre/utilisateur/niveau/add/"+idUtilisateur+"/"+idOffre+"/"+idCompetence+"/"+niveau).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        supprimerNiveau: function (idUtilisateur,idOffre,idCompetence) {
            var deffered = $q.defer();
            rest.get("api/competence/offre/utilisateur/niveau/delete/"+idUtilisateur+"/"+idOffre+"/"+idCompetence).then(function () {
                deffered.resolve();
            });
            return deffered.promise;
        },

        rechercherCompetenceNiveau: function (idUtilisateur,idOffre,idCompetence) {
            var deffered = $q.defer();
            rest.get("api/competence/offre/utilisateur/"+idUtilisateur+"/"+idOffre+"/"+idCompetence).then(function (data) {
                deffered.resolve(data.plain());
            });
            return deffered.promise;
        }
    }
});
