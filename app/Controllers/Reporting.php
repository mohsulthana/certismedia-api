<?php

namespace App\Controllers;

use App\Models\Daily_delivery;
use App\Models\Dashboard_model;
use App\Models\Reporting_model;
use App\Models\User_model;
use CodeIgniter\RESTful\ResourceController;
use Exception;

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
    return $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function getCampaignInformation($campaign, $id)
  {
    $reportModel = new Reporting_model();
    $dashboardModel = new Dashboard_model();
    $dailyDeliveryModel = new Daily_delivery();
    $inventory = $reportModel->getInventoryName($campaign);
    $creative = $reportModel->getCreativeName($campaign);
    $campaignInfo = $reportModel->getCampaignInformation($campaign);
    $exchange = $reportModel->getExchangeName($campaign);
    $adSize = $reportModel->getAdSize($campaign);
    $detail = $dashboardModel->where('id', $id)->findAll();
    $dailyDelivery = $dailyDeliveryModel->where('campaign_id', $campaign)->orderBy('time', 'ASC')->findAll();
    $data = [$creative, $inventory, $campaignInfo, $exchange, $adSize, $detail, $dailyDelivery];
    return $this->setResponseFormat('json')->respond($data, 200);
  }

  public function fetchFromAPI($id_user = null)
  {
    $client = \Config\Services::curlrequest();
    $usersModel = new User_model();
    $reportingModel = new Reporting_model();
    
    if($id_user != null) {
      $users[0] = $usersModel->find($id_user);
      if($users[0] == null) {
        return $this->failResourceExists("Invalid Account");
      }
    } else  {
      $users = $usersModel->findAll();
    }
      
    $day  = date('Y-m-d', strtotime("-7 days"));
    $url = "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_id,creative_id,creative_name,creative_size,inventory_id,inventory_name,exchange_name&metrics=impressions,clicks,winrate,views,completed_views&startdate=$day&granularity=day";

    try {      
      foreach ($users as $user) {
        $response = $client->request('GET', $url, [
          'headers' => [
            'Accept'     => 'application/json',
            'Authorization' => 'Basic '.$user['API']
          ],
          'connect_timeout' => 0
        ]);
        $report = [];
        $data = json_decode($response->getBody());

        foreach ($data as $key => $value) {
          $ctr = 0;
          if ($value->clicks > 0 && $value->impressions > 0) {
            $ctr = $value->clicks / $value->impressions;
          }

          $tmp = [
            'email'       => $user['email'],
            'campaign_id' => intval($value->campaign_id),
            'creative_id' => intval($value->creative_id),
            'creative_name' => $value->creative_name,
            'creative_size' => $value->creative_size,
            'inventory_id'  => intval($value->inventory_id),
            'inventory_name'  => $value->inventory_name,
            'exchange_name' => $value->exchange_name,
            'impression' => floatval($value->impressions),
            'view'  => intval($value->views),
            'completed_view' => intval($value->completed_views),
            'click' => floatval($value->clicks),
            'win_rate'  => floatval($value->winrate),
            'ctr' => floatval($ctr),
            'time'  => intval($value->time)
          ];
          array_push($report, $tmp);
        }
        $reportingModel->insertBatch($report);
        if($user['statusReporting'] != 1) {
          $usersModel->set(['statusReporting' => 1])->where('email', $user['email'])->update();
        }
      }
      return 'success';
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function fetchDailyDelivery($emailParam = null, $passParam = null)
  {
    $client = \Config\Services::curlrequest();
    $usersModel = new User_model();
    $dailyDeliveryModel = new Daily_delivery();
    
    if($emailParam != null && $passParam != null) {
      $users[0] = [
        'email' => $emailParam,
        'API' => base64_encode($emailParam.':'.$passParam),
      ];
    } else  {
      $users = $usersModel->findAll();
    }
    
    $day  = date('Y-m-d', strtotime("-7 days"));
    $url = "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_id&metrics=impressions,clicks,winrate,views,completed_views&startdate=$day&granularity=day";

    try {
      foreach ($users as $user) {
        $response = $client->request('GET', $url, [
          'headers' => [
            'Accept'     => 'application/json',
            'Authorization' => 'Basic '.$user['API']
          ],
          'connect_timeout' => 0
        ]);
        $daily_delivery = [];
        $data = json_decode($response->getBody());

        foreach ($data as $key => $value) {
          $ctr = 0;
          if ($value->clicks > 0 && $value->impressions > 0) {
            $ctr = $value->clicks / $value->impressions;
          }

          $tmp = [
            'campaign_id' => $value->campaign_id,
            'impression' => $value->impressions,
            'click' => $value->clicks,
            'view' => $value->views,
            'completed_view' => $value->completed_views,
            'win_rate'  => $value->winrate,
            'ctr' => $ctr,
            'time'  => $value->time
          ];
          array_push($daily_delivery, $tmp);
        }
        $dailyDeliveryModel->insertBatch($daily_delivery);
      }
      return 'success';
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }
}
