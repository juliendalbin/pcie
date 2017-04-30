PCIE.factory("authFactory", function($http, $q) {
    return {
        login: function (user) {
            var deferred = $q.defer();
            $http.post("/auth",user).then(function (success){
                deffered.resolve(success.data);
            },function (error){
                deferred.reject(error);
            });
            return deferred.promise;
        }
    }
});