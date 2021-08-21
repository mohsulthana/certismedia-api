<?php

namespace App\Models;

use CodeIgniter\Model;

class User_model extends Model {
  protected $table = "user";
  protected $allowedFields = ['name', 'username', 'email', 'password', 'created', 'modified','token', 'API'];
    
    public function createTable($table_name) {
        $sql = "CREATE TABLE IF NOT EXISTS ".$table_name." (
             `date_time` datetime NOT NULL,
             `other_conversions` int(11) NOT NULL,
             `impressions` int(11) NOT NULL,
             `clicks` int(11) NOT NULL,
             `views` int(11) NOT NULL,
             `completed_views` int(11) NOT NULL,
             `ctr` int(11) NOT NULL,
             `campaign_id` int(11) NOT NULL,
             `campaign_name` varchar(255) NOT NULL,
             `creative_id` int(11) NOT NULL,
             `creative_name` varchar(255) NOT NULL,
             `creative_size` varchar(255) NOT NULL,
             `inventory_id` int(11) NOT NULL,
             `inventory_name` varchar(255) NOT NULL,
             `exchange_name` varchar(255) NOT NULL,
             KEY `campaign_id` (`campaign_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
        $this->db->query($sql);
        
        $this->createTableDaily('daily_'.$table_name);
    }
    
    public function createTableDaily($table_name)
    {
        $query = "CREATE TABLE IF NOT EXISTS ".$table_name." (
         `date_time` date NOT NULL,
         `other_conversions` int(11) NOT NULL,
         `impressions` int(11) NOT NULL,
         `clicks` int(11) NOT NULL,
         `views` int(11) NOT NULL,
         `completed_views` int(11) NOT NULL,
         `ctr` int(11) NOT NULL,
         `campaign_id` int(11) NOT NULL,
         KEY `campaign_id` (`campaign_id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
        return $this->db->query($query);
    }
}