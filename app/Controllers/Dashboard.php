<?php

namespace App\Controllers;

use App\Models\Dashboard_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Dashboard extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Dashboard_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function fetchFromAPI()
  {
    $dashboardModel = new Dashboard_model();
    $days   = date('Y-m-d', strtotime("-7 day"));
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,campaign_id&metrics=impressions,clicks,winrate&startdate=$days&granularity=hour");
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

    $dashboard = [];


    foreach ($data as $key => $value) {
      $ctr = 0;
      if ($value->clicks > 0 && $value->impressions > 0) {
        $ctr = $value->clicks / $value->impressions;
      }

      $dashboard = [
        'campaign_id' => $value->campaign_id,
        'campaign_name' => $value->campaign_name,
        'impression' => $value->impressions,
        'click' => $value->clicks,
        'ctr' => $ctr,
        'win_rate' => $value->winrate,
        'time' => $value->time,
      ];
      $dashboardModel->insert($dashboard);
    }

    curl_close($ch);
    return $result;
  }
}
