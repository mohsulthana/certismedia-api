<?php

namespace App\Models;

use CodeIgniter\Model;

class Reporting_model extends Model {
  protected $table = "report";
  protected $allowedFields = ['email', 'campaign_id', 'creative_id', 'creative_name', 'creative_size', 'inventory_id', 'inventory_name', 'exchange_name', 'impression', 'click', 'win_rate', 'ctr', 'time'];

  public function getInventoryName($id)
  {
    $result = $this->db->query("SELECT inventory_name, impression, click, ctr, win_rate, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$id")->getResultArray();
    return $result;
  }

  public function getCreativeName($id)
  {
    $result = $this->db->query("SELECT report.*, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$id")->getResultArray();
    return $result;
  }

  public function getCampaignInformation($id)
  {
    $result = $this->db->query("SELECT * from dashboard where campaign_id=$id")->getResultArray();
    return $result;
  }

  public function getExchangeName($id)
  {
    $result = $this->db->query("SELECT exchange_name, COUNT(impression) as total FROM `report` where campaign_id=$id GROUP BY exchange_name")->getResultArray();
    return $result;
  }

  public function getAdSize($id)
  {
    $result = $this->db->query("SELECT creative_size, COUNT(impression) as total FROM `report` where campaign_id=$id GROUP BY creative_size")->getResultArray();
    return $result;
  }
}