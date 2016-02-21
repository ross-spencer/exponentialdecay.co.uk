<?php

	include_once('lib/download_class.php');
	$downloads = new DownloadStats();
	
	print "<html><body>";
	print "<p style='font-family: arial; font-size: 14;'>Pidgeracer Downloaded: <b>" . $downloads->getDownloads() . "</b> times.</p>";
	print "</body></html>";

?>