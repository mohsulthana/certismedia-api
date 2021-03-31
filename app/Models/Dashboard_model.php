<?php

namespace App\Models;

use CodeIgniter\Model;

class Dashboard_model extends Model {
  protected $table = "dashboard";
  protected $allowedFields = ['email', 'campaign_name', 'campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'view', 'completed_view', 'time'];
}