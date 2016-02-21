<?php

	include_once('xmllib/xmllib.php');

	class DownloadStats
	{
		public $log_file = 'logs/access_log.txt';
		public $exe_file = 'exe/PidgeRacer_MKII.2.6.9.exe';
		public $stats_file = 'stats/stats.xml';

		/*********************************************************************
		*
		* Function		:  
		*
		* Description	: 
		*
		* parameters	: 	
		*          
		* Returns		:  
		*
		*********************************************************************/
		function sendFile()
		{
			$file = $this->exe_file;

			if (file_exists($file)) 
			{
				$this->countDownloads();
				$this->logAccess();
			
				header('Content-Description: File Transfer');
				header('Content-Type: application/octet-stream');
				header('Content-Disposition: attachment; filename='.basename($file));
				header('Content-Transfer-Encoding: binary');
				header('Expires: 0');
				header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
				header('Pragma: public');
				header('Content-Length: ' . filesize($file));
				ob_clean();
				flush();
				readfile($file);
			}
		}
	
		/*********************************************************************
		*
		* Function		:  
		*
		* Description	: 
		*
		* parameters	: 	
		*          
		* Returns		:  
		*
		*********************************************************************/
		function countDownloads()
		{
			$downloads = $this->getDownloads();
			$downloads+=1;
		
			$xml = new XMLHelper();
			$stats = $xml->newDOMDocument();
					
			$root = $xml->xmlCreateElement('stats', $stats, $stats);
			$xml->xmlCreateTextElement('downloads', $downloads, $stats, $root);
			
			$stats_xml = $stats->saveXML();
			
			$this->writeStatsFile($stats_xml);
		}

		/*********************************************************************
		*
		* Function		:  
		*
		* Description	: 
		*
		* parameters	: 	
		*          
		* Returns		:  
		*
		*********************************************************************/
		function getDownloads()
		{
			$statsfile = $this->stats_file;
			
			$xml = new DOMDocument();
			$loaded = $xml->load($this->stats_file);
			
			if($loaded === False)
			{
				return 0;
			}
			else
			{
				$downloads = $xml->getElementsByTagName('downloads');
				return $downloads->item(0)->nodeValue;
			}
		}

		/*********************************************************************
		*
		* Function		:  
		*
		* Description	: 
		*
		* parameters	: 	
		*          
		* Returns		:  
		*
		*********************************************************************/
		function writeStatsFile($stats_xml)
		{
			$stats_file = fopen($this->stats_file, "w");
			fwrite($stats_file, $stats_xml);
			fclose($stats_file);		
		}	

		/*********************************************************************
		*
		* Function		:  logAccess()
		*
		* Description	: 	Log access to service. Return method required to
		*						determine behavior of rest of function.
		*
		* parameters	: 	n/a
		*          
		* Returns		:  $method - Request method GET or POST
		*
		*********************************************************************/
		function logAccess()
		{
			//HTTP header information to return to custom error log
			$time = date("M j G:i:s Y"); 
			$ip = getenv('REMOTE_ADDR');
			$userAgent = getenv('HTTP_USER_AGENT');
			$referrer = getenv('HTTP_REFERER');
			$query = getenv('QUERY_STRING');

			//Request Method: If POST - Handle Webservice, IF GET - return HTML
			$method = getenv('REQUEST_METHOD');

			//Create an ACCESS LOG string
			$ACCESS_LOG = "IP: " . $ip . "  TIME: " . $time . "  METHOD: " . $method . "  USERAGENT: " . $userAgent;		
			
			//log the request to the 
			$this->log_err($ACCESS_LOG);
		}
		
		
		/*********************************************************************
		*
		* Function		:  
		*
		* Description	: 
		*
		* parameters	: 	
		*          
		* Returns		:  
		*
		*********************************************************************/
		function log_err($string)
		{
			$log_name = $this->log_file;
			$size_bytes = 10485760;		//10MB
		
			if (file_exists($log_name))
			{
				if(filesize($log_name) >= $size_bytes)
				{
					if(file_exists($log_name . '.old'))
					{
						unlink($log_name . '.old');	//warning when file still exists so unlink first
					}
					rename($log_name, $log_name . '.old');
					unlink($log_name);
				}
			}
		
			$log_file = fopen($log_name, "a");
			fwrite($log_file, "$string\r\n");
			fclose($log_file);
		}
	}


?>