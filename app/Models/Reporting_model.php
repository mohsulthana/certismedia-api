<?php

namespace App\Models;

use CodeIgniter\Model;

class Reporting_model extends Model {
  protected $table = "reports";
  // protected $allowedFields = ['email', 'campaign_id', 'creative_id', 'creative_name', 'creative_size', 'inventory_id', 'inventory_name', 'exchange_name', 'impressions', 'views', 'completed_views', 'clicks', 'ctr', 'date_time'];

  public function getDashboardData($email)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `reports` WHERE `email`=?';
    $sql = 'SELECT `campaign_id`, SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `reports` WHERE `email`=? GROUP BY `campaign_id`';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }

  public function getAllReportData($email)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `reports` WHERE `email`=?';
    $sql = 'SELECT `campaign_id`, SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `reports` WHERE `email`=? GROUP BY `campaign_id`';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }

  public function getCreativeName($email)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `reports` WHERE `email`=?';
    $sql = 'SELECT SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `reports` WHERE `email`=? GROUP BY `creative_id`';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }

  public function getInventoryName($email)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `reports` WHERE `email`=?';
    $sql = 'SELECT SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `reports` WHERE `email`=? GROUP BY `inventory_id`';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }

  public function getExchangeName($email)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `reports` WHERE `email`=?';
    $sql = 'SELECT `exchange_name`, COUNT(`impressions`) as total FROM `reports` WHERE `email`=? GROUP BY `exchange_name`';
    $result = $this->db->query($sql, $email);
    return $result->getResultArray();
  }

  public function getAdSize($campaign, $email)
  {
    $sql = 'SELECT `creative_size`, COUNT(`impressions`) as total FROM `reports` where `campaign_id`=? AND `email`=? GROUP BY `creative_size`';
    $result = $this->db->query($sql, [$campaign, $email]);
    return $result->getResultArray();
    // $id = $campaign->campaign;
    // $result = $this->db->query("SELECT creative_size, COUNT(impressions) as total FROM `reports` where campaign_id=$id GROUP BY creative_size")->getResultArray();
    // return $result;
  }

  // public function getUserData($email) {
  //   $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `email`=? GROUP BY `campaign_id` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, $email);
  //   return $result->getResultArray();
  // }

  // public function getInventoryName($campaign, $email)
  // {
  //   $sql = 'SELECT `id`, `inventory_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `campaign_id`=? or `email`=? GROUP BY `inventory_name` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, [$campaign, $email]);
  //   return $result->getResultArray();
  //   // $result = $this->db->query("SELECT inventory_name, impression, click, ctr, win_rate, view, completed_view, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$campaign or a.email=$email")->getResultArray();
  //   // return $result;
  // }

  // public function getCreativeName($campaign, $email)
  // {
  //   $sql = 'SELECT `id`, `creative_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `campaign_id`=? or `email`=? GROUP BY `creative_name` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, [$campaign, $email]);
  //   return $result->getResultArray();
  //   // $result = $this->db->query("SELECT report.*, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$campaign")->getResultArray();
  //   // return $result;
  // }

  // public function getCampaignInformation($campaign, $email)
  // {
  //   $sql = 'SELECT `id`, `campaign_id`, `campaign_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `dashboard` WHERE `campaign_id`=? and `email`=?  GROUP BY `campaign_id` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, [$campaign, $email]);
  //   return $result->getResultArray();
  // }

  // public function getExchangeName($campaign)
  // {
  //   $result = $this->db->query("SELECT exchange_name, COUNT(impression) as total FROM `report` where campaign_id=$campaign GROUP BY exchange_name")->getResultArray();
  //   return $result;
  // }
}