<?php

defined('BASEPATH') OR exit('');
// require(APPPATH '.libraries/REST_Controller.php');
// require('.controllers/TokenManager/TokenManager.php'); ??? Doesn't work ???


class BranchLogin extends CI_Controller{
    public function __construct(){
        parent::__construct();
        
        // $this->genlib->checkLogin();
        
        // $this->genlib->superOnly();
        
        $this->load->model("article_model","article");
        $this->load->model("items_model","items");


        // $this->load->database();

        // $this->load->helper('url');

        // $this->load->library('Grocery_CRUD');
    }


    public function getArticle(){
        $row = $this->article->get(2);   
        echo $row->body;
    }

    public function getItem(){
        $row = $this->items->get(2);   
        echo $row->name;
    }

    // public function Login(){
    //     $json = $this->security->xss_clean($this->input->raw_input_stream);
    //     $jsonAsObject = json_decode($json);
    //     // echo $jsonAsObject->id;
    //     // echo "<br>";
    //     // echo $jsonAsObject->password;
    //     // $token = TokenManager->generateToken($json);
    //     $token = '011000010110100001100001011001100110100101110011';
    //     echo $token;
    //     // echo ~ $token;
    //     // $this->output($token, 200);
    //     http_response_code(200);
    // }

    // public function decodeToken($token){
        
    // }

    // public function returnItems(){
    //     echo $this->items->get_all();
    // }

    // // public function checkGroceryRender(){
    // //     $crud = new grocery_CRUD();
    // //     // $this->$grocery_crud->set_table('employees');
    // //     $crud->set_table('employees');
    // //     $output = $crud->Grocery_CRUD->render();
    // //     echo "<pre>";
    // //     print_r($output);
    // //     echo "</pre>";
    // //     die();
    // // }

    // public function getReq(){
    //     echo "Successful get request";
    //     // echo "<br>";
    //     echo "Hello World";
    //     // return "Successful get request";
    // }

    // public function receiveJsonData($token){
    //     echo $token;
    //     $json = $this->input->raw_input_stream;
    //     echo $json;
    //     // return $json;
    // }
}

?>