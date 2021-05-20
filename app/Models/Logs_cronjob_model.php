<?php

namespace App\Models;

use CodeIgniter\Model;

class Logs_cronjob_model extends Model {
  protected $table = "logs_cronjob";
  protected $allowedFields = ["status","message"];

}