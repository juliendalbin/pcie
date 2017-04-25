/**
 * Created by P10-PCIE-MAF on 19/08/2016.
 */
PCIE.service('competenceService', function(competenceFactory) {

    this.enregistrerCompetence = function (competence){
        competenceFactory.enregistrerCompetence(competence);
    };

    this.supprimerCompetence = function (idCompetence){
        competenceFactory.supprimerCompetence(idCompetence);
    };

    this.rechercherCompetences = function (){
        return competenceFactory.rechercherCompetences().then(function (data) {
            return data;
        });
    };

    this.mettreAJourCompetence = function (idCompetence,competence){
        competenceFactory.mettreAJourCompetence(idCompetence,competence);
    };

    this.supprimerCompetence =function(idCompetence){
      return competenceFactory.supprimerCompetence(idCompetence).then(function(){
      });
    }

    this.supprimerCompetenceOffre = function(idCompetence,idOffre){
        competenceFactory.supprimerCompetenceOffre(idCompetence,idOffre);
    };

    this.ajouterCompetenceOffre = function(idCompetence,idOffre){
        competenceFactory.ajouterCompetenceOffre(idCompetence,idOffre);
    };

    this.ajouterNiveau = function(idUtilisateur,idOffre,idCompetence,niveau){
        competenceFactory.ajouterNiveau(idUtilisateur,idOffre,idCompetence,niveau);
    };

    this.supprimerNiveau = function(idUtilisateur,idOffre,idCompetence){
        competenceFactory.supprimerNiveau(idUtilisateur,idOffre,idCompetence);
    };

    this.rechercherCompetenceNiveau = function(idUtilisateur,idOffre,idCompetence){
        return competenceFactory.rechercherCompetenceNiveau(idUtilisateur,idOffre,idCompetence).then(function (data) {
            return data;
        });
    };
});
