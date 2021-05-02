<?php

namespace App\Controllers;

use App\Models\Dashboard_model;
use App\Models\Reporting_model;
use CodeIgniter\RESTful\ResourceController;
use App\Models\User_model;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Dashboard extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Reporting_model';

  public function index()
  {
    $reportsModel = new Reporting_model();

    $account_id = $this->request->getVar('account_id');
    $dashboard = $reportsModel->getDashboardData($account_id);
    return $this->respond($dashboard, 200);
  }

  // private function connectAPI($url, $offset=1, $limit=500, $credentialAPI, $retryConnect=2)
  // {
  //   if($retryConnect <= 0) return null;

  //   $client = \Config\Services::curlrequest();
  //   $response = $client->request('GET', $url, [
  //     'headers' => [
  //       'Accept'     => 'application/json',
  //       'Authorization' => 'Basic '.$credentialAPI
  //     ],
  //     'connect_timeout' => 0,
  //     'http_errors' => false
  //   ]);
  //   if($response->getStatusCode() >= 400) {
  //     //retry connect
  //     $response = $this->connectAPI($url, $offset, $limit, $credentialAPI, $retryConnect-1);
  //   }
  //   return $response;
  // }

  // public function fetchFromAPI($id_user = null)
  // {
  //   $limit = 500;
  //   $dashboardModel = new Dashboard_model();
  //   $usersModel = new User_model();
  //   if($id_user != null) {
  //     $users[0] = $usersModel->find($id_user);
  //     if($users[0] == null) {
  //       return $this->failResourceExists("Invalid Account");
  //     }
  //   } else  {
  //     $users = $usersModel->findAll();
  //   }

  //   $day  = date('Y-m-d', strtotime("yesterday"));
  //   $url = "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,campaign_id&metrics=impressions,clicks,winrate,views,completed_views&startdate=$day&granularity=hour";

  //   foreach ($users as $user) {
  //     for($offset=1; $offset<9999999; $offset++) {
  //       $tmp_url = $url.'&offset='.$offset.'&limit='.$limit;

  //       $response = $this->connectAPI($tmp_url, $offset, $limit, $user['API']);
  //       if($response == null) {
  //         //failed connect API
  //         $usersModel->set(['statusDashboard' => 3])->where('email', $user['email'])->update();
  //         return 'failed connect API';
  //       }

  //       $data = json_decode($response->getBody());
  //       if($data == null) {
  //         //fetch selesai
  //         if($user['statusDashboard'] != 1) {
  //           $usersModel->set(['statusDashboard' => 1])->where('email', $user['email'])->update();
  //         }
  //         return 'success fetch';
  //       }

  //       //input data ke DB
  //       $dataInput = [];
  //       foreach ($data as $key => $value) {
  //         $tmp = [
  //           'email' => $user['email'],
  //           'campaign_id' => $value->campaign_id,
  //           'campaign_name' => $value->campaign_name,
  //           'impression' => $value->impressions,
  //           'click' => $value->clicks,
  //           'view'  => $value->views,
  //           'completed_view'  => $value->completed_views,
  //           'win_rate' => $value->winrate,
  //           'time' => $value->time,
  //         ];
  //         array_push($dataInput, $tmp);
  //       }
  //       $dashboardModel->insertBatch($dataInput);

  //     }
  //   }

  //   return 'success';
  // }
}
