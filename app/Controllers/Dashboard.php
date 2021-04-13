<?php

namespace App\Controllers;

use App\Models\Dashboard_model;
use CodeIgniter\RESTful\ResourceController;
use App\Models\User_model;
use Exception;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Dashboard extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\Dashboard_model';

  public function index()
  {
    $email = $this->request->getGet('email');
    $dashboardModel = new Dashboard_model();
    $data = $dashboardModel->getUserData($email);
    return  $this->setResponseFormat('json')->respond($data, 200);
  }

  public function fetchFromAPI($id_user = null)
  {
    try {
      $client = \Config\Services::curlrequest();
      $dashboardModel = new Dashboard_model();
      $usersModel = new User_model();

      if ($id_user != null) {
        $users[0] = $usersModel->find($id_user);
        if ($users[0] == null) {
          return $this->failResourceExists("Invalid Account");
        }
      } else {
        $users = $usersModel->findAll();
      }
      $day  = date('Y-m-d', strtotime("yesterday"));
      $url = "https://reporting.smadex.com/api/v2/performance?dimensions=campaign_name,campaign_id&metrics=impressions,clicks,winrate,views,completed_views&startdate=$day&granularity=hour&limit=150";

      foreach ($users as $user) {
        $response = $client->request('GET', $url, [
          'headers' => [
            'Accept'     => 'application/json',
            'Authorization' => 'Basic ' . $user['API']
          ],
          'connect_timeout' => 0
        ]);
        $dashboard = [];
        $data = json_decode($response->getBody());

        foreach ($data as $key => $value) {
          $ctr = 0;
          if ($value->clicks > 0 && $value->impressions > 0) {
            $ctr = $value->clicks / $value->impressions;
          }

          $tmp = [
            'email' => $user['email'],
            'campaign_id' => $value->campaign_id,
            'campaign_name' => $value->campaign_name,
            'impression' => $value->impressions,
            'click' => $value->clicks,
            'ctr' => $ctr,
            'view'  => $value->views,
            'completed_view'  => $value->completed_views,
            'win_rate' => $value->winrate,
            'time' => $value->time,
          ];
          array_push($dashboard, $tmp);
        }
        $dashboardModel->insertBatch($dashboard);
        // if ($user['statusDashboard'] != 1) {
        //   $usersModel->set(['statusDashboard' => 1])->where('email', $user['email'])->update();
        // }
      }
      return 'Dashboard success fetched';
    } catch (\Exception $e) {
      throw new Exception($e);
    }
  }
}
