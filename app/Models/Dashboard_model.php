<?php

namespace App\Models;

use CodeIgniter\Model;

class Dashboard_model extends Model {
  protected $table = "dashboard";
  protected $allowedFields = ['email', 'campaign_name', 'campaign_id', 'impression', 'click', 'ctr', 'win_rate', 'view', 'completed_view', 'time'];

  public function getDashboard($email) {
    $sql = 'SELECT `campaign_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time` FROM `dashboard` GROUP BY `campaign_id` ORDER BY `time` ASC';
    $result = $this->db->query('SELECT `campaign_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view FROM `dashboard` GROUP BY `campaign_id` WHERE email = ?', $email);
    return $result->getResultArray();
  }
}