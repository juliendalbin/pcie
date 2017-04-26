PCIE.factory("RestService", [ "Restangular", "$rootScope", function(Restangular, $rootScope) {
	return {
		create : function(service) {

	        Restangular.setBaseUrl('');;

			return Restangular.all(service);
		}, 
	}
}]);