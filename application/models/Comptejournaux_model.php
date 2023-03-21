<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Comptejournaux_model extends CI_model {
    $this->load->model("Fonction_model");

    public function insert_compteJournal($numero,$intutile) {
        if ($numero < 0 || strlen($numero) > 5){
            return 0;
        }
        else {
            try {
                $numero = $this->complement_code($numero);
                $req = "insert into journaux values(default,%s,%s)";
                $req = sprintf($req,$numero,$this->db->escape($intutile));

                $this->db->query($req);
                echo $req;
                return 1;
            } catch (Throwable $th) {
                return 0;
            }
        }
    }

    public function get_all() {
        $req = "select * from journaux";
        $query = $this->db->query($req);
        $valiny = $query->result_array();

        return $valiny;
    }

    public function get_byId($id) {
        $req = "select * journaux where idJournaux = %s";
        $req = sprintf($req,$id);
        echo $req;

        $query = $this->db->query($req);
        $valiny = $query->result_array();

        var_dump($valiny);
    }

    
    public function update($id,$code,$intutile) {
        if ($code < 0 || strlen($code) > 5){
            return 0;
        }
        else {
            $req = "update journaux set code=%s, intitule=%s where idjournaux = %s";
            $req = sprintf($req,$code,$this->db->escape($intutile),$id);
    
            $this->db->query($req);

            echo $req;
        }
    }

    public function delete($id) {
        $journaux = 
        if ($journaux == null) {
            $req = "delete from journaux where idjournaux = %s";
            $req = sprintf($req,$id);
    
            echo $req;
        }
        else {
            echo "misy zavatra ao";
        }
    }
}
?>