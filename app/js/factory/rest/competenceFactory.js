/**
 * Created by P10-PCIE-MAF on 19/08/2016.
 */
PCIE.factory("competenceFactory", function( $http, $q) {
    return {

        enregistrerCompetence: function (competence) {
            var deferred = $q.defer();
            $http.post("api/competence/add/",competence).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        mettreAJourCompetence: function (idCompetence,competence) {
            var deferred = $q.defer();
            $http.post("/api/competence/update/"+idCompetence,competence).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        rechercherCompetences : function() {
            var deferred = $q.defer();
            $http.get("/api/competence").then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        supprimerCompetence: function (idCompetence) {
            var deferred = $q.defer();
            $http.get("/api/competence/delete/"+idCompetence).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        supprimerCompetence: function (idcompetence) {
            var deferred = $q.defer();
            $http.get("api/competence/delete/"+idcompetence).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        supprimerCompetenceOffre: function (idcompetence,idOffre) {
            var deferred = $q.defer();
            $http.get("/api/competence/offre/delete/"+idcompetence+"/"+idOffre).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },
        ajouterCompetenceOffre: function (idcompetence,idOffre) {
            var deferred = $q.defer();
            $http.get("/api/competence/offre/add/"+idcompetence+"/"+idOffre).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        ajouterNiveau: function (idUtilisateur,idOffre,idCompetence,niveau) {
            var deferred = $q.defer();
            $http.get("/api/competence/offre/utilisateur/niveau/add/"+idUtilisateur+"/"+idOffre+"/"+idCompetence+"/"+niveau).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        supprimerNiveau: function (idUtilisateur,idOffre,idCompetence) {
            var deferred = $q.defer();
            $http.get("api/competence/offre/utilisateur/niveau/delete/"+idUtilisateur+"/"+idOffre+"/"+idCompetence).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        rechercherCompetenceNiveau: function (idUtilisateur,idOffre,idCompetence) {
            var deferred = $q.defer();
            $http.get("api/competence/offre/utilisateur/"+idUtilisateur+"/"+idOffre+"/"+idCompetence).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        }
    }
});
