<?php

namespace App\Controllers;

use App\Models\Midpoint_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class MidPoint extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Midpoint_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function fetchFromAPI()
  {
    $viewModel = new Midpoint_model();
    $days   = date('Y-m-d', strtotime("-7 day"));
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,line_name,creative_name,creative_size,inventory_name,exchange_name,country&metrics=mid_point_views&startdate=$days&granularity=hour");
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

    $midpoint = [];

    foreach ($data as $key => $value) {
      $midpoint = [
        'campaign_name' => $value->campaign_name,
        'line_name' => $value->line_name,
        'creative_name' => $value->creative_name,
        'creative_size' => $value->creative_size,
        'inventory_name' => $value->inventory_name,
        'exchange_name' => $value->exchange_name,
        'country' => $value->country,
        'mid_point_view' => $value->mid_point_views,
        'time' => $value->time,
      ];
      $viewModel->insert($midpoint);
    }

    curl_close($ch);
    return $result;
  }
}
