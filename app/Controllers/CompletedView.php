<?php

namespace App\Controllers;

use App\Models\Completed_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class CompletedView extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Completed_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function fetchFromAPI()
  {
    $completedModel = new Completed_model();
    $days   = date('Y-m-d', strtotime("-7 day"));
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,line_name,creative_name,creative_size,inventory_name,exchange_name,country&metrics=completed_views&startdate=$days&granularity=hour");
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

    $completed = [];

    foreach ($data as $key => $value) {
      $completed = [
        'campaign_name' => $value->campaign_name,
        'line_name' => $value->line_name,
        'creative_name' => $value->creative_name,
        'creative_size' => $value->creative_size,
        'inventory_name' => $value->inventory_name,
        'exchange_name' => $value->exchange_name,
        'country' => $value->country,
        'completed_view' => $value->completed_views,
        'time' => $value->time,
      ];
      $completedModel->insert($completed);
    }

    curl_close($ch);
    return $result;
  }
}
