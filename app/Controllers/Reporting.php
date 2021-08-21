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

    //api table dashboard
  public function dashboard($table)
  {
    helper('api');
    $model = new Reporting_model();
    $email = 'cm1032@certismedia.com';
    $result = $model->getDataDashboard($table, $email);
    return $this->respond($result, 200);
  }
  
  // get campaign name only
  public function campaign_name($table, $campaign_id)
  {
      helper('api');
    $model = new Reporting_model();
    $result = $model->getCampaignNameById($table, $campaign_id);
    return $this->respond($result, 200);
  }
  
  public function get_campaign($table)
  {
    helper('api');
    $model = new Reporting_model();
    $result = $model->getCampaign($table);
    return $this->respond($result, 200);
  }
  
    //api table daily
  public function daily($table, $campaign_id)
  {
    helper('api');
    $model = new Reporting_model();
    $result = $model->getDataDaily('daily_'.$table,$campaign_id);
    return $this->respond($result, 200);
  }
  
    //api table creative
  public function creative($table,$campaign_id)
  {
    helper('api');
    $model = new Reporting_model();
    $result = $model->getDataByCreativeId($table, $campaign_id);
    return $this->respond($result, 200);
  }
  
    //api table inventory
  public function inventory($table, $campaign_id)
  {
    helper('api');
    $model = new Reporting_model();
    $result = $model->getDataByInventoryId($table, $campaign_id);
    return $this->respond($result, 200);
  }
  
    //api chart adSize
  public function adsize($table, $campaign_id)
  {
    helper('api');
    $model = new Reporting_model();
    $result = $model->getDataAdSize($table, $campaign_id);
    return $this->respond($result, 200);
  }
  
    //api chart exchange
  public function exchange($table, $campaign_id)
  {
    helper('api');
    $model = new Reporting_model();
    $result = $model->getDataExchange($table, $campaign_id);
    return $this->respond($result, 200);
  }
    


  //fungsi untuk cronjob
  public function CreateReportingAsync($id_user=null)
  {
    helper('api');
    $usersModel = new User_model();
    
    if($id_user != null) {
      $users[0] = $usersModel->find($id_user);
      if($users[0] == null) {
        return $this->failResourceExists("Invalid Account");
      }
    } else  {
      $users = $usersModel->findAll();
    }

    foreach ($users as $user) {
        if(isset($user['API'])) {
            $a = create_reporting($user['id'],$user['API']);
            echo var_dump($a);      
        }
    }
  }
  
  //fungsi untuk cronjob daily
  public function CreateReportingDailyAsync($id_user=null)
  {
    helper('api');
    $usersModel = new User_model();
    
    if($id_user != null) {
      $users[0] = $usersModel->find($id_user);
      if($users[0] == null) {
        return $this->failResourceExists("Invalid Account");
      }
    } else  {
      $users = $usersModel->findAll();
    }

    foreach ($users as $user) {
        if(isset($user['API'])) {
            $a = create_reporting($user['id'],$user['API'],'day');
            echo var_dump($a);      
        }
    }
  }

  //fungsi handle callBack url from API
  public function HandleReport($id_user,$daily=null)
  {
    $id = $this->request->getVar('id');
    $downloadUrl = $this->request->getVar('downloadUrl');
    $downloadUrl = base64_encode($downloadUrl);
    $usersModel = new User_model();
    $user = $usersModel->find($id_user);
    if($user && $id && $downloadUrl) {
        $table = '';
      if($daily)
        $table = 'daily_';
      $table .= $user['username'].$user['id'];
      $cmd = '/usr/local/bin/php /home4/fykfaumy/public_html/api/public/index.php Reporting GetReportingAsync "'.$table.'" "'.$id.'" "'.$downloadUrl.'" > /dev/null &' ;
      shell_exec($cmd);
      
    }
  }

  //fungsi untuk get data report dari API dan insert data ke DB
  public function GetReportingAsync($table=null, $id_report=null, $downloadUrl)
  {
    helper('api');
    $usersModel = new User_model();
    $downloadUrl = base64_decode($downloadUrl);
    $data = [
            'status' => 'download file url '.$table,
            'message' => $id_report.' url:'.$downloadUrl
        ];
        $logs_model = new \App\Models\Logs_cronjob_model();
        $logs_model->insert($data);
    if($id_report != null) {
      $data = [
            'status' => 'download file url '.$table,
            'message' => $downloadUrl
        ];
        $logs_model = new \App\Models\Logs_cronjob_model();
        $logs_model->insert($data);
      
        $destination_path = $id_report.'.csv';
        $daily = explode("_", $table);
        download_file($downloadUrl, $destination_path);
        if($daily[0] == 'daily')
            importCSV($destination_path, $table, false);
        else 
            importCSV($destination_path, $table);
        
        // $cmd = 'rm '.$destination_path;
        // shell_exec($cmd);
    }
  }
  
  //cronjob update token user
  public function refreshToken($id_user=null)
  {
      helper('api');
      $usersModel = new User_model();
      $users = $usersModel->find($id_user);
      foreach($users as $user) {
          getTokenAPI($user['API'], true);
      }
      
  }
  
//   public function data($table)
//   {
//       helper('api');
//       $model = new Reporting_model();
//       dum($model->getDataDashboard($table));
//       $campaign_id = 29402;
//       dum($model->getDataExchange($table, $campaign_id));
//       return dum($model->getDataByCampaignId($table, 'date_time="2021-05-06"'));
//   }

  public function baca($file)
  {
      helper('api');
      test_importCSV($file,'daily_test821', false);
  }
  
//   public function cek()
//   {
    //   echo date('Y-m-d');
    //   echo '<br>';
    //   echo date_default_timezone_get();
    //   date_default_timezone_set('UTC');
    //   echo '<br>';
    //   echo date_default_timezone_get();
    // $cmd = 'ls';
    // $cmd = 'rm e8fd46f4-8598-4717-87de-a14a9cf40ec0.csv';
    // echo var_dump(shell_exec($cmd));
    
//   }
  
//   public function tulis($url, $desti)
//   {
//       helper('api');
//       download_file($url, $desti);
//   }
  
//   public function cobadb()
//   {
//     //   $m = new User_model();
//     //   return var_dump($m->createTable('daily_akun322'));
//     $data = [
//             'status' => 'download file url ',
//             'message' => ' url:'
//         ];
//         $logs_model = new \App\Models\Logs_cronjob_model();
//         $logs_model->insert($data);
//   }

 
}
