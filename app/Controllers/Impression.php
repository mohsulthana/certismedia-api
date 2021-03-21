<?php

namespace App\Controllers;

use App\Models\Impression_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Impression extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Impression_model';

  public function index()
  {
    $data = $this->model->findAll();
    return $this->respond($this->model->findAll(), 200);
  }

  public function fetchFromAPI()
  {
    $impressionModel = new Impression_model();
    $days   = date('Y-m-d', strtotime("-7 day"));
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,line_name,creative_name,creative_size,inventory_name,exchange_name,country&metrics=impressions&startdate=$days&granularity=hour");
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

    $impression = [];

    foreach ($data as $key => $value) {
      $impression = [
        'campaign_name' => $value->campaign_name,
        'line_name' => $value->line_name,
        'creative_name' => $value->creative_name,
        'creative_size' => $value->creative_size,
        'inventory_name' => $value->inventory_name,
        'exchange_name' => $value->exchange_name,
        'country' => $value->country,
        'impression' => $value->impressions,
        'time' => $value->time,
      ];
      $impressionModel->insert($impression);
    }

    curl_close($ch);
    return $result;
  }
}
