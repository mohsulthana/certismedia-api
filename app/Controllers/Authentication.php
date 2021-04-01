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
    $username = $this->request->getVar('username');
    $password = $this->request->getVar('password');

    $isExist = $user->where([
      'username' => $username
    ])->first();

    if ($isExist) {
      if ($password === $isExist['password']) {
      // if (password_verify($password, $isExist['password'])) {
        $data = [
          'message' => "Successfully logged in",
          'email' => $isExist['email'],
          'username' => $isExist['username'],
          'name' => $isExist['name'],
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

  public function register()
  {
    $output = exec('ls');
    echo "<pre>$output</pre>";
    return;
    $user = new User_model();
    $email = $this->request->getVar('email');
    $username = $this->request->getVar('username');
    $name = $this->request->getVar('name');
    $password = password_hash($this->request->getVar('password'), PASSWORD_BCRYPT);

    $isExist = $user->where([
      'email' => $email
    ])->first();

    if ($isExist) {
      return $this->failResourceExists("Account is exist. Try another one.");
    } else {
      $data = $user->insert([
        'username'  => $username,
        'name'  => $name,
        'email' => $email,
        'password' => $password,
      ]);
      return $this->respondNoContent("User registered successfully");
    }
  }
}