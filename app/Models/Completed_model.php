<?php

namespace App\Models;

use CodeIgniter\Model;

class Completed_model extends Model {
  protected $table = "completed";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'completed_views', 'time'];
}