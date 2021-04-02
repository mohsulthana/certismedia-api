<?php

namespace App\Models;

use CodeIgniter\Model;

class Daily_delivery extends Model {
  protected $table = "daily_delivery";
  protected $allowedFields = ['campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'view', 'completed_view', 'time'];

  public function getUserData() {
    $sql = 'SELECT `campaign_id`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, `ctr` FROM `daily_delivery` GROUP BY `campaign_id` ORDER BY `time` ASC';
    $result = $this->db->query($sql);
    return $result->getResultArray();
  }
}