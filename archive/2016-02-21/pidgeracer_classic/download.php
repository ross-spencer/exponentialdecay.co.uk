<?php

	include_once('lib/download_class.php');
	$downloads = new DownloadStats();
	$downloads->sendFile();

?>