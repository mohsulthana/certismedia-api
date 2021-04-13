<?php

namespace App\Models;

use CodeIgniter\Model;

class Dashboard_model extends Model {
  protected $table = "dashboard";
  protected $allowedFields = ['email', 'campaign_name', 'campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'view', 'completed_view', 'time'];

  public function getUserData($email) {
    $sql = 'SELECT `id`, `campaign_id`, `campaign_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, (SUM(`click`) / SUM(`impression`)) AS ctr FROM `dashboard` WHERE `email`=? GROUP BY `campaign_id` ORDER BY `time` ASC';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }
}