PCIE.factory("LocalFactory", function ($http, $q) {
    return {
        menu: function () {
            var deffered = $q.defer();
            $http.get('data/menu.json').then(function (success){
            	deffered.resolve(success.data.menu);
            	console.log("success.data.menu",success.data.menu);
  			},function (error){
  				deferred.reject(error);
  				console.log("error",error);
   			});
            return deffered.promise;
        }
    }
});