PCIE.controller('offreCtrl', function($stateParams, $scope, offreService, sessionService, competenceService,$state) {

    $scope.user = sessionService.getUser();
    console.log($scope.user);

    $scope.offre = {};
    $scope.offres = {};
    $scope.utilisateursOffre = {};
    $scope.offreUtilisateur = {};
    $scope.competences = [];
    $scope.idOffre = $stateParams.idOffre;
    var returnedIdOffre;
    $scope.user = sessionService.getUser();
    $scope.selectedCompetences = [];

    $scope.offreCourante = {};

    $scope.searchTerm;
    $scope.clearSearchTerm = function() {
        $scope.searchTerm = '';
    };

    $scope.hoverIn = function(offre){
      console.log("hover in");
      $scope.offreCourante = offre;
      console.log(offre);
    }

    $scope.init = function(){
        $scope.offre = null;
        $stateParams = null;
        competenceService.rechercherCompetences().then(function(data){
            $scope.competences = data;
            console.log($scope.competences);
        });
    };

    $scope.rechercherOffre = function (){

        offreService.rechercherOffre($stateParams.idOffre).then(function(data){
          console.log(data);
            $scope.offre = data;
            $scope.offre.description.replace('\n','<br>');

            offreService.rechercherCompetencesOffre($stateParams.idOffre).then(function(data){
              console.log(data);
              $scope.competences = data;
            });

            offreService.rechercherCompetencesOffre($stateParams.idOffre).then(function(data){
              console.log(data);
              $scope.selectedCompetences = data;
            });
        });
    };

    $scope.rechercherOffres = function (){
        offreService.rechercherOffres().then(function(data){
            $scope.offres = data;
        });
    };

    $scope.enregistrerOffre = function (){

        console.log($scope.competences);
        console.log($scope.selectedCompetences);

        if($stateParams != null){

            //case mettre à jour

            offreService.mettreAJourOffre($stateParams.idOffre,$scope.offre);

        }else {

            //case enregistrer

            offreService.enregistrerOffre($scope.offre).then(function(data){
                returnedIdOffre = data.insertId;
                console.log(returnedIdOffre);
            });
        }

        $scope.competences.forEach(function(competence){
            var selected = false;
            $scope.selectedCompetences.forEach(function(selectedCompetence){
                if(competence.idcompetence == selectedCompetence.idcompetence){
                    selected = true;
                    if($stateParams != null) {
                        competenceService.ajouterCompetenceOffre(selectedCompetence.idcompetence, $stateParams.idOffre);
                    }else{
                        competenceService.ajouterCompetenceOffre(selectedCompetence.idcompetence, returnedIdOffre);
                    }
                }
            })
            if(selected == false) {
                if($stateParams != null) {
                    competenceService.supprimerCompetenceOffre(competence.idcompetence, $stateParams.idOffre);
                }
            }
        })

        $state.go('root.carriere.espaceRH');

    };

    $scope.supprimerOffre = function(idOffre){
      offreService.supprimerOffre(idOffre);
    };


    $scope.supprimerCompetence = function(id){
        competenceService.supprimerCompetence(idCompetence)
    };

    $scope.rechercherUtilisateursOffre = function(){
        offreService.rechercherUtilisateursOffre($stateParams.idOffre).then(function(data){
            $scope.utilisateursOffre = data;
        });
    };

    $scope.activerOffre = function(idOffre){
        offreService.activerOffre(idOffre);
    };

    $scope.desactiverOffre = function(idOffre){
        offreService.desactiverOffre(idOffre);
    };

    $scope.supprimerOffreSweetAlert = function(idOffre){
      swal({
          title: 'Vous êtes sûr?',
          text: "Supprimer cette offre, supprimera toutes les données postulants liées à cette offre!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Oui, supprimer!',
          cancelButtonText: 'Non, conserver!',
          confirmButtonClass: 'btn btn-success',
          cancelButtonClass: 'btn btn-danger',
          buttonsStyling: false
        }).then(function() {
            offreService.supprimerOffre(idOffre).then(function(){
            swal(
            'Supprimée!',
            'L offre à été supprimée',
            'success'
          );
        })
        }, function(dismiss) {
          // dismiss can be 'cancel', 'overlay', 'close', 'timer'
          if (dismiss === 'cancel') {
            swal(
              'Annulé',
              'L offre est conservé',
              'error'
            );
          }
        })
    };

});
