<?php

namespace App\Models;

use CodeIgniter\Model;

class Firstquartile_model extends Model {
  protected $table = "firstquartile";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'first_quartile_view', 'time'];
}