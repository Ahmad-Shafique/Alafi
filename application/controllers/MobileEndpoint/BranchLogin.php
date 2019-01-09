<?php

defined('BASEPATH') OR exit('');
// require(APPPATH '.libraries/REST_Controller.php');
// require('.controllers/TokenManager/TokenManager.php'); ??? Doesn't work ???


class BranchLogin extends CI_Controller{
    public function __construct(){
        parent::__construct();
        
        // $this->load->model("article_model","article");
        // $this->load->model("Ahafis/items_model","items");
        // $this->load->model("Ahafis/items_model","items");
        $this->load->model("Ahafis/admin_model","admins");

    }

    public function loginUsingIdAndPassword(){
        /*
        receives a json object in the body of the format:
            {
                "id":1,
                "password":"xyz"
            }
        */
        $json = $this->security->xss_clean($this->input->raw_input_stream);
        $jsonAsObject = json_decode($json);
        $loginDetails = $this->admins->get($jsonAsObject->id);
        if($loginDetails==null){
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(400)
                ->set_output(json_encode(array(
                        'message' => 'User Id Not Found'
                )));
        }else if($loginDetails->password != $jsonAsObject->password){
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(400)
                ->set_output(json_encode(array(
                        'message' => 'Incorrect Password'
                )));
        }else if($loginDetails->role != 'retail'){
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(400)
                ->set_output(json_encode(array(
                        'message' => 'Incorrect Privilege'
                )));
        }else{
            /*
            Replace with JWT later
            */
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(200)
                ->set_output(json_encode(array(
                        'token' => $loginDetails->id
                )));
            /*
            Replace with JWT later
            */
        }
        // if($loginDetails->pass)
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

    public function getReq(){
        echo "Successful get request";
        // echo "<br>";
        // echo "Hello World";
        // return "Successful get request";
    }

    // public function receiveJsonData($token){
    //     echo $token;
    //     $json = $this->input->raw_input_stream;
    //     echo $json;
    //     // return $json;
    // }
}

?>