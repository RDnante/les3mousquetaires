<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Function_model extends CI_model {
    public function upload() {
        $this->load->library("upload");
    
        $valiny = 0;
    
        $config["upload_path"] = "./uploads/";
        echo $config["upload_path"];
        $config["allowed_types"] = "gif|jpg|png|pdf";
        $confiig["max_size"] = "10000";
        $config["max_width"] = "1920";
        $config["max_height"] = "1920";
        $this->upload->initialize($config);
        if(!$this->upload->do_upload('userfile')) {
            $error = array('error' => $this->upload->display_errors());
            // echo "tsy nety ny upload";
            // echo $error['error'];
            $valiny = 0;
        }
        else {
            $data = array('upload_data' => $this->upload->data());
            // echo "nety ny upload";
            // echo $data['upload_data']['file_name'];
            // var_dump($data['upload_data']);
            $valiny = 1;
        }
    
        return $valiny;
    }

    public function complement_code($code) {
        $taille_code = strlen($code);
        $reste = 5 - $taille_code;
        for ($i=0; $i < $reste ; $i++) { 
            $code = $code."0";
        }
        return $code;
    }

    public function espace($string) {

        $position = [];
        for ($i=0; $i < strlen($string) ; $i++) { 
            if (($pos = strpos($string,' ',$i)) !== false) {
                $position[] = $i;
                if ($string[$i+1] != ' ') {
                    break;
                }
            }
        }

        for ($i=0; $i < count($position) ; $i++) { 
            $string[$position[$i]] = '';
        }

        print_r($position);
    }
}
?> 