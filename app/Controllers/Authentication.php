<?php

namespace App\Controllers;

use App\Models\User_model;
use CodeIgniter\RESTful\ResourceController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, OPTIONS, UPDATE, PUT");

class Authentication extends ResourceController
{
  protected $format = 'json';
  protected $modelName = 'App\Models\User_model';

  public function index()
  {
    return  $this->setResponseFormat('json')->respond($this->model->findAll(), 200);
  }

  public function login()
  {
    $user = new User_model();
    $email = $this->request->getVar('email');
    $password = $this->request->getVar('password');

    $isExist = $user->where([
      'email' => $email
    ])->first();

    if ($isExist) {
      if ($password === $isExist['password']) {
        $data = [
          'message' => "Successfully logged in",
          'email' => $isExist['email'],
          'logged_in' => true
        ];
        return $this->respond($data, 200);
      } else {
        return $this->failUnauthorized("Your password is incorrect");
      }
    } else {
      return $this->failNotFound("You account is not exist");
    }
  }
}