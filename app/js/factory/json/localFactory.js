PCIE.factory("LocalFactory", function ($http, $q) {
    return {
        menu: function () {
            var deffered = $q.defer();
            $http.get('data/menu.json').then(function (success){
            	deffered.resolve(success.menu);
            	console.log("success",success);
  			},function (error){
  				deferred.reject(error);
  				console.log("error",error);
   			});
            return deffered.promise;
        }
    }
});