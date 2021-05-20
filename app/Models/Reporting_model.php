<?php

namespace App\Models;

use CodeIgniter\Model;

class Reporting_model extends Model {
  protected $table = "akun561";
  protected $allowedFields = ['campaign_id','campaign_name', 'creative_id', 'creative_name', 'creative_size', 'inventory_id', 'inventory_name', 'exchange_name', 'impressions', 'views', 'completed_views', 'clicks', 'ctr', 'date_time'];
  
  public function getCampaignNameById($table, $condition=null, $field=null) {
        
    $query = 'SELECT TOP 1 campaign_id,campaign_name FROM '.$table;
    
    if ($condition != null)
        $query .= ' WHERE '.$condition .'GROUP BY campaign_id';
    
    return $this->db->query($query)->getResultArray();
  }
  
  public function getCampaign($table) {
    $field = 'campaign_id,campaign_name';
    $query = 'SELECT '.$field.' FROM '.$table.' GROUP BY campaign_id';
    return $this->db->query($query)->getResultArray();
  }
  
  public function getDataByCampaignId($table, $condition=null, $field=null) {
    if ($field == null)
        $field = 'campaign_id,campaign_name';
        
    $query = 'SELECT '.$field.',sum(`impressions`) as impressions,sum(`clicks`) as clicks,sum(`views`) as views,sum(`completed_views`) as completed_views,sum(`ctr`) as ctr,`date_time` FROM (SELECT '.$field.',`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM '.$table;
    if ($condition != null)
        $query .= ' WHERE '.$condition;
    $query .= ' GROUP BY `campaign_id`,`date_time`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`) t1 GROUP BY t1.campaign_id,t1.date_time ORDER BY date_time';
    
    return $this->db->query($query)->getResultArray();
  }
  
  public function getDataDashboard($table, $condition=null, $field=null) {
    if ($field == null)
        $field = 'campaign_id,campaign_name';
        
    $query = 'SELECT '.$field.',sum(`impressions`) as impressions,sum(`clicks`) as clicks,sum(`views`) as views,sum(`completed_views`) as completed_views,sum(`ctr`) as ctr FROM (SELECT '.$field.',`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM '.$table;
    if ($condition != null)
        $query .= ' WHERE '.$condition;
    $query .= ' GROUP BY `campaign_id`,`date_time`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`) t1 GROUP BY t1.campaign_id ORDER BY date_time';
    
    return $this->db->query($query)->getResultArray();
  }
  
  public function getDataDaily($table, $campaign_id, $condition=null) {
    $query = 'SELECT date_time,sum(`impressions`) as impressions,sum(`clicks`) as clicks,sum(`views`) as views,sum(`completed_views`) as completed_views,sum(`ctr`) as ctr FROM '.$table;
    $query .= ' WHERE campaign_id='.$campaign_id;
    if ($condition != null)
        $query .= ' AND '.$condition;
    $query .= ' GROUP BY `date_time`';
    
    return $this->db->query($query)->getResultArray();
  }
  
  public function getDataByCreativeId($table, $campaign_id) {
    $field = 'creative_id,creative_name';
        
    $query = 'SELECT '.$field.',sum(`impressions`) as impressions,sum(`clicks`) as clicks,sum(`views`) as views,sum(`completed_views`) as completed_views,sum(`ctr`) as ctr FROM (SELECT '.$field.',`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM '.$table;
    $query .= ' WHERE campaign_id='.$campaign_id;
    $query .= ' GROUP BY `creative_id`,`creative_name`,`date_time`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`) t1 GROUP BY t1.creative_id ORDER BY date_time';
    
    return $this->db->query($query)->getResultArray();
  }
  
  public function getDataByInventoryId($table, $campaign_id) {
    $field = 'inventory_id,inventory_name';
        
    $query = 'SELECT '.$field.',sum(`impressions`) as impressions,sum(`clicks`) as clicks,sum(`views`) as views,sum(`completed_views`) as completed_views,sum(`ctr`) as ctr FROM (SELECT '.$field.',`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM '.$table;
    $query .= ' WHERE campaign_id='.$campaign_id;
    $query .= ' GROUP BY `inventory_id`,`inventory_name`,`date_time`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`) t1 GROUP BY t1.inventory_id ORDER BY date_time';
    
    return $this->db->query($query)->getResultArray();
  }

  
  public function getDataAdSize($table, $campaign_id, $condition=null) {
    $field = 'creative_size';
    $query = 'SELECT '.$field.',sum(`impressions`) as impressions FROM '.$table;
    $query .= ' WHERE campaign_id='.$campaign_id;
    if ($condition != null)
        $query .= ' AND '.$condition;
    $query .= ' GROUP BY `creative_size`';
    
    return $this->db->query($query)->getResultArray();
  }
  
  public function getDataExchange($table, $campaign_id, $condition=null) {
    $field = 'exchange_name';
    $query = 'SELECT '.$field.',sum(`impressions`) as impressions FROM '.$table;
    $query .= ' WHERE campaign_id='.$campaign_id;
    if ($condition != null)
        $query .= ' AND '.$condition;
    $query .= ' GROUP BY `exchange_name`';
    
    return $this->db->query($query)->getResultArray();
  }

  public function getDashboardData($account_id)
  {
      print_r($account_id);
    $sql = 'SELECT `campaign_name`, `campaign_id`,`campaign_name`,sum(`impressions`) as impression,sum(`clicks`) as click,SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr,`date_time` FROM (SELECT `campaign_id`,`campaign_name`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM `report_csv` WHERE `date_time` GROUP BY campaign_id,date_time,impressions,clicks,views,completed_views,ctr) t1 WHERE t1.account_id=? GROUP BY t1.campaign_id';
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
    $sql = 'SELECT `creative_name`, `creative_id`, `campaign_id`,`campaign_name`,sum(`impressions`) as impression,sum(`clicks`) as click,SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr,`date_time` FROM (SELECT `creative_name`, `creative_id`, `campaign_id`,`campaign_name`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM `report_csv` WHERE `date_time` GROUP BY campaign_id,date_time,impressions,clicks,views,completed_views,ctr) t1 WHERE t1.account_id=? AND t1.campaign_id=? GROUP BY t1.creative_id';
    // $sql = 'SELECT SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `report_csv` WHERE `account_id`=? GROUP BY `creative_id`';
    $result = $this->db->query($sql, [$account_id, $campaign]);
    return $result->getResultArray();
  }

  public function getInventoryName($account_id, $campaign)
  {
    $sql = 'SELECT `inventory_name`, `inventory_id`, `campaign_id`,`campaign_name`,sum(`impressions`) as impression,sum(`clicks`) as click,SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr,`date_time` FROM (SELECT `inventory_name`, `inventory_id`, `campaign_id`,`campaign_name`,`impressions`,`clicks`,`views`,`completed_views`,`ctr`,`date_time` FROM `report_csv` WHERE `date_time` GROUP BY campaign_id,date_time,impressions,clicks,views,completed_views,ctr) t1 WHERE t1.account_id=? AND t1.campaign_id=? GROUP BY t1.inventory_id';
     // $sql = 'SELECT `inventory_name`, SUM(`impressions`) as impression, SUM(`clicks`) as click, SUM(`views`) as view, SUM(`completed_views`) as completed_view,  SUM(`ctr`) as ctr FROM `report_csv` WHERE `account_id`=? GROUP BY `inventory_id`';
    $result = $this->db->query($sql, $account_id);
    return $result->getResultArray();
  }

  public function getExchangeName($account_id)
  {
    // $sql = 'SELECT `id`, `campaign_id`, `creative_name`, `creative_size`, `inventory_name`, `exchange_name`, SUM(`impressions`) as impression, SUM(`clicks`) AS click, SUM(`views`) AS view, SUM(`completed_views`) AS completed_view, `date_time`, SUM(`ctr`) AS ctr FROM `report_csv` WHERE `account_id`=?';
    $sql = 'SELECT `exchange_name`, COUNT(`impressions`) as total FROM `report_csv` WHERE `account_id`=? GROUP BY `exchange_name`';
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