<?php

function connectAPI($method_http, $url, $credentialAPI, $body=null, $offset = 1, $limit = 500)
{   
    $client = \Config\Services::curlrequest();
    if($body != null) {
        $client->setBody($body);
    }
    $response = $client->request($method_http, $url, [
        'headers' => [
            'Accept'     => '*/*',
            'Authorization' => 'Basic ' . $credentialAPI,
            'Content-Type' => 'application/json'
        ],
        'connect_timeout' => 0,
        'http_errors' => false,
    ]);
    return $response;
}

//connect to create reporting endpoint
//return id report
function create_reporting($id_user, $credentialAPI)
{
    $callbackUrl = base_url('Reporting/HandleReport/'.$id_user);
    $endDate = date('Y-m-d');
    $startDate = date('Y-m-d', strtotime("-1 week"));
    $url = 'https://api-v2.smadex.com/analytics/reports/async';
    $body = '{
        
        "dimensions": [
          "campaign_id","campaign_name","creative_id","creative_name","creative_size","inventory_id","inventory_name","exchange_name"
        ],
        "endDate": "'.$endDate.'",
        "format": "json",
        "metrics": [
          "impressions","clicks","views","completed_views","ctr"
        ],
        "rollUp": "day",
        "startDate": "'.$startDate.'"
      }';
    $response = connectAPI('POST', $url, $credentialAPI, $body);
    if ($response->getStatusCode() >= 400) {
        throw new Exception("Error " . $response->getStatusCode().":".$response->getBody());
    }
    if ($response == null)
        throw new Exception('Something wrong. try again later');

    return json_decode($response->getBody())->id;
}

//get report by id report
//return report data
function get_reporting($credentialAPI, $id_report)
{
    $url = 'https://api-v2.smadex.com/analytics/reports/async/'.$id_report;
    
    $response = connectAPI('GET', $url, $credentialAPI);
    if ($response->getStatusCode() >= 400) {
        throw new Exception("Error " . $response->getStatusCode().":".$response->getBody());
    }
    if ($response == null)
        throw new Exception('Something wrong. try again later');

    return json_decode($response->getBody());
}



//download file from url
//return data file
function fetch_data($url)
{
    set_time_limit(0); 
    $file = file_get_contents($url);
    $data = json_decode($file, true);
    
    return $data;
}

function insertBatchReports($data, $email=null) {
    $model = new \App\Models\Reports_model();
    $max_data = count($data);
    $max_insert = 1000;
    $data_insert = [];
    for($i=0; $i<$max_data; $i++) {
        if($i==$max_insert) {
            $max_insert += 1000;
            $model->insertBatch($data_insert,null,1000);
            $data_insert = array();
        }
        
        $tmp = [
            "email" => $email,
            "campaign_id" => $data[$i]['campaign_id'],
            "campaign_name" => $data[$i]['campaign_name'],
            "creative_id" => $data[$i]['creative_id'],
            "creative_name" => $data[$i]['creative_name'],
            "creative_size" => $data[$i]['creative_size'],
            "inventory_id" => $data[$i]['inventory_id'],
            "inventory_name" => $data[$i]['inventory_name'],
            "exchange_name" => $data[$i]['exchange_name'],
            "impressions" => $data[$i]['impressions'],
            "clicks" => $data[$i]['clicks'],
            "views" => $data[$i]['views'],
            "completed_views" => $data[$i]['completed_views'],
            "ctr" => $data[$i]['ctr'],
            "date_time" => substr($data[$i]['date_time'],0,10),
        ];
        array_push($data_insert, $tmp);
    }
    if(count($data_insert) > 0)
        $model->insertBatch($data_insert);
} 