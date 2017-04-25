/**
 * Created by P10-PCIE-MAF on 22/08/2016.
 */
PCIE.controller('competenceCtrl', function( $scope, competenceService) {

    $scope.competences = [];
    $scope.competence = {};

    $scope.enregistrerCompetence = function(){
        competenceService.enregistrerCompetence(competence);
    };

    $scope.rechercherCompetences = function (){
        competenceService.rechercherCompetences().then(function(data){
            $scope.competences = data;
            console.log($scope.competences);
        });
    };

    $scope.editCompetence=function(competence){
        $scope.mettreAJour = 1;
        $scope.competence = competence;
    };

    $scope.ajouterCompetence=function(competence){
        $scope.mettreAJour = 0;
        $scope.competence = competence;
    };

    $scope.enregistrerCompetence = function(competence){
        if($scope.mettreAJour == 1){
            competenceService.mettreAJourCompetence(competence.idcompetence,competence);
        }else{
            console.log("enregistrer");
            console.log($scope.competence);
            competenceService.enregistrerCompetence(competence);
        }
    };

    $scope.mettreAJourCompetence = function (competence){
        competenceService.mettreAJourCompetence(competence.idcompetence,competence);
    };

    $scope.supprimerCompetenceSweetAlert = function(idCompetence){
      swal({
          title: 'Vous êtes sûr?',
          text: "Supprimer cette compétence, supprimera les données postulants liées à cette compétence!",
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
          competenceService.supprimerCompetence(idCompetence).then(function(){
            swal(
            'Supprimée!',
            'La compétence à été supprimée',
            'success'
          );
        })
        }, function(dismiss) {
          // dismiss can be 'cancel', 'overlay', 'close', 'timer'
          if (dismiss === 'cancel') {
            swal(
              'Annulé',
              'La compétence est conservé',
              'error'
            );
          }
        })
    };

});
