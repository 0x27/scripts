<?php
if(isset($_POST["id"]) && isset($_POST["url"]))
{
	$theid = $_POST["id"];
	$theurl = $_POST["url"];
	$cmd = 'python cgi-bin/vpsnipe.py '. $theurl . " " . $theid;
	$results = shell_exec($cmd);
	echo "Snipping File <br />";
	echo "Zipping File <br />";
	echo $results;
}
else
{
	echo "Null";
}
?>
