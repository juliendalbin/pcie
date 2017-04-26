PCIE.factory("LocalFactory", function ($http, $q) {
    return $http.get('data/menu.json');
});