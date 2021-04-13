<?php

namespace App\Models;

use CodeIgniter\Model;

class Reporting_model extends Model {
  protected $table = "report";
  protected $allowedFields = ['email', 'campaign_id', 'creative_id', 'creative_name', 'creative_size', 'inventory_id', 'inventory_name', 'exchange_name', 'impression', 'view', 'completed_view', 'click', 'win_rate', 'ctr', 'time'];

  public function getUserData($email) {
    $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `email`=? GROUP BY `campaign_id` ORDER BY `time` ASC';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }

  public function getInventoryName($campaign, $email)
  {
    $sql = 'SELECT `id`, `inventory_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `campaign_id`=? or `email`=? GROUP BY `inventory_name` ORDER BY `time` ASC';
    $result = $this->db->query($sql, [$campaign, $email]);
    return $result->getResultArray();
    // $result = $this->db->query("SELECT inventory_name, impression, click, ctr, win_rate, view, completed_view, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$campaign or a.email=$email")->getResultArray();
    // return $result;
  }

  public function getCreativeName($campaign, $email)
  {
    $sql = 'SELECT `id`, `creative_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `campaign_id`=? or `email`=? GROUP BY `creative_name` ORDER BY `time` ASC';
    $result = $this->db->query($sql, [$campaign, $email]);
    return $result->getResultArray();
    // $result = $this->db->query("SELECT report.*, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$campaign")->getResultArray();
    // return $result;
  }

  public function getCampaignInformation($campaign, $email)
  {
    $sql = 'SELECT `id`, `campaign_id`, `campaign_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `dashboard` WHERE `campaign_id`=? and `email`=?  GROUP BY `campaign_id` ORDER BY `time` ASC';
    $result = $this->db->query($sql, [$campaign, $email]);
    return $result->getResultArray();
    // $result = $this->db->query("SELECT `id`, `campaign_id`, `campaign_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr from dashboard where campaign_id=$campaign")->getResultArray();
    // return $result;
  }

  public function getExchangeName($campaign)
  {
    $result = $this->db->query("SELECT exchange_name, COUNT(impression) as total FROM `report` where campaign_id=$campaign GROUP BY exchange_name")->getResultArray();
    return $result;
  }

  public function getAdSize($campaign)
  {
    $result = $this->db->query("SELECT creative_size, COUNT(impression) as total FROM `report` where campaign_id=$campaign GROUP BY creative_size")->getResultArray();
    return $result;
  }
}