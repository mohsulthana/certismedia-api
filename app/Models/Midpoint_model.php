<?php

namespace App\Models;

use CodeIgniter\Model;

class Midpoint_model extends Model {
  protected $table = "midpoint";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'mid_point_view', 'time'];
}