PCIE.controller('navBarCtrl', function ($scope, $rootScope, $location, $anchorScroll, LocalFactory, anchorService) {
    "use strict";

    $scope.headerMenu = LocalFactory.menu();
    console.log("$scope.headerMenu",$scope.headerMenu);
    $scope.sousMenu = getSousMenu($location.url());

    $scope.scrollTo = function (anchor) {
        $anchorScroll(anchor);
    };

    $rootScope.$on("$locationChangeSuccess", function () {
        $scope.sousMenu = getSousMenu($location.url());
        let anchor = anchorService.getAnchor();
        if (anchor != null) {
            $anchorScroll(anchor);
        }
    });

    function getSousMenu(url) {
        let prefix = '/';
        for (var i = 0; i < $scope.headerMenu.length; i++) {
            if (prefix + $scope.headerMenu[i].url === url) {
                return $scope.headerMenu[i].souscategorie;
            }
        }
    }
});