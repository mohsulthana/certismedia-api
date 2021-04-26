<?php

namespace App\Models;

use CodeIgniter\Model;

class Reports_model extends Model {
  protected $table = "reports";
  protected $allowedFields = ["email","campaign_id","campaign_name","creative_id","creative_name","creative_size","inventory_id","inventory_name","exchange_name","impressions","clicks","views","completed_views","ctr"];

}