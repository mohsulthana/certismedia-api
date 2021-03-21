<?php

namespace App\Controllers;

use App\Models\Reporting_model;
use App\Models\User_model;
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
    $client = \Config\Services::curlrequest();
    $usersModel = new User_model();
    $reportingModel = new Reporting_model();
    $users = $usersModel->findAll();    
    $day  = date('Y-m-d', strtotime("-7 day"));        
    $url = 'https://reporting.smadex.com/api/v2/performance?dimensions=campaign_id,creative_id,creative_name,creative_size,inventory_id,inventory_name,exchange_name&metrics=impressions,clicks,winrate&startdate='.$day.'&granularity=day';
    
    foreach($users as $user) {
      $email = $user['email'];
      $pass  = $user['password'];
      $response = $client->request('GET', $url, [
        'auth' => [$email, $pass, 'basic'],
        'headers' => [
          'Accept'     => 'application/json',
        ]
      ]);
      $report = [];
      $data = $response->getBody();
      
      foreach ($data as $key => $value) {
        $ctr = 0;
        if ($value->clicks > 0 && $value->impressions > 0) {
          $ctr = $value->clicks / $value->impressions;
        }

        $tmp = [
          'email'       => $email,
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
        array_push($report, $tmp);
      }
      $reportingModel->insertBatch($report);
    }
    return 'success';
  }
}
