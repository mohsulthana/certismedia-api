<?php

namespace App\Models;

use CodeIgniter\Model;

class User_model extends Model {
  protected $table = "user";
  protected $allowedFields = ['name', 'username', 'email', 'password', 'phone', 'created', 'modified', 'status'];

}