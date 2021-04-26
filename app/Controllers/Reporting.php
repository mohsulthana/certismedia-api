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

  //fungsi untuk cronjob
  public function CreateReportingAsync($id_user=null)
  {
    helper('api');
    $usersModel = new User_model();
    $user = $usersModel->find($id_user);
    if($id_user != null) {
      $users[0] = $usersModel->find($id_user);
      if($users[0] == null) {
        return $this->failResourceExists("Invalid Account");
      }
    } else  {
      $users = $usersModel->findAll();
    }

    foreach ($users as $user) {
      create_reporting($user['id'], $user['API']);
    }
  }

  //fungsi handle callBack url from API
  public function HandleReport($id_user)
  {
    $id = $this->request->getVar('id');
    $usersModel = new User_model();
    $user = $usersModel->find($id_user);
    if($user) {
      shell_exec('/usr/local/bin/php /home4/fykfaumy/public_html/api/public/index.php Reporting GetReportingAsync "'.$user['email'].'" "'.$id.'" "'.$user['API'].'"> /dev/null &');
    }
    echo 'OK';
  }

  //fungsi untuk get data report dari API dan insert data ke DB
  public function GetReportingAsync($email=null, $id_report=null, $credentialAPI)
  {
    helper('api');
    $usersModel = new User_model();
    try {
      if($id_report != null) {
        $downloadUrl = get_reporting($credentialAPI, $id_report)->downloadUrl;
        $data_report = fetch_data($downloadUrl);
        insertBatchReports($data_report, $email);
        $usersModel->set(['statusReporting' => 1])->where('email', $email)->update();
      }
    } catch(Exception $e) {
      $data = [
        'email' => $email,
        'message' => $e->getMessage()
      ];
      $logs_model = new \App\Models\Logs_cronjob_model();
      $logs_model->insert($data);
    }
    echo 'data saved';
  }

  public function getCampaignInformation($campaign, $id)
  {
    $email = $this->request->getGet('email');
    $reportModel = new Reporting_model();
    $dashboardModel = new Dashboard_model();
    $dailyDeliveryModel = new Daily_delivery();
    $inventory = $reportModel->getInventoryName($campaign, $email);
    $creative = $reportModel->getCreativeName($campaign, $email);
    $campaignInfo = $reportModel->getCampaignInformation($campaign, $email);
    $exchange = $reportModel->getExchangeName($campaign, $email);
    $adSize = $reportModel->getAdSize($campaign);
    $dailyDelivery = $dailyDeliveryModel->getUserData($campaign, $email);
    $data = [$creative, $inventory, $campaignInfo, $exchange, $adSize, $dailyDelivery];
    return $this->setResponseFormat('json')->respond($data, 200);
  }

  private function connectAPI($url, $offset=1, $limit=500, $credentialAPI, $retryConnect=2)
  {
    if($retryConnect <= 0) return null;

    $client = \Config\Services::curlrequest();
    $response = $client->request('GET', $url, [
      'headers' => [
        'Accept'     => 'application/json',
        'Authorization' => 'Basic '.$credentialAPI
      ],
      'connect_timeout' => 0,
      'http_errors' => false
    ]);
    if($response->getStatusCode() >= 400) {
      //retry connect
      $response = $this->connectAPI($url, $offset, $limit, $credentialAPI, $retryConnect-1);
    }
    return $response;
  }

  public function fetchFromAPI($id_user = null)
  {
    $usersModel = new User_model();
    $reportingModel = new Reporting_model();
    $limit = 500;

    if($id_user != null) {
      $users[0] = $usersModel->find($id_user);
      if($users[0] == null) {
        return $this->failResourceExists("Invalid Account");
      }
    } else  {
      $users = $usersModel->findAll();
    }

    $day  = date('Y-m-d', strtotime("yesterday"));
    $url = "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_id,creative_id,creative_name,creative_size,inventory_id,inventory_name,exchange_name&metrics=impressions,clicks,winrate,views,completed_views&startdate=$day&granularity=day";

    foreach ($users as $user) {
      for($offset=1; $offset<9999999; $offset++) {
        $tmp_url = $url.'&offset='.$offset.'&limit='.$limit;

        $response = $this->connectAPI($tmp_url, $offset, $limit, $user['API']);
        if($response == null) {
          //failed connect API
          $usersModel->set(['statusReporting' => 3])->where('email', $user['email'])->update();
          return 'failed connect API';
        }

        $data = json_decode($response->getBody());
        if($data == null) {
          //fetch selesai
          if($user['statusReporting'] != 1) {
            $usersModel->set(['statusReporting' => 1])->where('email', $user['email'])->update();
          }
          return 'success fetch';
        }

        //input data ke DB
        $dataInput = [];
        foreach ($data as $key => $value) {
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
            'time'  => intval($value->time)
          ];
          array_push($dataInput, $tmp);
        }
        $reportingModel->insertBatch($dataInput);
      }
    }
    return 'success';
  }

  public function fetchDailyDelivery($id_user = null)
  {
    $usersModel = new User_model();
    $dailyDeliveryModel = new Reporting_model();
    $limit = 500;

    if($id_user != null) {
      $users[0] = $usersModel->find($id_user);
      if($users[0] == null) {
        return $this->failResourceExists("Invalid Account");
      }
    } else  {
      $users = $usersModel->findAll();
    }

    $day  = date('Y-m-d', strtotime("yesterday"));
    $url = "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_id&metrics=impressions,clicks,winrate,views,completed_views&startdate=$day&granularity=day";

    foreach ($users as $user) {
      for($offset=1; $offset<9999999; $offset++) {
        $tmp_url = $url.'&offset='.$offset.'&limit='.$limit;

        $response = $this->connectAPI($tmp_url, $offset, $limit, $user['API']);
        if($response == null) {
          //failed connect API
          // $usersModel->set(['statusReporting' => 3])->where('email', $user['email'])->update();
          return 'failed connect API';
        }

        $data = json_decode($response->getBody());
        if($data == null) {
          //fetch selesai
          // if($user['statusReporting'] != 1) {
          //   $usersModel->set(['statusReporting' => 1])->where('email', $user['email'])->update();
          // }
          return 'success fetch';
        }

        //input data ke DB
        $dataInput = [];
        foreach ($data as $key => $value) {
          $tmp = [
            'campaign_id' => $value->campaign_id,
            'impression' => $value->impressions,
            'click' => $value->clicks,
            'view' => $value->views,
            'completed_view' => $value->completed_views,
            'win_rate'  => $value->winrate,
            'time'  => $value->time
          ];
          array_push($dataInput, $tmp);
        }
        $dailyDeliveryModel->insertBatch($dataInput);
      }
    }
    return 'success';
  }
}
