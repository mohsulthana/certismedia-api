<?php

namespace App\Controllers;

use App\Models\User_model;
use CodeIgniter\RESTful\ResourceController;

class Register extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\User_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }
  
  public function signup()
  {

    $user = new User_model();
    $email = $this->request->getVar('email');
    $username = $this->request->getVar('username');
    $name = $this->request->getVar('name');
    $plain_password = $this->request->getVar('password');
    $password = password_hash($this->request->getVar('password'), PASSWORD_BCRYPT);

    $isExist = $user->where([
      'email' => $email
    ])->first();

    if ($isExist) {
      return $this->failResourceExists("Account is invalid or already exist. Try another one.");
    } else {
      $data = [
        'username'  => $username,
        'name'  => $name,
        'email' => $email,
        'password' => $password,
        'API' => base64_encode($email.':'.$plain_password),
      ];
      $create = $user->insert($data);
      
      //create table 
      $user->createTable($username.$create);
      $cmd = '/usr/local/bin/php /home4/fykfaumy/public_html/api/public/index.php Reporting CreateReportingAsync "'.$create.'" > /dev/null &' ;
      shell_exec($cmd);
      $cmd = '/usr/local/bin/php /home4/fykfaumy/public_html/api/public/index.php Reporting CreateReportingDailyAsync "'.$create.'" > /dev/null &' ;
      shell_exec($cmd);
      
      $response = [
        'message' => "User registered successfully",
        'id' => $create
      ];

      
      return $this->respondCreated($response);
    }
  }
}