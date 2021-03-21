<?php

namespace App\Models;

use CodeIgniter\Model;

class Impression_model extends Model {
  protected $table = "impression";
  protected $returnType     = 'array';
  protected $allowedFields = ['line_name', 'creative_name', 'creative_size', 'inventory_name', 'exchange_name', 'country', 'campaign_name', 'impression', 'time'];
}