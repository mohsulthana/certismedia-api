<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->get('/report/impression', 'Report::impression');
$routes->get('/report/click', 'Report::click');
$routes->get('/report/conversion', 'Report::conversion');
$routes->get('/report/view', 'Report::view');
$routes->get('/report/first_quartile', 'Report::first_quartile');
$routes->get('/report/mid_point', 'Report::mid_point');
$routes->get('/report/third_quartile', 'Report::third_quartile');
$routes->get('/report/completed', 'Report::completed');
$routes->post('/login', 'Authentication::login');
$routes->post('/register', 'Authentication::register');

$routes->resource('impression');
$routes->resource('click');
$routes->resource('conversion');
$routes->resource('views');
$routes->resource('midpoint');
$routes->resource('firstquartile');
$routes->resource('thirdquartile');
$routes->resource('completedview');
$routes->resource('dashboard');
$routes->resource('reporting');

// CLI Routes
// $routes->cli('')

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
