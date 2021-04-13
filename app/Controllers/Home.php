<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
class Home extends BaseController
{
	public function index()
	{
		return view('welcome_message');
	}
	
	public function test()
	{
	    return  $this->setResponseFormat('json')->respond(['ha' => 'hahah'], 200);
	}
	
	public function pos()
	{
	    $test = $this->request->getPost('aha');
	    print_r($test);
	    return $test;
	}

	public function options(): Response
	{
		return $this->response->setHeader('Access-Control-Allow-Origin', '*') //for allow any domain, insecure
			->setHeader('Access-Control-Allow-Headers', '*') //for allow any headers, insecure
			->setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE') //method allowed
			->setStatusCode(200); //status code
	}
	
	public function setResponse($body = null, $statusCode = 200): Response
    {
        if (is_null($body)) {
            $body = null;
        } elseif (!is_string($body)) {
            $body = $this->format($body);
        } else {
            $body = '"' . $body . '"';
        }

        $this->response->setHeader('Access-Control-Allow-Origin', '*')
            ->setHeader('Access-Control-Allow-Headers', '*')
            ->setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
        return $this->respond($body, $statusCode);
    }
}
