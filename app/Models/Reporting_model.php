<?php

namespace App\Models;

use CodeIgniter\Model;

class Reporting_model extends Model {
  protected $table = "report_csv";
  // protected $allowedFields = ['email', 'campaign_id', 'creative_id', 'creative_name', 'creative_size', 'inventory_id', 'inventory_name', 'exchange_name', 'impressions', 'views', 'completed_views', 'clicks', 'ctr', 'date_time'];

  public function getDashboardData($account_id)
  {
    $sql = 'SELECT `campaign_name`, `campaign_id`,`campaign_name`,sum(`impressions`) as impression,sum(`clicks`) as click,SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr,`date_time` FROM (SELECT `campaign_id`,`campaign_name`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time`,`account_id` FROM `report_csv` WHERE `date_time` GROUP BY campaign_id,date_time,impressions,clicks,views,completed_views,ctr) t1 WHERE t1.account_id=? GROUP BY t1.campaign_id';
    //$sql = 'SELECT `campaign_name`, `campaign_id`, SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `report_csv` WHERE `account_id`=? GROUP BY `campaign_id`';
    $result = $this->db->query($sql, $account_id);
    return $result->getResultArray();
  }

  public function getAllReportData($account_id)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `report_csv` WHERE `account_id`=?';
    $sql = 'SELECT `campaign_id`, SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `report_csv` WHERE `account_id`=? GROUP BY `campaign_id`';
    $result = $this->db->query($sql, $account_id);
    return $result->getResultArray();
  }

  public function getCreativeName($account_id, $campaign)
  {
    $sql = 'SELECT `creative_name`, `creative_id`, `campaign_id`,sum(`impressions`) as impression,sum(`clicks`) as click,SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr,`date_time` FROM (SELECT `creative_name`, `creative_id`, `campaign_id`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time`,`account_id` FROM `report_csv` WHERE `date_time` GROUP BY campaign_id,date_time,impressions,clicks,views,completed_views,ctr) t1 WHERE t1.account_id=? AND t1.campaign_id=? GROUP BY t1.creative_id';
    // $sql = 'SELECT SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `report_csv` WHERE `account_id`=? GROUP BY `creative_id`';
    $result = $this->db->query($sql, [$account_id, $campaign]);
    return $result->getResultArray();
  }

  public function getInventoryName($account_id, $campaign)
  {
    $sql = 'SELECT `inventory_name`, `inventory_id`, `campaign_id`,sum(`impressions`) as impression,sum(`clicks`) as click,SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr,`date_time` FROM (SELECT `inventory_name`, `inventory_id`, `campaign_id`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time`,`account_id` FROM `report_csv` WHERE `date_time` GROUP BY campaign_id,date_time,impressions,clicks,views,completed_views,ctr) t1 WHERE t1.account_id=? AND t1.campaign_id=? GROUP BY t1.inventory_id';
    // $sql = 'SELECT SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `report_csv` GROUP BY `inventory_id`';
    $result = $this->db->query($sql, [$account_id, $campaign]);
    return $result->getResultArray();
  }

  public function getExchangeName($account_id)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `report_csv` WHERE `account_id`=?';
    $sql = 'SELECT `exchange_name`, COUNT(`impressions`) as total FROM `report_csv` GROUP BY `exchange_name`';
    $result = $this->db->query($sql, $account_id);
    return $result->getResultArray();
  }

  public function getAdSize($campaign, $account_id)
  {
    $sql = 'SELECT `creative_size`, COUNT(`impressions`) as total FROM `report_csv` where `campaign_id`=? AND `account_id`=? GROUP BY `creative_size`';
    $result = $this->db->query($sql, [$campaign, $account_id]);
    return $result->getResultArray();
    // $id = $campaign->campaign;
    // $result = $this->db->query("SELECT creative_size, COUNT(impressions) as total FROM `report_csv` where campaign_id=$id GROUP BY creative_size")->getResultArray();
    // return $result;
  }

  // public function getUserData($account_id) {
  //   $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `account_id`=? GROUP BY `campaign_id` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, $account_id);
  //   return $result->getResultArray();
  // }

  // public function getInventoryName($campaign, $account_id)
  // {
  //   $sql = 'SELECT `id`, `inventory_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `campaign_id`=? or `account_id`=? GROUP BY `inventory_name` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, [$campaign, $account_id]);
  //   return $result->getResultArray();
  //   // $result = $this->db->query("SELECT inventory_name, impression, click, ctr, win_rate, view, completed_view, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$campaign or a.email=$account_id")->getResultArray();
  //   // return $result;
  // }

  // public function getCreativeName($campaign, $account_id)
  // {
  //   $sql = 'SELECT `id`, `creative_name`, SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS winrate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `report` WHERE `campaign_id`=? or `account_id`=? GROUP BY `creative_name` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, [$campaign, $account_id]);
  //   return $result->getResultArray();
  //   // $result = $this->db->query("SELECT report.*, a.campaign_name from report natural join (select DISTINCT campaign_id, campaign_name from dashboard) a where a.campaign_id=$campaign")->getResultArray();
  //   // return $result;
  // }

  // public function getCampaignInformation($campaign, $account_id)
  // {
  //   $sql = 'SELECT `id`, `campaign_id`, `campaign_name`,SUM(`impression`) as impression, SUM(`click`) AS click, SUM(`win_rate`) AS win_rate, SUM(`view`) AS view, SUM(`completed_view`) AS completed_view, `time`, SUM(`ctr`) AS ctr FROM `dashboard` WHERE `campaign_id`=? and `account_id`=?  GROUP BY `campaign_id` ORDER BY `time` ASC';
  //   $result = $this->db->query($sql, [$campaign, $account_id]);
  //   return $result->getResultArray();
  // }

  // public function getExchangeName($campaign)
  // {
  //   $result = $this->db->query("SELECT exchange_name, COUNT(impression) as total FROM `report` where campaign_id=$campaign GROUP BY exchange_name")->getResultArray();
  //   return $result;
  // }
}