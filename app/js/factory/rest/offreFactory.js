/**
         * Created by P10-PCIE-MAF on 02/08/2016.
         */
        /**
         * Created by P10-PCIE-MAF on 01/08/2016.
         */
        PCIE.factory("offreFactory", function( RestService, $q, $http) {
        var rest = RestService.create('/');
        return {
            rechercherOffre : function(idOffre) {
                var deferred = $q.defer();
                rest.get("offre/"+idOffre).then(function(data) {
                    deferred.resolve(data.plain());
                });
                return deferred.promise;
            },

            enregistrerOffre : function(Offre) {
                return rest.all("api/offre/add").post(Offre);
            },

            supprimerOffre: function(idOffre) {
                var deferred = $q.defer();
                rest.get("api/offre/delete/"+idOffre).then(function() {
                    deferred.resolve();
                });
                return deferred.promise;
            },

            mettreAJourOffre : function(idOffre,Offre) {
                var deferred = $q.defer();
                rest.all("api/offre/update/"+idOffre).post(Offre).then(function () {
                    deferred.resolve();
                });
                return deferred.promise;
            },

            rechercherOffres : function () {
				var deffered = $q.defer();
				$http.get('offre').then(function (success){
					deffered.resolve(success.data);
					console.log("success.data.menu",success.data);
				},function (error){
					deferred.reject(error);
					console.log("error",error);
				});
				return deffered.promise;
            },

            rechercherUtilisateursOffre : function(idOffre) {
                var deferred = $q.defer();
                rest.all("api/offre/utilisateurs").get(idOffre).then(function (data) {
                    deferred.resolve(data.plain());
                });
                return deferred.promise;
            },

            rechercherCompetencesOffre : function(idOffre) {
                var deferred = $q.defer();
                rest.get("api/offre/competences/"+idOffre).then(function (data) {
                    deferred.resolve(data.plain());
                });
                return deferred.promise;
            },

            activerCompetence : function (idOffre) {
                var deffered = $q.defer();
                rest.get("api/offre/activer/"+idOffre).then(function () {
                    deffered.resolve();
                });
                return deffered.promise;
            },

            desactiverCompetence : function (idOffre) {
                var deffered = $q.defer();
                rest.get("api/offre/desactiver/"+idOffre).then(function () {
                    deffered.resolve();
                });
                return deffered.promise;
            }
    }
});
