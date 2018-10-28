<?php

defined('BASEPATH') OR exit('');
// require(APPPATH '.libraries/REST_Controller.php');


class BranchLogin extends CI_Controller{
    public function __construct(){
        parent::__construct();
        
        // $this->genlib->checkLogin();
        
        // $this->genlib->superOnly();
        
        // $this->load->model(['admin']);
    }

    public function Login(){
        $json = $this->input->raw_input_stream;
        $parsedJson;
        if($parsedJson = json_decode($json)){
            echo "Inside if condition";
            $id = $parsedJson['id'];
            $pass = $parsedJson['password'];

            echo "User Id: ". $id . " <br> Password: " . $pass;
        }else{
            echo "Invalid Login";
        }
        echo "Outside if condition";
    }

    public function decodeToken($token){
        
    }

    public function getReq(){
        echo "Successful get request";
        // echo "<br>";
        echo "Hello World";
        // return "Successful get request";
    }

    public function receiveJsonData($token){
        echo $token;
        $json = $this->input->raw_input_stream;
        echo $json;
        // return $json;
    }
}

?>