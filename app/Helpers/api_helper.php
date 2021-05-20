<?php
use JsonMachine\JsonMachine;

function connectAPI($method_http, $url, $token, $body=null)
{
    $client = \Config\Services::curlrequest();
    if($body != null) {
        $client->setBody($body);
    }
    $response = $client->request($method_http, $url, [
        'headers' => [
            'Accept'     => '*/*',
            'Authorization' => 'Basic ' . $token,
            'Content-Type' => 'application/json'
        ],
        'connect_timeout' => 0,
        'http_errors' => false,
    ]);
    return $response;
}

function getTokenAPI($credentialAPI, $update=false)
{
    $url = 'https://api-v2.smadex.com/login';
    $client = \Config\Services::curlrequest();
    $u = base64_decode($credentialAPI);
    $u = explode(":", $u);
    $body = '{
        "email":"'.$u[0].'",
        "password":"'.$u[1].'"
    }';
    $client->setBody($body);
    $response = $client->request('POST', $url, [
        'headers' => [
            'Accept'     => '*/*',
            'Content-Type' => 'application/json'
        ],
        'connect_timeout' => 0,
        'http_errors' => false,
    ]);

    if ($response == null || $response->getStatusCode() >= 400) {
        $error = [
            'status' => 'error get token',
            'message' => ($response) ? $response->getStatusCode() : 'response null'
        ];
        $logs_model = new \App\Models\Logs_cronjob_model();
        $logs_model->insert($error);
        return false;
    }

    $token = json_decode($response->getBody())->accessToken;

    if($update) {
        $usersM = new \App\Models\User_model();
        $usersM->set(['token' => $token])->where('email', $u[0])->update();
    }
    return $token;
}


//download file
function download_file($file_url, $destination_path) {

    $fp = fopen($destination_path, "w+");

    $ch = curl_init($file_url);
    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_exec($ch);
    $st_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    fclose($fp);

    if($st_code == 200) {

    }
    else {
        $error = [
            'status' => 'error download file',
            'message' => 'failed download file'
        ];
        $logs_model = new \App\Models\Logs_cronjob_model();
        $logs_model->insert($error);
    }
    // shell_exec('curl -o "'.$destination_path.'" "'.$file_url.'"');
}

//connect to create reporting endpoint
//return id report
function create_reporting($id_user, $token, $rollUp='hour')
{
    if ($rollUp == 'hour')
        $callbackUrl = base_url('Reporting/HandleReport/'.$id_user);
    else
        $callbackUrl = base_url('Reporting/HandleReport/'.$id_user.'/daily');
    $startDate = date('Y-m-d', strtotime("-1 day"));
    $endDate = $startDate;
    $url = 'https://api-v2.smadex.com/analytics/reports/async';
    $body = '{
        "callbackUrl": "'.$callbackUrl.'",
        "dimensions": [
          "campaign_id","campaign_name","creative_id","creative_name","creative_size","inventory_id","inventory_name","exchange_name"
        ],
        "endDate": "'.$endDate.'",
        "format": "csv",
        "metrics": [
          "impressions","clicks","views","completed_views","ctr"
        ],
        "rollUp": "'.$rollUp.'",
        "startDate": "'.$startDate.'"
      }';

    $response = null;
    $counter = 0;
    do {
        $response = connectAPI('POST', $url, $token, $body);
        if($response && $response->getStatusCode() == 200) {
            break;
        }
        $counter++;
    } while ($counter < 10);

    if ($response == null || $response->getStatusCode() >= 400) {
        $error = [
            'status' => 'error create reporting',
            'message' => ($response) ? $response->getStatusCode().' account:'.$id_user : 'response null'
        ];
        $logs_model = new \App\Models\Logs_cronjob_model();
        $logs_model->insert($error);
        return false;
    }

    return json_decode($response->getBody())->id.' cal:'.$callbackUrl;
}

//get report by id report
//return report data
function get_reporting($token, $id_report)
{
    $url = 'https://api-v2.smadex.com/analytics/reports/async/'.$id_report;
    $response = null;
    $counter = 0;
    do {
        $response = connectAPI('GET', $url, $token);
        if($response && $response->getStatusCode() == 200) {
            break;
        }
        $counter++;
    } while ($counter < 5);

    if ($response == null || $response->getStatusCode() >= 400) {

        $error = [
            'status' => 'error get reporting',
            'message' => ($response) ? $response->getStatusCode().' id:'.$id_report.' cre:'.$token : 'response null'
        ];
        $logs_model = new \App\Models\Logs_cronjob_model();
        $logs_model->insert($error);
        return false;
    }
    return json_decode($response->getBody());
}

function importCSV($path_file, $table)
{
    $user = 'fykfaumy_root';
    $p = 'mysql fykfaumy_reporting --user='.escapeshellarg($user).'  --password='.escapeshellarg($user).' -e "LOAD DATA LOCAL INFILE '.escapeshellarg($path_file)." INTO TABLE ".$table." FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\\\"' LINES TERMINATED BY '\\n' IGNORE 1 ROWS\"";
    shell_exec($p);
}

function dum($var)
{
    echo '<pre>';
    echo var_dump($var);
    echo '</pre>';
    die();
}