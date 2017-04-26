PCIE.factory("LocalFactory", function ($http, $q) {
    return {
        menu: function () {
            $http.get('data/menu.json').then(function (response) {
                return response.menu;
            })
        }
    }
});