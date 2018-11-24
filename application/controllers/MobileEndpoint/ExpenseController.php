<?php

class ExpenseController extends CI_Controller{
    
    public function __construct(){
        parent::__construct();
        
        $this->load->model("Ahafis/branches_model","branch");
        $this->load->model("Ahafis/branchexpensetransactions_model","expense");

    }

    public function getBranchId($requestId){
        $row = $this->branch->get_by('BranchManagerId', $requestId);
        return $row->Id;
    }

    public function recordExpense($token){

        /**
         * Receives a JSON object of these formats:
         * {
         * "AmountInDinars":20,
         * "Reason":"xyz reason"
         * }
         */

        /*
        //   TODO
             Verify JWT first
        */
        $id=$token;
        /*
        //   TODO
             ID comes from jwt token
        */

        /*
        // Check authorization
        */
        $branchId = $this->getBranchId($id);
        
        /*
        // Proceed with entry into DB
        */

        
        if($branchId != 0){
            /*
            // Get branchId, insert !!!
            */
            $json = $this->security->xss_clean($this->input->raw_input_stream);
            $jsonAsObject = json_decode($json);


            $timezone = date_default_timezone_get();

            $this->expense->insert(array(
                'AmountInDinars'=>$jsonAsObject->AmountInDinars, 'Reason'=> $jsonAsObject->Reason,
                'BranchId'=>$branchId, 'DateAdded'=>date('YYYY-MM-DD',time()), 'AddedById'=>$id,
                'LastModifiedDate'=>date('YYYY-MM-DD'), 'LastModifiedID'=>$id
            ), FALSE);         
            echo "successful";

        }else{
            echo "Incorrect privilege";
        }

    }
}

?>