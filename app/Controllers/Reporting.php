<?php

namespace App\Controllers;

use App\Models\Reporting_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Reporting extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Reporting_model';

  public function index()
  {
    $request = \Config\Services::request();
    $auth = $request->headers();
    var_dump(apache_request_headers());
    return $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function getCampaignInformation($id)
  {
    $reportModel = new Reporting_model();
    $inventory = $reportModel->getInventoryName($id);
    $creative = $reportModel->getCreativeName($id);
    $campaign = $reportModel->getCampaignInformation($id);
    $exchange = $reportModel->getExchangeName($id);
    $adSize = $reportModel->getAdSize($id);
    $data = [$creative, $inventory, $campaign, $exchange, $adSize];
    return $this->setResponseFormat('json')->respond($data, 200);
  }

  public function fetchFromAPI()
  {
    $request = \Config\Services::request();
    $auth = $request->headers()['Authorization'];

    if (!isset($auth)) {
      return $this->failUnauthorized("Authorization unknown");
    } else {
      $reportingModel = new Reporting_model();
      $days   = date('Y-m-d', strtotime("-7 day"));
      $ch = curl_init();

      curl_setopt($ch, CURLOPT_URL, "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_id,creative_id,creative_name,creative_size,inventory_id,inventory_name,exchange_name&metrics=impressions,clicks,winrate&startdate=$days&granularity=day");
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

      $report = [];


      foreach ($data as $key => $value) {
        $ctr = 0;
        if ($value->clicks > 0 && $value->impressions > 0) {
          $ctr = $value->clicks / $value->impressions;
        }

        $report = [
          'campaign_id' => $value->campaign_id,
          'creative_id' => $value->creative_id,
          'creative_name' => $value->creative_name,
          'creative_size' => $value->creative_size,
          'inventory_id'  => $value->inventory_id,
          'inventory_name'  => $value->inventory_name,
          'exchange_name' => $value->exchange_name,
          'impression' => $value->impressions,
          'click' => $value->clicks,
          'win_rate'  => $value->winrate,
          'ctr' => $ctr,
          'time'  => $value->time
        ];
        $reportingModel->insert($report);
      }

      curl_close($ch);
      return $result;
    }
  }
}
