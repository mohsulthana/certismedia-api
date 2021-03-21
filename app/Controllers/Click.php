<?php

namespace App\Controllers;

use App\Models\Click_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Click extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Click_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function fetchFromAPI()
  {
    $clickModel = new Click_model();
    $days   = date('Y-m-d', strtotime("-7 day"));
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,line_name,creative_name,creative_size,inventory_name,exchange_name,country&metrics=clicks&startdate=$days&granularity=hour");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');

    $headers = array();
    $headers[] = 'Authorization: Basic Y20xMDU2QGNlcnRpc21lZGlhLmNvbTpoSm00NT9kRmU=';
    $headers[] = 'Content-Type: application/json';
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    $result = curl_exec($ch);
    if (curl_errno($ch)) {
      echo 'Error:' . curl_error($ch);
    }
    $data = json_decode($result);

    $click = [];

    foreach ($data as $key => $value) {
      $click = [
        'campaign_name' => $value->campaign_name,
        'line_name' => $value->line_name,
        'creative_name' => $value->creative_name,
        'creative_size' => $value->creative_size,
        'inventory_name' => $value->inventory_name,
        'exchange_name' => $value->exchange_name,
        'country' => $value->country,
        'click' => $value->click,
        'time' => $value->time,
      ];
      $clickModel->insert($click);
    }

    curl_close($ch);
    return $result;
  }
}
