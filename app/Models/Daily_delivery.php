<?php

namespace App\Models;

use CodeIgniter\Model;

class Daily_delivery extends Model {
  protected $table = "daily_delivery";
  protected $allowedFields = ['email', 'campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'view', 'completed_view', 'time'];

  public function getUserData($campaign, $email) {
    $sql = 'SELECT `campaign_id`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, (SUM(`click`) / SUM(`impression`)) AS ctr FROM `daily_delivery` WHERE `campaign_id`=? and `email`=? GROUP BY `campaign_id`, `time` ORDER BY `time` ASC';
    $result = $this->db->query($sql, [$campaign, $email]);
    return $result->getResultArray();
  }
}