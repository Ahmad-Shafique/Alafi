<?php

defined('BASEPATH') OR exit('');
// require(APPPATH '.libraries/REST_Controller.php');
// require('.controllers/TokenManager/TokenManager.php'); ??? Doesn't work ???


class RetailSaleController extends CI_Controller{
    public function __construct(){
        parent::__construct();
        
        $this->load->model("Ahafis/customers_model","customers");
        $this->load->model("Ahafis/branchesaleitems_model","sale_items");
        $this->load->model("Ahafis/branchesaletransactions_model","sale");
        $this->load->model("Ahafis/branchitems_model","inventory");
        $this->load->model("Ahafis/branches_model","branch");

    }

    public function getBranchId($requestId){
        $row = $this->branch->get_by('BranchManagerId', $requestId);
        return $row->Id;
    }

    public function insertIntoBranchSaleItems($TransactionId, $ItemId, $Quantity, $UnitPrice, $ExpectedSaleMargin,
    $Profit, $DateAdded, $AddedById, $LastModifiedDate, $LastModifiedID){

        $insert_id = $this->sale_items->insert(array(
            'TransactionId'=>$TransactionId, 'ItemId'=> $ItemId, 'Quantity'=>$Quantity, 'UnitPrice'=>$UnitPrice,
            'ExpectedSaleMargin'=>$ExpectedSaleMargin, 'Profit'=>$Profit, 'DateAdded'=>$DateAdded,
            'AddedById'=>$AddedById, 'TransactionId'=>$TransactionId, 'LastModifiedID'=>$LastModifiedID
        ), FALSE);
    }

    public function insertIntoBranchSaleTransactions(){

    }

    public function makeASale($token){

        /**
         * Receives a JSON object of these formats:
         * Cash sale:
         * {
         * "Type":"cash",
         * "TotalCost":123,
         * "TotalProfit":2.75,
         * "Items":[{"Id":1,"UnitPrice":23,"SaleMargin":23.5,"Quantity":10}]
         * }
         * 
         * Credit sale:
         * {
         * "Type":"mixed",
         * "Cash":23,
         * "TotalCost":123,
         * "TotalProfit":2.75,
         * "Items":[{"Id":1,"UnitPrice":23,"SaleMargin":23.5,"Quantity":10},{"Id":1,"UnitPrice":23,"SaleMargin":23.5,"Quantity":10}]
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
            // Separate the individual items. Make a main object entry in branchesaletransactions
            // separate entries for each individual item
            // Modify branch item inventory
            // Modify branch total profit
            */
            $json = $this->security->xss_clean($this->input->raw_input_stream);
            $jsonAsObject = json_decode($json);
            $items = $jsonAsObject->Items;

            $timezone = date_default_timezone_get();

            $insert_id=0;
            if($jsonAsObject->Type == "cash"){
                
                $insert_id = $this->sale->insert(array(
                    'BranchId'=>$branchId, 'CashSale'=>TRUE, 'CustomerId'=>'0',  
                    'Cash'=>$jsonAsObject->TotalCost, 'Credit'=>'0', 'TotalCost'=>$jsonAsObject->TotalCost,
                    'TotalProfit'=>$jsonAsObject->TotalProfit, 'DateAdded'=>date('YYYY-MM-DD',time()),
                    'AddedById'=>$id, 'LastModifiedDate'=>date('YYYY-MM-DD',time()),
                    'LastModifiedID'=>$id
                ), FALSE);
            }else{
                $insert_id = $this->sale->insert(array(
                    'BranchId'=>$jsonAsObject->branchId, 'CashSale'=>FALSE, 'CustomerId'=>$jsonAsObject->CustomerId,  
                    'Cash'=>$jsonAsObject->Cash, 'Credit'=>$jsonAsObject->TotalCost-$jsonAsObject->Cash, 'TotalCost'=>$jsonAsObject->TotalCost,
                    'TotalProfit'=>$jsonAsObject->TotalProfit, 'DateAdded'=>date('YYYY-MM-DD',time()),
                    'AddedById'=>$id, 'LastModifiedDate'=>date('YYYY-MM-DD',time()),
                    'LastModifiedID'=>$id
                ), FALSE);
            }

            foreach($items as $item){
                $this->insertIntoBranchSaleItems($insert_id, $item->Id, $item->Quantity, $item->UnitPrice, 
                0, 0, date('YYYY-MM-DD',time()), $id, date('YYYY-MM-DD',time()), $id);


                $result = $this->inventory->get_many_by('BranchId', $branchId);
                foreach($result as $roww){
                    if($roww->ItemId == $item->Id){
                        $remainder = $roww->AmountAvailable - $item->Quantity;
                        $this->inventory->update($roww->Id, array('AmountAvailable'=>$remainder));
                        break;
                    }
                }
            }

            $branchRow = $this->branch->get($branchId);  
            $newBranchProfit = $branchRow->TotalProfitInDinars + $jsonAsObject->TotalProfit;
            $update_id = $this->branch->update($branchId, array('TotalProfitInDinars'=>$newBranchProfit));
            
            echo "success";

        }else{
            echo "Incorrect privilege";
        }







    }





}

?>