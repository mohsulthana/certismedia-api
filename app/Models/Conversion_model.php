<?php

namespace App\Models;

use CodeIgniter\Model;

class Conversion_model extends Model {
  protected $table = "conversion";
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'conversion', 'time'];
}