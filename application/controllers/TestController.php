<?php

defined('BASEPATH') OR exit('');

class TestController extends CI_Controller{

    public function __construct(){
        parent::__construct();

        $this->load->model("branches_model");
        $this->load->model("branchesaleitems_model");
        $this->load->model("branchesaletransactions_model");
        $this->load->model("branchexpensetransactions_model");
        $this->load->model("branchitems_model");
        $this->load->model("customers_model");
        $this->load->model("items_model");
        $this->load->model("itemsalescontrol_model");
        $this->load->model("itemsalesrecord_model");
        $this->load->model("revaluationhistory_model");
        $this->load->model("revaluationprofits_model");
        $this->load->model("shipmentitems_model");
        $this->load->model("staff_model");
        $this->load->model("suppliers_model");
        $this->load->model("temporarystorage_model");
        $this->load->model("transactions_model");
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