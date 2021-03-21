<?php

namespace App\Models;

use CodeIgniter\Model;

class Click_model extends Model {
  protected $table = "click";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'click', 'time'];
}