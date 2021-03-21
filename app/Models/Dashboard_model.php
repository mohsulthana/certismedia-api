<?php

namespace App\Models;

use CodeIgniter\Model;

class Dashboard_model extends Model {
  protected $table = "dashboard";
  protected $allowedFields = ['campaign_name', 'campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'time'];
}