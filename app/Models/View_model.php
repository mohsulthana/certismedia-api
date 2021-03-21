<?php

namespace App\Models;

use CodeIgniter\Model;

class View_model extends Model {
  protected $table = "view";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'view', 'time'];
}