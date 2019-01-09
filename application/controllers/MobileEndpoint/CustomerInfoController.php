<?php

defined('BASEPATH') OR exit('');
// require(APPPATH '.libraries/REST_Controller.php');
// require('.controllers/TokenManager/TokenManager.php'); ??? Doesn't work ???


class CustomerInfoController extends CI_Controller{
    public function __construct(){
        parent::__construct();
        
        $this->load->model("Ahafis/customers_model","customers");

    }

    public function getAllCustomersAsJson($token){

        /*
        //   TODO
             Verify JWT first
        */

        $result = $this->customers->get_all();
        // $json = json_encode($result);
        // echo $json;
        return $this->output
                ->set_content_type('application/json')
                ->set_status_header(200)
                ->set_output(json_encode($result));
    }

    public function insertCustomerDetailsIntoDB($Name, $MobileNumber, $AddedById, $TotalPurchaseInDinars=0, 
    $CreditAmountInDinars=0){
    
        $timezone = date_default_timezone_get();
        $insert_id = $this->customers->insert(array
        ('Name'=>$Name, 'MobileNumber'=>$MobileNumber, 'TotalPurchaseInDinars'=>$TotalPurchaseInDinars,
        'CreditAmountInDinars'=>$CreditAmountInDinars, 'DateAdded'=>date('YYYY-MM-DD'), 'LastModifiedDate'=>date('YYYY-MM-DD'),
        'LastModifiedID'=>$AddedById, 'AddedById'=>$AddedById), 
        FALSE);
        return $insert_id;
    }

    public function registerRegularCustomer($token){
        /*
        receives a json object in the body of the format:
            {
                "Name":"xyz",
                "MobileNumber":"12332323"
            }
        */
        $json = $this->security->xss_clean($this->input->raw_input_stream);
        $jsonAsObject = json_decode($json);
        
        if($this->insertCustomerDetailsIntoDB($jsonAsObject->Name, $jsonAsObject->MobileNumber,$token) > 0){
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(200)
                ->set_output(json_encode(array(
                    'message' => 'Success'
                )));
        }else{
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(400)
                ->set_output(json_encode(array(
                    'message' => 'Failed to insert'
                )));
        }
        
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
        echo "Successful get request";
        // echo "<br>";
        // echo "Hello World";
        // return "Successful get request";
    }


}

?>