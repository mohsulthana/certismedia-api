<?php

namespace App\Models;

use CodeIgniter\Model;

class Thirdquartile_model extends Model {
  protected $table = "thirdquartile";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'third_quartile_view', 'time'];
}