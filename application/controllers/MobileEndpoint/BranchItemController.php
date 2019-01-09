<?php

defined('BASEPATH') OR exit('');
// require(APPPATH '.libraries/REST_Controller.php');
// require('.controllers/TokenManager/TokenManager.php'); ??? Doesn't work ???


class BranchItemController extends CI_Controller{
    public function __construct(){
        parent::__construct();
        
        $this->load->model("Ahafis/branchitems_model","items");

    }

    public function getAllBranchItemsJson($token){

        /*
        //   TODO
             Verify JWT first
        */
        $result = $this->items->get_many_by('BranchId',$token);
        // $json = json_encode($result);
        // echo $json;

        return $this->output
            ->set_content_type('application/json')
            ->set_status_header(200)
            ->set_output(json_encode($result));
    }

    

    public function index(){
        /*
        receives a json object in the body of the format:
            {
                "id":1,
                "password":"xyz"
            }
        */
    }

    public function getReq(){
        return $this->output
        ->set_content_type('application/json')
        ->set_status_header(200)
        ->set_output(json_encode(array(
                'message' => 'Successful get request'
        )));

        // http_response_code(404);
        // echo "Successful get request";
        // echo "<br>";
        // echo "Hello World";
        // return "Successful get request";
    }


}

?>