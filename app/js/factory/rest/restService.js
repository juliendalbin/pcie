PCIE.factory("RestService", [ "Restangular", "$rootScope", function(Restangular, $rootScope) {
	return {
		create : function(service) {

	        Restangular.setBaseUrl('https://localhost:4300');;

			return Restangular.all(service);
		}, 
	}
}]);
