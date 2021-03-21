<?php

namespace App\Controllers;

use App\Models\Thirdquartile_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class ThirdQuartile extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Thirdquartile_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function fetchFromAPI()
  {
    $thirdquartileModel = new Thirdquartile_model();
    $days   = date('Y-m-d', strtotime("-7 day"));
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,line_name,creative_name,creative_size,inventory_name,exchange_name,country&metrics=third_quartile_views&startdate=$days&granularity=hour");
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

    $thirdquartile = [];

    foreach ($data as $key => $value) {
      $thirdquartile = [
        'campaign_name' => $value->campaign_name,
        'line_name' => $value->line_name,
        'creative_name' => $value->creative_name,
        'creative_size' => $value->creative_size,
        'inventory_name' => $value->inventory_name,
        'exchange_name' => $value->exchange_name,
        'country' => $value->country,
        'third_quartile_view' => $value->third_quartile_views,
        'time' => $value->time,
      ];
      $thirdquartileModel->insert($thirdquartile);
    }

    curl_close($ch);
    return $result;
  }
}
