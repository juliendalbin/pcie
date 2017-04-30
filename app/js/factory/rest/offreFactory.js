/**
         * Created by P10-PCIE-MAF on 02/08/2016.
         */
        /**
         * Created by P10-PCIE-MAF on 01/08/2016.
         */
        PCIE.factory("offreFactory", function($q, $http) {
        return {
            rechercherOffre : function(idOffre) {
                var deferred = $q.defer();
                $http.get("/offre/"+idOffre).then(function(success){
					deffered.resolve(success.data);
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            },

            enregistrerOffre : function(Offre) {
                var deferred = $q.defer();
                $http.post("/api/offre/add",Offre).then(function (success){
                	deffered.resolve(success.data);
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            },

            supprimerOffre: function(idOffre) {
                var deferred = $q.defer();
                $http.get("/api/offre/delete/"+idOffre).then(function(success){
					deffered.resolve(success.data);
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            },

            mettreAJourOffre : function(idOffre,Offre) {
                var deferred = $q.defer();
                $http.post("api/offre/update/"+idOffre,Offre).then(function (success){
                	deffered.resolve(success.data);
				},function (error){
					deferred.reject(error);
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
                $http.get("/api/offre/utilisateurs"+idOffre).then(function (success){
                	deffered.resolve(success.data);
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            },

            rechercherCompetencesOffre : function(idOffre) {
                var deferred = $q.defer();
                $http.get("/api/offre/competences/"+idOffre).then(function (success){
                	deffered.resolve(success.data.plain());
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            },

            activerCompetence : function (idOffre) {
                var deffered = $q.defer();
                $http.get("/api/offre/activer/"+idOffre).then(function (success){
                	deffered.resolve(success.data.plain());
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            },

            desactiverCompetence : function (idOffre) {
                var deffered = $q.defer();
                $http.get("/api/offre/desactiver/"+idOffre).then(function (success){
                	deffered.resolve(success.data.plain());
				},function (error){
					deferred.reject(error);
				});
                return deferred.promise;
            }
    }
});
