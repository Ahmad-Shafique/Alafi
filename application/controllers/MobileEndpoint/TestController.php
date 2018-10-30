<?php

defined('BASEPATH') OR exit('');

class TestController extends CI_Controller{

    public function __construct(){
        parent::__construct();

        $this->load->model("Ahafis/branches_model");
        $this->load->model("Ahafis/branchesaleitems_model");
        $this->load->model("Ahafis/branchesaletransactions_model");
        $this->load->model("Ahafis/branchexpensetransactions_model");
        $this->load->model("Ahafis/branchitems_model");
        $this->load->model("Ahafis/customers_model");
        $this->load->model("Ahafis/items_model");
        $this->load->model("Ahafis/itemsalescontrol_model");
        $this->load->model("Ahafis/itemsalesrecord_model");
        $this->load->model("Ahafis/revaluationhistory_model");
        $this->load->model("Ahafis/revaluationprofits_model");
        $this->load->model("Ahafis/shipmentitems_model");
        $this->load->model("Ahafis/staff_model");
        $this->load->model("Ahafis/suppliers_model");
        $this->load->model("Ahafis/temporarystorage_model");
        $this->load->model("Ahafis/transactions_model");
    }

    public function get(){
        echo "Got Hello World";
    }

    public function test(){
        $row = $this->branches_model->get(1);   
        echo $row->Id;
        $row = $this->items_model->get(1);   
        echo $row->id;
        // $row = $this->branchesaleitems_model->get(1);   
        // echo $row->TransactionId;
        $row = $this->branchesaletransactions_model->get(1);   
        echo $row->Id;
        $row = $this->branchexpensetransactions_model->get(1);   
        echo $row->Id;
        // $row = $this->branchitems_model->get(1);   
        // echo $row->ItemId;
        // $row = $this->itemsalescontrol_model->get(1);   
        // echo $row->Id;
        // $row = $this->itemsalesrecord_model->get(1);   
        // echo $row->Id;
        // $row = $this->revaluationhistory_model->get(1);   
        // echo $row->Id;
        $row = $this->revaluationprofits_model->get(1);   
        echo $row->Id;
        // $row = $this->shipmentitems_model->get(1);   
        // echo $row->Id;
        // $row = $this->staff_model->get(1);   
        // echo $row->Id;
        $row = $this->suppliers_model->get(1);   
        echo $row->Id;
        // $row = $this->temporarystorage_model->get(1);   
        // echo $row->Id;
        $row = $this->transactions_model->get(1);   
        echo $row->Id;
        
    }



}
?>