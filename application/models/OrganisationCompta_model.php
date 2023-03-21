<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class OrganisationCompta_model extends CI_model {
   public function insert_organisation($dateDebutExercice,$capitale,$nbDecimal,$longueurNumC,$longueurNumCT){
    try {
        $sql="INSERT INTO organisationecompta VALUES(default,'$dateDebutExercice',$capitale,$nbDecimal,$longueurNumC,$longueurNumCT)";
        $this->db->query($sql);
        echo $sql;
        return 1;
    } catch (\Throwable $th) {
        return 0;
        //throw $th;
    }
   }

   function getIdFarany(){
        try {
            $sql="SELECT max(idorganisationcompta) from organisationcompta";
            $result=$this->db->query($sql);
            $count=$result->result_array();
            return $count[0];
        } catch (\Throwable $th) {
            return -1;
            //throw $th;
        }
   }





}

?>