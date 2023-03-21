<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Societe_model extends CI_model {
   public function insert_societe($idOrganisationCompta,$idCaracteristiqueCompta,$nom,$objet,$adresse,$telephone,$email,$dateDeCreation,$siege,$nombreEmployer,$nif,$ns,$nrcs){
      try {
         $sql="INSERT INTO societe VALUES(DEFAULT,$idOrganisationCompta,$idCaracteristiqueCompta,'$nom','$objet','$adresse','$telephone','$email','$dateDeCreation','$siege',$nombreEmployer,'$nif','$ns','$nrcs')"
         $this->db->query($sql);
         return 1;
      } catch (\Throwable $th) {
         return 0;
         //throw $th;
      }
   }

   public function getAllSociete(){
      try {
         $sql="SELECT * from societe";
         $r=$this->db->query($sql);
         $result=$r->result_array();
         return $result;
      } catch (\Throwable $th) {
         return 0;
         //throw $th;
      }
   }

   public function getSociete($id){
      try {
         $sql="SELECT * from societe WHERE idsociete=$id";
         $r=$this->db->query($sql);
         $result=$r->result_array();
         return $result;
      } catch (\Throwable $th) {
         return 0;
         //throw $th;
      }
   }

   public function update($nom,$objet,$adresse,$telephone,$email,$dateDeCreation,$siege,$nombreEmployer,$nif,$ns,$nrcs){
      try {
         $sql="UPDATE societe SET nom='$nom', objet='$objet', "
      } catch (\Throwable $th) {
         //throw $th;
      }
   }
}

?>