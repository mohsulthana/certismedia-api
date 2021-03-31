<?php

namespace App\Models;

use CodeIgniter\Model;

class Daily_delivery extends Model {
  protected $table = "daily_delivery";
  protected $allowedFields = ['campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'view', 'completed_view', 'time'];
}