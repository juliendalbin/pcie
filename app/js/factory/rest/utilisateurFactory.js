/**
 * Created by P10-PCIE-MAF on 01/08/2016.
 */
PCIE.factory("utilisateurFactory", function($http, $q) {
    return {

        enregistrerPasswordUtilisateur: function (password,idUtilisateur) {
            var deferred = $q.defer();
            $http.get("savePasswordUtilisateur/"+password+"/"+idUtilisateur).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        rechercherUtilisateurByMail: function (mail) {
            var deferred = $q.defer();
            $http.get("utilisateurByMail/"+mail).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        rechercherUtilisateur: function (idUtilisateur) {
            var deferred = $q.defer();
            $http.get("api/utilisateur/"+idUtilisateur).then(function (success){
                deferred.resolve(success.data.plain());
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        enregistrerUtilisateur: function (utilisateur) {
            var deferred = $q.defer();
            $http.post("api/utilisateur/add",utilisateur).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },
        mettreAJourUtilisateur: function (idUtilisateur, data ) {
            var deferred = $q.defer();
            $http.post("api/utilisateur/update/" + idUtilisateur,data).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        rechercherOffresUtilisateur: function (idUtilisateur) {
            var deferred = $q.defer();
            $http.get("api/utilisateur/offres/"+idUtilisateur).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        mettreAJourOffreUtilisateur: function (idUtilisateur, idOffre, data ) {
            var deferred = $q.defer();
            $http.post("api/utilisateur/offre/update/" + idUtilisateur + "/" + idOffre,data).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        mettreAJourCommentaireCandidat: function (idUtilisateur, data ) {
            var deferred = $q.defer();
            $http.post("api/utilisateur/candidat/update/" + idUtilisateur,data).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        enregistrerOffreUtilisateur: function (idUtilisateur,idOffre,data) {
            var deferred = $q.defer();
            $http.post("api/utilisateur/offre/add/" + idUtilisateur + "/" + idOffre,data).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        supprimerOffreUtilisateur: function (idUtilisateur,idOffre) {
            var deferred = $q.defer();
            $http.get("api/utilisateur/offre/delete/" + idUtilisateur + "/" + idOffre).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        offreUtilisateurExist: function (idUtilisateur,idOffre) {
            var deferred = $q.defer();
            $http.get("api/utilisateur/offre/exist/"+idUtilisateur + "/" + idOffre).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        rechercherOffresNonPostulees: function (idUtilisateur) {
            var deferred = $q.defer();
            $http.get("api/utilisateur/offre/nonPostulees/"+idUtilisateur).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        },

        enregistrerCandidatureSpontanee: function (utilisateur) {
            var deferred = $q.defer();
            $http.post("api/utilisateur/candidatureSpontanee",utilisateur).then(function (success){
                deferred.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        }
    }
})
