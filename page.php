<?php
/*
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

////////////////////////////////////////////////////////////////////////////////
///
/// \fn getHeader($refresh)
///
/// \param $refresh - bool for adding code to refresh page
///
/// \return string of html to go before the main content
///
/// \brief builds the html that goes before the main content
///
////////////////////////////////////////////////////////////////////////////////
require_once("Mustache/Autoloader.php");
Mustache_Autoloader::register();

function getHeader($refresh) {
	global $user, $mode, $authed, $locale, $VCLversion;
    $data = array(
        "version" => $VCLversion,
        "authed" => $authed,
        "cookieDomain" => COOKIEDOMAIN,
        "lang" => $locale,
        "usenls" => (preg_match('/^en/', $locale) ? 0 : 1),
        "userWidth" => ($user && $user['width'] ? intval($user['width']) : 0),
        "userHeight" => ($user && $user['height'] ? intval($user['height']) : 0),
        "home" => HOMEURL,
        "dojo" => getDojoHTML($refresh),
        "refresh" => $refresh,
        "css" => getExtraCSS(),
        "help" => HELPURL
    );

    $menu = getNavMenu(1,1);
    $items = preg_split("|</li>\s*|", $menu);
    $menu_items = array();
    $selected = "";
    $remove = array("HOME", "User Preferences", "Documentation", "Logout");
    $reservation = array("New Reservation", "Current Reservations", "Block Allocations");
    $management = array("Manage Groups", "Manage Images", "Manage Schedules", 
                        "Manage Computers", "Management Nodes", "Server Profiles", "View Time Table",
                        "User Lookup", "Privileges", "Virtual Hosts", "Site Maintenance");
    $reporting = array("Dashboard", "Statistics");
    $reservation_items = array();
    $management_items = array();
    $reporting_items = array();

    $selected = "";
    foreach ($items as $i) {
        if (preg_match("|href=\"([^\"]+)\"[^>]*>([^<]+)</a>|i", $i, $matches)) {
            if (!in_array($matches[2], $remove)) {
                if (in_array( $matches[2], $reservation )) {
                    array_push($reservation_items, array("url" => $matches[1], "label" => $matches[2]));
                    if (preg_match("|<li class=[\"']?selected['\"]?|", $i))
                        $selected = "reservations";
                } else if (in_array( $matches[2], $reporting )) {
                    array_push($reporting_items, array("url" => $matches[1], "label" => $matches[2]));
                    if (preg_match("|<li class=['\"]?selected['\"]?|", $i))
                        $selected = "reporting";
                } else {
                    array_push($management_items, array("url" => $matches[1], "label" => $matches[2]));
                    if (preg_match("|<li class=['\"]?selected['\"]?|", $i))
                        $selected = "management";
                }
            }
        }
    }
    
    if (count($reservation_items)) {
        $data['reservation'] = array(
            "selected" => ($selected == "reservations" ? "selected" : ""),
            "items" => $reservation_items);
    }
    if (count($management_items)) {
        $data['management'] = array(
            "selected" => ($selected == "management" ? "selected" : ""),
            "items" => $management_items);
    }
    if (count($reporting_items)) {
        $data['reporting'] = array(
            "selected" => ($selected == "reporting" ? "selected" : ""),
            "items" => $reporting_items);
    }

    $m = new Mustache_Engine;
    return $m->render(file_get_contents(dirname(__FILE__) . '/templates/header.tpl'), $data);
}

////////////////////////////////////////////////////////////////////////////////
///
/// \fn getFooter()
///
/// \return string of html to go after the main content
///
/// \brief builds the html that goes after the main content
///
////////////////////////////////////////////////////////////////////////////////
function getFooter() {
    $m = new Mustache_Engine;
    return $m->render(file_get_contents(dirname(__FILE__) . '/templates/footer.tpl'));
}

